clear; close all; clc;

N = 2048;                
fs = 2048;               
Q_format = 8;  
scale_factor_input = 2^Q_format;


t = (0:N-1)/fs;
signal = sin(2*pi*100*t) + sin(2*pi*200*t) + sin(2*pi*300*t) + sin(2*pi*400*t);
x_complex = signal + 0*1i;

float_to_Q88 = @(data) int16(max(min(round(data*scale_factor_input), 32767), -32768));
real_fixed = float_to_Q88(real(x_complex));
imag_fixed = float_to_Q88(imag(x_complex));

fid = fopen('input_data_binary.txt','w');
for i = 1:N
    real_bin = dec2bin(typecast(real_fixed(i), 'uint16'),16);
    imag_bin = dec2bin(typecast(imag_fixed(i), 'uint16'),16);
    fprintf(fid,'%s%s\n', real_bin, imag_bin);
end
fclose(fid);

input_quant = struct('bits', 16, 'frac_bits', 8);
mult_quant = struct('bits', 16, 'frac_bits', 8);
add_quant = struct('bits', 16, 'frac_bits', 8);
output_quant = struct('bits', 16, 'frac_bits', 8);

signal_q88 = double(real_fixed)/scale_factor_input + 1j*double(imag_fixed)/scale_factor_input;

even_idx = 1:2:N;    
odd_idx = 2:2:N;     

x_even = signal_q88(even_idx);  
x_odd = signal_q88(odd_idx);  

even_original_indices = even_idx;
odd_original_indices = odd_idx;

[X_even, even_original_indices_out, even_calc_details] = fft_fixed_radix4_1024_detailed(x_even, even_original_indices, input_quant, mult_quant, add_quant, output_quant, 'even', true);
[X_odd, odd_original_indices_out, odd_calc_details] = fft_fixed_radix4_1024_detailed(x_odd, odd_original_indices, input_quant, mult_quant, add_quant, output_quant, 'odd', true);

save_calculation_details(even_calc_details, 'even', 'radix4');
save_calculation_details(odd_calc_details, 'odd', 'radix4');

[X_fixed_2048, radix2_calc_details] = radix2_combine_2048_detailed(X_even, X_odd, even_original_indices_out, odd_original_indices_out, input_quant, mult_quant, add_quant, output_quant, true);

save_calculation_details({radix2_calc_details}, 'radix2', 'radix2');

X_float = fft(x_complex, N);

f = (0:N-1)*fs/N;
magnitude_float = abs(X_float);
magnitude_fixed = abs(X_fixed_2048);

figure('Position', [100, 100, 1200, 800]);

subplot(1,2,1);
plot(f(1:N/2), magnitude_float(1:N/2));
title('浮點FFT頻譜');
xlabel('頻率 (Hz)');
ylabel('幅度');
grid on;
xlim([0, fs/2]);

 
subplot(1,2,2);
plot(f(1:N/2), magnitude_fixed(1:N/2));
title('定點FFT頻譜');
xlabel('频率 (Hz)');
ylabel('幅度');
grid on;
xlim([0, fs/2]);

files = {
    'input_data_binary.txt - (16bit實部+16bit虚部)'
    'even_stage_1_radix4_calc_details.txt - 偶數序列第1級基4'
    'even_stage_2_radix4_calc_details.txt - 偶數序列第2級基4' 
    'even_stage_3_radix4_calc_details.txt - 偶數序列第3級基4'
    'even_stage_4_radix4_calc_details.txt - 偶數序列第4級基4'
    'even_stage_5_radix4_calc_details.txt - 偶數序列第5級基4'
    'odd_stage_1_radix4_calc_details.txt - 奇數序列第1級基4'
    'odd_stage_2_radix4_calc_details.txt - 奇數序列第2級基4'
    'odd_stage_3_radix4_calc_details.txt - 奇數序列第3級基4'
    'odd_stage_4_radix4_calc_details.txt - 奇數序列第4級基4'
    'odd_stage_5_radix4_calc_details.txt - 奇數序列第5級基4'
    'radix2_stage_1_radix2_calc_details.txt - 第6級基2'
};

