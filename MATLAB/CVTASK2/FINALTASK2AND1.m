 %Prepare image
I = imread('C:\Users\Computing\Downloads\ImgPIA.jpg'); 
f = rgb2gray(I);


% Compute Fourier Transform
F = fft2(f,256,256);
figure;
imshow(F);
F = fftshift(F) % Center FFT
figure;
imshow(F);
% Measure the minimum and maximum value of the transform amplitude
min(min(abs(F)))
max(max(abs(F)))
figure;
imshow(abs(F),[0 100]); colormap(jet); colorbar
figure;
imshow(log(1+abs(F)),[0,1]); colormap(jet); colorbar
% Look at the phases
figure;
imshow(angle(F),[-pi,pi]); colormap(jet); colorbar


% I = ifft2(F, 256, 256);
% figure;
% imshow(I);

F = fft2(f,256,256);
figure;
imshow(F);
I = ifft2(F, 256, 256);
figure;
imshow(I);
angle=0;
Result = imrotate(I,angle);

