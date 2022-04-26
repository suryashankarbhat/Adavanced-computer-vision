


clear;close;
i=imread('C:\Users\Computing\Downloads\ImgPIA.jpg');
imshow(i);

img= double(i);
[row,column]=size(img);
cy=round(row/2);
cx=round(column/2);
R=100;
A=360;
if exist('R','var') ==0
    R=min(round(row/2),round(column/2))-1;
end

if exist('A','var')==0
     A=90;
end
Polarcord_img=[];
i=1;
for r=0:R
    j=1;
    for a=0:2*pi/A:2*pi-2*pi/A
      Polarcord_img(i,j)= img(cy+round(r*sin(a)),cx+round(r*cos(a)));
        j=j+1;
    end
    i=i+1;
end

srt=fft2(Polarcord_img);
for r=1:100;
sr(r)=sum(abs(srt(r+1,:)));
end
figure(1);
bar(srt)
xlabel('radius')
ylabel('features')

    

