% =====================================================================
% 基4旋轉因子
% =====================================================================
N1 = 1024;
k1 = 0:255;

W_p  = exp(-2j*pi*k1/N1);
W_2p = exp(-2j*pi*2*k1/N1);
W_3p = exp(-2j*pi*3*k1/N1);
% 實部與虛部
real_p  = real(W_p);   imag_p  = imag(W_p);
real_2p = real(W_2p);  imag_2p = imag(W_2p);
real_3p = real(W_3p);  imag_3p = imag(W_3p);

% =====================================================================
% Q2.14 定點格式 (1 sign + 1 integer + 14 fractional bits)
% =====================================================================
scale = 2^14;  

real_fixed_p  = int16(round(real_p  * scale));
imag_fixed_p  = int16(round(imag_p  * scale));
real_fixed_2p = int16(round(real_2p * scale));
imag_fixed_2p = int16(round(imag_2p * scale));
real_fixed_3p = int16(round(real_3p * scale));
imag_fixed_3p = int16(round(imag_3p * scale));


function writeTwiddleFile(fname, real_vec_int16, imag_vec_int16)
    fid = fopen(fname,'w');
    n = length(real_vec_int16);
    for ii = 1:n
        re_i16 = int16(real_vec_int16(ii));
        im_i16 = int16(imag_vec_int16(ii));
        re_u16 = typecast(re_i16, 'uint16'); 
        im_u16 = typecast(im_i16, 'uint16');
        combined = uint32(re_u16) * uint32(2^16) + uint32(im_u16);
        fprintf(fid, '%s\n', dec2bin(combined, 32)); % 32-bit字串
    end
    fclose(fid);
end


writeTwiddleFile('R4_Wp.txt',  real_fixed_p,  imag_fixed_p);
writeTwiddleFile('R4_W2p.txt', real_fixed_2p, imag_fixed_2p);
writeTwiddleFile('R4_W3p.txt', real_fixed_3p, imag_fixed_3p);

% =====================================================================
% 基2旋轉因子
% =====================================================================
N2 = 2048;
k2 = 0:511;

% 基2旋轉因子
W_r2 = exp(-2j*pi*k2/N2);

% 實部與虛部
real_r2 = real(W_r2);
imag_r2 = imag(W_r2);

% 轉換為 Q2.14 定點格式
real_fixed_r2 = int16(round(real_r2 * scale));
imag_fixed_r2 = int16(round(imag_r2 * scale));

% =====================================================================
% 寫出 N=2048 的基2旋轉因子檔案
% =====================================================================
writeTwiddleFile('R2_Wp.txt', real_fixed_r2, imag_fixed_r2);