for i = 1:length(files)
    fprintf('%d. %s\n', i, files{i});
end



function [X, original_indices_out, all_calc_details] = fft_fixed_radix4_1024_detailed(x, original_indices, input_quant, mult_quant, add_quant, output_quant, prefix, use_scaling)
    N = length(x);
    
    original_idx_map = original_indices;
    
    % 基4逆序
    bit_rev_idx = bitrevorder_radix4_1024(N);
    x_ordered = x(bit_rev_idx);
    original_idx_ordered = original_idx_map(bit_rev_idx); 
    
    stages = 5;
    current_data = x_ordered;
    current_original_indices = original_idx_ordered; 
    
    if use_scaling
        scale_factor = 0.25;  
    else
        scale_factor = 1.0;   
    end
    
    all_calc_details = cell(5, 1); 
    
    for stage = 1:stages
        group_size = 4^stage;      % 4, 16, 64, 256, 1024
        groups = N / group_size;   % 256, 64, 16, 4, 1
        
        next_data = complex(zeros(N,1));
        next_original_indices = zeros(1, N);
        stage_calc_details = cell(groups * (group_size/4), 1);
        detail_idx = 1;
        
        for group = 0:groups-1
            base_idx = group * group_size;
            
            k = 0:group_size/4-1;
            W = exp(-1j*2*pi*k/group_size);
            W1 = quantize(input_quant, W);
            W2 = quantize(input_quant, W.^2);
            W3 = quantize(input_quant, W.^3);
            
            for j = 1:group_size/4
                idx = base_idx + j;
                idx1 = idx;
                idx2 = idx + group_size/4;
                idx3 = idx + 2*group_size/4;
                idx4 = idx + 3*group_size/4;
                
                original_idx1 = current_original_indices(idx1);
                original_idx2 = current_original_indices(idx2);
                original_idx3 = current_original_indices(idx3);
                original_idx4 = current_original_indices(idx4);
                
                [next_data(idx1), next_data(idx2), next_data(idx3), next_data(idx4), calc_detail] = ...
                    butterfly_fixed_radix4_detailed(...
                        current_data(idx1), current_data(idx2), current_data(idx3), current_data(idx4),...
                        W1(j), W2(j), W3(j),...
                        input_quant, mult_quant, add_quant, output_quant, scale_factor,...
                        stage, detail_idx, original_idx1, original_idx2, original_idx3, original_idx4);
                
                stage_calc_details{detail_idx} = calc_detail;
                detail_idx = detail_idx + 1;
                
                next_original_indices(idx1) = original_idx1;
                next_original_indices(idx2) = original_idx2;
                next_original_indices(idx3) = original_idx3;
                next_original_indices(idx4) = original_idx4;
            end
        end
        
        current_data = next_data;
        current_original_indices = next_original_indices;
        all_calc_details{stage} = stage_calc_details;
    end
    
    X = current_data;
    original_indices_out = current_original_indices; % 返回索引映射
end

function [X, calc_details] = radix2_combine_2048_detailed(X_even, X_odd, even_original_indices, odd_original_indices, input_quant, mult_quant, add_quant, output_quant, use_scaling)
    N_even = length(X_even);
    N_odd = length(X_odd);
    
    N = 2048;
    X = complex(zeros(N,1));
    
    scale_factor = 1.0;
    
    calc_details = cell(1024, 1);
    for k = 0:1023
        Wk = exp(-1j*2*pi*k/2048);
        Wk_quant = quantize(input_quant, Wk);
        
        output_idx1 = k + 1;
        output_idx2 = k + 1024 + 1;
        
        even_original_time_index = even_original_indices(k+1);  
        odd_original_time_index = odd_original_indices(k+1);    
        
        [X(output_idx1), X(output_idx2), calc_detail] = butterfly_fixed_radix2_detailed(...
            X_even(k+1), X_odd(k+1), Wk_quant,...
            input_quant, mult_quant, add_quant, output_quant, scale_factor,...
            6, k+1, output_idx1, output_idx2, even_original_time_index, odd_original_time_index, k); % 添加k值参数
        
        calc_details{k+1} = calc_detail;
    end
end

