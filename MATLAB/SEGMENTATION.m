

    I = imread('C:\Users\Computing\Downloads\skin lesion dataset\org data\ISIC_0000011.jpg');
    Input_image = im2double(I)
    hsv_color=rgb2hsv(Input_image);
    gray=(0.7*hsv_color(:,:,2).*(0.7*Input_image(:,:,1)));
    BW=imbinarize(gray);
    se=strel('disk',28);
    Im_hsv_dil=imerode(BW,se);
    
    se=strel('disk',50);
    IM_seg=imdilate(Im_hsv_dil,se);
    [L,n]=bwlabel(IM_seg);
    imshow(IM_seg)
    jj=imread('C:\Users\Computing\Downloads\skin lesion dataset\GT\ISIC_0000011_Segmentation.png');
    imge=logical(jj);
    k=dice(IM_seg,imge);
    x= mean2(IM_seg)
    std=std2(IM_seg)