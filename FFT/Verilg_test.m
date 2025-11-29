clear; close all; clc;
N = 2048;                
fs = 2048;   

t = (0:N-1)/fs;

signal = cos(2*pi*600*t) + cos(2*pi*1000*t);
noise_power = 0.3;  
noise = noise_power * randn(1, N);
x_complex = signal + 0*1i + noise;


verilog_data = read_verilog_output('verilog_output.txt', N, 26, 8);
X_fixed_2048 = verilog_data;

X_float = fft(x_complex, N);

magnitude_float = abs(X_float);
magnitude_fixed = abs(X_fixed_2048);


power_float = sum(magnitude_float.^2);
power_fixed = sum(magnitude_fixed.^2);
avg_scaling = sqrt(power_float / power_fixed);

magnitude_fixed_scaled = magnitude_fixed * avg_scaling;


figure('Position', [100, 100, 1200, 500]);
subplot(1,2,1);
plot(0:N-1, magnitude_float, 'b-', 'LineWidth', 1.5);
title('MATLAB FFT', 'FontSize', 14, 'FontWeight', 'bold');
xlabel('頻率點');
ylabel('幅度');
grid on;
xlim([0, N-1]);
ylim([0, max(magnitude_float)*1.1]);

subplot(1,2,2);
plot(0:N-1, magnitude_fixed_scaled, 'r-', 'LineWidth', 1.5);
title('Verilog FFT', 'FontSize', 14, 'FontWeight', 'bold');
xlabel('頻率點');
ylabel('幅度');
grid on;
xlim([0, N-1]);
ylim([0, max(magnitude_float)*1.1]);



function data = read_verilog_output(filename, N, bit_width, scale_bits)   
    scale_factor = 2^scale_bits;
   
    fid = fopen(filename, 'r');
    file_content = textscan(fid, '%s', 'Delimiter', '\n');
    fclose(fid);
    
    lines = file_content{1};
    
    
    data = complex(zeros(N, 1));
    
    for i = 1:N
        line = strtrim(lines{i});
        
        real_bin = line(1:bit_width);
        imag_bin = line(bit_width+1:end);
        
        real_val = twos_complement_to_int(real_bin);
        imag_val = twos_complement_to_int(imag_bin);
        
        real_float = double(real_val) / scale_factor;
        imag_float = double(imag_val) / scale_factor;
        
        data(i) = complex(real_float, imag_float);
    end
    
end

function decimal_val = twos_complement_to_int(binary_str)
    
    n = length(binary_str);
    
    if binary_str(1) == '1'
        inverted = '';
        for j = 1:n
            if binary_str(j) == '0'
                inverted = [inverted, '1'];
            else
                inverted = [inverted, '0'];
            end
        end
        decimal_val = - (bin2dec(inverted) + 1);
    else
        decimal_val = bin2dec(binary_str);
    end
end