function y = quantize_q88(x)
    q = 1/256;
    max_val = 127 + 255/256;
    min_val = -128;
    
    if isreal(x)
        x = max(min(x, max_val), min_val);
        y = round(x / q) * q;
    else
        real_part = max(min(real(x), max_val), min_val);
        imag_part = max(min(imag(x), max_val), min_val);
        y = complex(round(real_part / q) * q, round(imag_part / q) * q);
    end
end

function y = quantize(mode, x)
    if isstruct(mode)
        y = quantize_q88(x);
    else
        y = x;
    end
end

function [X0, X1, X2, X3, calc_details] = butterfly_fixed_radix4_detailed(x0, x1, x2, x3, W1, W2, W3,...
                                                  input_quant, mult_quant, add_quant, output_quant, scale_factor,...
                                                  stage_num, butterfly_num, original_idx0, original_idx1, original_idx2, original_idx3)
    
    calc_details = struct();
    calc_details.stage = stage_num;
    calc_details.butterfly = butterfly_num;
    calc_details.original_indices = [original_idx0, original_idx1, original_idx2, original_idx3];
    calc_details.inputs = [x0, x1, x2, x3];
    calc_details.twiddles = [W1, W2, W3];
    
    term1 = quantize(mult_quant, x1 .* W1);
    term2 = quantize(mult_quant, x2 .* W2);
    term3 = quantize(mult_quant, x3 .* W3);
    
    calc_details.terms = [term1, term2, term3];
    
    X0 = quantize(add_quant, (x0 + term1 + term2 + term3) * scale_factor);
    X1 = quantize(add_quant, (x0 - 1j*term1 - term2 + 1j*term3) * scale_factor);
    X2 = quantize(add_quant, (x0 - term1 + term2 - term3) * scale_factor);
    X3 = quantize(add_quant, (x0 + 1j*term1 - term2 - 1j*term3) * scale_factor);
    
    calc_details.outputs = [X0, X1, X2, X3];
end

function [X_even, X_odd, calc_details] = butterfly_fixed_radix2_detailed(x_even, x_odd, Wk, input_quant, mult_quant, add_quant, output_quant, scale_factor,...
                                                  stage_num, butterfly_num, output_idx_even, output_idx_odd, even_original_index, odd_original_index, k_value)
    
    calc_details = struct();
    calc_details.stage = stage_num;
    calc_details.butterfly = butterfly_num;
    calc_details.k_value = k_value; 
    calc_details.output_indices = [output_idx_even, output_idx_odd];
    calc_details.input_original_indices = [even_original_index, odd_original_index]; % 记录输入的原始索引
    calc_details.inputs = [x_even, x_odd];
    calc_details.twiddle = Wk;
    
    term = quantize(mult_quant, x_odd .* Wk);
    calc_details.term = term;
    
    X_even = quantize(add_quant, (x_even + term) * scale_factor);
    X_odd = quantize(add_quant, (x_even - term) * scale_factor);
    
    calc_details.outputs = [X_even, X_odd];
end

function idx = bitrevorder_radix4_1024(N)
    
    bits = log2(N);
    idx = zeros(N,1);
    
    for k = 0:N-1
        bin_str = dec2bin(k, bits);
        base4_digits = [];
        for i = 1:2:bits
            two_bits = bin_str(i:i+1);
            base4_digit = bin2dec(two_bits);
            base4_digits = [base4_digit, base4_digits];
        end
        
        reversed_idx = 0;
        for i = 1:length(base4_digits)
            reversed_idx = reversed_idx * 4 + base4_digits(i);
        end
        
        idx(k+1) = reversed_idx + 1;
    end
end

