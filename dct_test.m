
close all; 
I1=imread('phone.jpg');   %读入原图像文件 
I1=rgb2gray(I1);%将原图像转换成灰色图像 
I1_dct=dct2(I1);%对原图像进行二维DCT变换 
% fs=fftshift(I1_dct);%将直流分量移到频谱中心 

figure(1);
subplot(121); 
imshow(I1); 
title('灰色图像'); %显示灰色图像 
subplot(122);  
imshow(log(abs(I1_dct)),[]),colorbar; 
title('图像经DCT变换后能量分布情况') %显示经过dct变换后能量分布; 

figure(2); 
mesh(fs); 
title('三维频谱'); %显示三维频谱


I2=imread('original.jpg');   %读入原图像文件 
I2=rgb2gray(I2);%将原图像转换成灰色图像 
I2_dct=dct2(I2);%对原图像进行二维DCT变换 
% fs=fftshift(I2_dct);%将直流分量移到频谱中心 

figure(3);
subplot(121); 
imshow(I2); 
title('灰色图像'); %显示灰色图像 
subplot(122);  
imshow(log(abs(I2_dct)),[]),colorbar; 
title('图像经DCT变换后能量分布情况') %显示经过dct变换后能量分布; 

figure(4); 
mesh(fs); 
title('三维频谱'); %显示三维频谱


diff = I2_dct-I1_dct;
figure(5)
imshow(log(abs(diff)),[]),colorbar; 