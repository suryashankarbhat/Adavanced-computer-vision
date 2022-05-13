% referenced from class work shop 8
%for 90 degree
I = imread('ImgPIA.jpg');
F = rgb2gray(I);
%for the angle of 90
F=imrotate(F,90)
% inverse using fourier transform
F = fft2(F,256,256);

figure;
imshow(F)
title(' fourier transform image for 90 degree');
F = fftshift(F); % Center FFT which rearranges the fourier transform
figure;
imshow(F)
title('rearranged fourier transform image for 90 degree');
% F=im2double(F)
% % Measure the minimum and maximum value of the transform amplitude
% min(min(abs(F)))
% max(max(abs(F)))
  figure;
 imshow(abs(F)),[0 100]; colormap(jet); colorbar
 title('absolute value applied image for 90 degree')
figure;
% applying logarithmic function to the fourier transform image with offset
% [2,3](to extract feature for diffrent radius)

imshow(log(1+abs(double(F))),[2,3]); colormap(jet); colorbar
title('log applied image with offset [2,3] for 90 degree');
figure;
imshow(angle(double(F)),[-pi,pi]); colormap(jet); colorbar
title('angle applied image with offset [2,3] for 90 degree');
figure;
%appying logarithmic function for fourier transform imagewith offset [0,3]
imshow(log(1+abs(double(F))),[0,3]); colormap(jet); colorbar
title('log applied image with offset [0,3] for 90 degree');
figure;
imshow(angle(double(F)),[-pi,pi]);colorbar
title('angle applied image with offset[0,3] for 90 degree');

F=rgb2gray(I)
F=imrotate(F,90);
F=fft2(F,256,256);

figure;
imshow(ifft2(F,256,256))
title('inverse fourier transformed image for 90 degree');





%for 180 degree
I = imread('ImgPIA.jpg');
F = rgb2gray(I);

 F=imrotate(F,180)
% inverse using fourier transform
F = fft2(F,256,256);

figure;
imshow(F)
title(' fourier transform image for 180 degree');
F = fftshift(F); % Center FFT which rearranges the fourier transform
figure;
imshow(F)
title('rearranged fourier transform image for 180 degree');
% F=im2double(F)
% % Measure the minimum and maximum value of the transform amplitude
% min(min(abs(F)))
% max(max(abs(F)))
  figure;
 imshow(abs(F)),[0 100]; colormap(jet); colorbar
 title('absolute value applied image for 180 degree')
figure;
% applying logarithmic function to the fourier transform image with offset
% [2,3](to extract feature for diffrent radius)

imshow(log(1+abs(double(F))),[2,3]); colormap(jet); colorbar
title('log applied image with offset [2,3] for 180 degree');
figure;
imshow(angle(double(F)),[-pi,pi]); colormap(jet); colorbar
title('angle applied image with offset [2,3] for 180 degree');
figure;
%appying logarithmic function for fourier transform imagewith offset [0,3]
imshow(log(1+abs(double(F))),[0,3]); colormap(jet); colorbar
title('log applied image with offset [0,3] for 180 degree');
figure;
imshow(angle(double(F)),[-pi,pi]);colorbar
title('angle applied image with offset[0,3] for 180 degree');

F=rgb2gray(I)

F=fft2(F,256,256)
figure;
imshow(ifft2(F,256,256))
title('inverse fourier transformed image for 180 degree');









