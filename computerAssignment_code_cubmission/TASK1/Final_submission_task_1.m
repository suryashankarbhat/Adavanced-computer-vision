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
   
   se=strel('disk',50);
   IM_seg=imdilate(Im_hsv_dil,se);
   [L,n]=bwlabel(IM_seg);
  se=strel('sphere',16);
   imdg=edge(IM_seg,'log')
   iclose=imclose(imdg,se);
   
   ifmi=imfill(iclose,'holes')
   IOP=bwareaopen(ifmi,1600);
   imshow(IOP)
%    dice(IM_seg,segm)
  
   if dice(IOP,segm)<0.5
       
       SI= otsufunction(Input_image);
       imshow(SI);
       
       imwrite(SI,file.name);
       d=dice(SI,segm);
        
       k(i)=d;
   else
       d=dice(IOP,segm);
       k(i)=d;
       imwrite(IOP,file.name);
   end
 

end
mean=mean(k)
standard_deviation=std(k)
bar(k)
xlabel('total images')
ylabel('dice score')

   