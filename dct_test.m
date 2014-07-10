
close all; 
I1=imread('phone.jpg');   %����ԭͼ���ļ� 
I1=rgb2gray(I1);%��ԭͼ��ת���ɻ�ɫͼ�� 
I1_dct=dct2(I1);%��ԭͼ����ж�άDCT�任 
% fs=fftshift(I1_dct);%��ֱ�������Ƶ�Ƶ������ 

figure(1);
subplot(121); 
imshow(I1); 
title('��ɫͼ��'); %��ʾ��ɫͼ�� 
subplot(122);  
imshow(log(abs(I1_dct)),[]),colorbar; 
title('ͼ��DCT�任�������ֲ����') %��ʾ����dct�任�������ֲ�; 

figure(2); 
mesh(fs); 
title('��άƵ��'); %��ʾ��άƵ��


I2=imread('original.jpg');   %����ԭͼ���ļ� 
I2=rgb2gray(I2);%��ԭͼ��ת���ɻ�ɫͼ�� 
I2_dct=dct2(I2);%��ԭͼ����ж�άDCT�任 
% fs=fftshift(I2_dct);%��ֱ�������Ƶ�Ƶ������ 

figure(3);
subplot(121); 
imshow(I2); 
title('��ɫͼ��'); %��ʾ��ɫͼ�� 
subplot(122);  
imshow(log(abs(I2_dct)),[]),colorbar; 
title('ͼ��DCT�任�������ֲ����') %��ʾ����dct�任�������ֲ�; 

figure(4); 
mesh(fs); 
title('��άƵ��'); %��ʾ��άƵ��


diff = I2_dct-I1_dct;
figure(5)
imshow(log(abs(diff)),[]),colorbar; 