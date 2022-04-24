RGB = imread('C:\Users\Computing\Downloads\skin lesion dataset\org data\ISIC_0000074.jpg');
hsv=rgb2hsv(RGB);
gray=graythresh(hsv);
BW=imbinarize(gray);
se=strel('disk',2);
Im_hsv_dil=imerode(BW,se);
    
se=strel('disk',2);
IM_seg=imdilate(Im_hsv_dil,se);
[L,n]=bwlabel(IM_seg);
imshow(IM_seg)