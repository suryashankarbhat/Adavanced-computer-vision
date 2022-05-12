% Compute Fourier Transform
F = imread('C:\Users\Computing\Downloads\ImgPIA.jpg');
figure;
imshow(F);
F = fftshift(F); % Center FFT
figure;
imshow(F);
% Measure the minimum and maximum value of the transform amplitude
min(min(abs(F)))
max(max(abs(F)))
figure;
imshow(abs(F),[0 100]); colormap(jet); colorbar
figure;
imshow(log(1+abs(F)),[0,3]); colormap(jet); colorbar
% Look at the phases
figure;
imshow(angle(F),[-pi,pi]); colormap(jet); colorbar