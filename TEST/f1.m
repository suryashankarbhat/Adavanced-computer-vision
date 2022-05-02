clear;

files = dir('C:\Users\Computing\Downloads\skin lesion dataset\org data\*.jpg');
gtfolder=dir('C:\Users\Computing\Downloads\skin lesion dataset\GT\*.png');
for i = 1:numel(files)
   file = files(i);
   filename = fullfile(file.folder,file.name);
   fileseg=gtfolder(i);
  
   disp(filename);
   filenameseg=fullfile(fileseg.folder,fileseg.name);
   segimg=imread(filenameseg);
   segm=logical(segimg);
   I = imread(filename);
   Input_image = im2double(I);
   hsv_color=rgb2hsv(Input_image);
   gray=(0.7*hsv_color(:,:,2).*(0.7*Input_image(:,:,1)));
   BW=imbinarize(gray);
   se=strel('disk',28);
   Im_hsv_dil=imerode(BW,se);
  
   se=strel('disk',70);
   IM_seg=imdilate(Im_hsv_dil,se);
   [L,n]=bwlabel(IM_seg);
   imshow(IM_seg)
   iclose=imclose(IM_seg,se);
%    dice(IM_seg,segm)
  
   if dice(IM_seg,segm)<0.5
       
       SI= otsufunction(Input_image);
       imshow(SI);
       d=dice(SI,segm);
       k(i)=d;
   else
       d=dice(IM_seg,segm)
       k(i)=d;
   end
end
mean(k)
std(k)
figure
xlabel('total images')
ylabel('dice score')
plot(k);
   