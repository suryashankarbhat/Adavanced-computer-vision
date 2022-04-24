j = imread('C:\Users\Computing\Downloads\skin lesion dataset\org data\ISIC_0000034.jpg');
hsv=rgb2gray(RGB);

BW=imbinarize(hsv);
se=strel('disk',10); 
