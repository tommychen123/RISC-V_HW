clear all;
clc;
Image = imread('Lena.bmp');%读取.bmp文件
gray=rgb2gray(Image);
imshow(gray)
[r,c]=size(gray);
format hex
fid=fopen('C:\Users\Asus\Desktop\cny\lena_output.txt','wt');
COUNT=fprintf(fid,'%x ',gray');
fclose(fid);