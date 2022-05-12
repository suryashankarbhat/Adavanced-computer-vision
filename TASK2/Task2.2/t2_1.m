% % Compute Fourier Transform
% I = imread('C:\Users\Computing\Downloads\ImgPIA.jpg');
% F = rgb2gray(I);
% F = ifft2(F,256,256);
% figure;
% imshow(F);
% F = fftshift(F); % Center FFT
% figure;
% imshow(F);
% % F=im2double(F)
% % Measure the minimum and maximum value of the transform amplitude
% min(min(abs(F)))
% max(max(abs(F)))
% figure;
% imshow(abs(F)),[0 100]; colormap(jet); colorbar
% figure;
% % X=im2double(1+abs(F))
% imshow(log(1+abs(double(F))),[2,3]); colormap(jet); colorbar
% figure;
% imshow(angle(double(F)),[0,pi]); colormap(jet); colorbar
% F = fft2(I,256,256);
% figure;
% imshow(F);
% I = ifft2(F, 256, 256);
% figure;
% imshow(I)
% Result = imrotate(F,angle);
imshow(log(1+abs(double(F))),[0,3]); colormap(jet); colorbar
figure;
imshow(angle(double(F)),[-pi,pi]); colormap(jet); colorbar
% for angle 90
I = imread('C:\Users\Computing\Downloads\ImgPIA.jpg');
F = rgb2gray(I);
F=imrotate(F,90)
F = ifft2(F,256,256);
figure;
imshow(F);
F = fftshift(F); % Center FFT
figure;
imshow(F);
% F=im2double(F)
% Measure the minimum and maximum value of the transform amplitude
min(min(abs(F)))
max(max(abs(F)))
figure;
imshow(abs(F)),[0 100]; colormap(jet); colorbar
figure;
% X=im2double(1+abs(F))
imshow(log(1+abs(double(F))),[2,3]); colormap(jet); colorbar
figure;
imshow(angle(double(F)),[-pi,pi]); colormap(jet); colorbar
% F = fft2(I,256,256);
% figure;
% imshow(F);
% I = ifft2(F, 256, 256);
% figure;
% imshow(I)
% Result = imrotate(F,angle);
imshow(log(1+abs(double(F))),[0,3]); colormap(jet); colorbar


% for angle 90

