I1=imread('C:\Users\Computing\Downloads\skin lesion dataset\GT\ISIC_0000011_Segmentation.png');
I2=imread('C:\Users\Computing\Downloads\skin lesion dataset\TEST\ISIC_0000011segmented.jpg');
I = rgb2gray(I2);
mask = false(size(I));
mask(25:end-25,25:end-25) = true;
BW = activecontour(I, mask, 300);
BW_groundTruth =imread('C:\Users\Computing\Downloads\skin lesion dataset\GT\ISIC_0000011_Segmentation.png');
similarity = dice(BW, BW_groundTruth)
figure
imshowpair(BW, BW_groundTruth)
title(['Dice Index = ' num2str(similarity)])