clear;
a = dir('C:\Users\Computing\Downloads\skin lesion dataset\org data\*.jpg');
b = 'C:\Users\Computing\Downloads\skin lesion dataset\org data\';


for i=1:length(a) %where a is the path to the image folder
   fileName = strcat(b,a(i).name);
   Name = a(i).name;
   disp(fileName);% this allows me to see the names in text.
   I = imread(Name);
   print(x);
    Input_image = im2double(I);
    hsv_color=rgb2hsv(Input_image);
    gray=(0.7*hsv_color(:,:,2).*(0.7*Input_image(:,:,1)));
    BW=imbinarize(gray);
    se=strel('disk',28);
    Im_hsv_dil=imerode(BW,se);
    pint('ab')
    se=strel('disk',70);
    IM_seg=imdilate(Im_hsv_dil,se);
    [L,n]=bwlabel(IM_seg);
    imshow(IM_seg)
   
end    