function save_calculation_details(all_calc_details, prefix, stage_type)
    for stage = 1:length(all_calc_details)
        stage_details = all_calc_details{stage};
        if isempty(stage_details)
            continue;
        end
        
        filename = sprintf('%s_stage_%d_%s_calc_details.txt', prefix, stage, stage_type);
        fid = fopen(filename, 'w');
        
        fprintf(fid, '=== %s Stage %d %s Calculation Details ===\n\n', upper(prefix), stage, stage_type);
        
        for i = 1:length(stage_details)
            detail = stage_details{i};
            
            fprintf(fid, 'Butterfly %d (Stage %d):\n', detail.butterfly, detail.stage);
            fprintf(fid, '----------------------------------------\n');
            
            if stage_type == "radix4"
                fprintf(fid, '輸入 (原始索引):\n');
                fprintf(fid, '  x[%d] = %.8f + j%.8f\n', detail.original_indices(1), real(detail.inputs(1)), imag(detail.inputs(1)));
                fprintf(fid, '  x[%d] = %.8f + j%.8f\n', detail.original_indices(2), real(detail.inputs(2)), imag(detail.inputs(2)));
                fprintf(fid, '  x[%d] = %.8f + j%.8f\n', detail.original_indices(3), real(detail.inputs(3)), imag(detail.inputs(3)));
                fprintf(fid, '  x[%d] = %.8f + j%.8f\n\n', detail.original_indices(4), real(detail.inputs(4)), imag(detail.inputs(4)));
                
                fprintf(fid, '  W1 = %.8f + j%.8f\n', real(detail.twiddles(1)), imag(detail.twiddles(1)));
                fprintf(fid, '  W2 = %.8f + j%.8f\n', real(detail.twiddles(2)), imag(detail.twiddles(2)));
                fprintf(fid, '  W3 = %.8f + j%.8f\n\n', real(detail.twiddles(3)), imag(detail.twiddles(3)));
                
                fprintf(fid, '  x[%d] * W1 = %.8f + j%.8f\n', detail.original_indices(2), real(detail.terms(1)), imag(detail.terms(1)));
                fprintf(fid, '  x[%d] * W2 = %.8f + j%.8f\n', detail.original_indices(3), real(detail.terms(2)), imag(detail.terms(2)));
                fprintf(fid, '  x[%d] * W3 = %.8f + j%.8f\n\n', detail.original_indices(4), real(detail.terms(3)), imag(detail.terms(3)));
                
                fprintf(fid, '輸出 (原始索引):\n');
                fprintf(fid, '  y[%d] = %.8f + j%.8f\n', detail.original_indices(1), real(detail.outputs(1)), imag(detail.outputs(1)));
                fprintf(fid, '  y[%d] = %.8f + j%.8f\n', detail.original_indices(2), real(detail.outputs(2)), imag(detail.outputs(2)));
                fprintf(fid, '  y[%d] = %.8f + j%.8f\n', detail.original_indices(3), real(detail.outputs(3)), imag(detail.outputs(3)));
                fprintf(fid, '  y[%d] = %.8f + j%.8f\n\n', detail.original_indices(4), real(detail.outputs(4)), imag(detail.outputs(4)));
                
            else
                fprintf(fid, '旋轉因子索引 k = %d\n\n', detail.k_value);
                
                fprintf(fid, '輸入 (原始索引):\n');
                fprintf(fid, '  x[%d] = %.8f + j%.8f\n', detail.input_original_indices(1), real(detail.inputs(1)), imag(detail.inputs(1)));
                fprintf(fid, '  x[%d] = %.8f + j%.8f\n\n', detail.input_original_indices(2), real(detail.inputs(2)), imag(detail.inputs(2)));
                
                fprintf(fid, '  W[%d] = e^(-j·2π·%d/2048) = %.8f + j%.8f\n\n', ...
                    detail.k_value, detail.k_value, real(detail.twiddle), imag(detail.twiddle));
                
                fprintf(fid, '  x[%d] * W[%d] = %.8f + j%.8f\n\n', ...
                    detail.input_original_indices(2), detail.k_value, real(detail.term), imag(detail.term));
                
                fprintf(fid, '輸出 (最终索引):\n');
                fprintf(fid, '  Y[%d] = %.8f + j%.8f\n', detail.output_indices(1), real(detail.outputs(1)), imag(detail.outputs(1)));
                fprintf(fid, '  Y[%d] = %.8f + j%.8f\n\n', detail.output_indices(2), real(detail.outputs(2)), imag(detail.outputs(2)));
            end
            
            fprintf(fid, '\n');
        end
        
        fclose(fid);
    end
end
