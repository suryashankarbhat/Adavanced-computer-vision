 I = imread('C:\Users\Computing\Downloads\ImgPIA.jpg');
 imshow(I)
 %features obtained are:
 %    1. SHORT RUN EMPHASIS (SRE) 
%    2. LONG RUN EMPHASIS(LRE)
%    3. GRAY LEVEL NON-UNIFORMITY (GLN)
%    4. RUN PERCENTAGE (RP)
%    5. RUN LENGTH NON-UNIFORMITY (RLN)
%    6. LOW GRAY LEVEL RUN EMPHASIS (LGRE)
%    7. HIGH GRAY LEVEL RUN EMPHASIS (HGRE)
 mask = ones(size(I(:,:,1)));
 quantize = 16;
 [SRE,LRE,GLN,RP,RLN,LGRE,HGRE]  = glrlm(I,quantize,mask)
 glrlfeatures16= [SRE,LRE,GLN,RP,RLN,LGRE,HGRE];
 quantize = 8;
 [SRE,LRE,GLN,RP,RLN,LGRE,HGRE]  = glrlm(I,quantize,mask)
 glrlfeatures8= [SRE,LRE,GLN,RP,RLN,LGRE,HGRE];
 quantize = 6;
 [SRE,LRE,GLN,RP,RLN,LGRE,HGRE]  = glrlm(I,quantize,mask)
 glrlfeatures6= [SRE,LRE,GLN,RP,RLN,LGRE,HGRE];
 quantize = 4;
 [SRE,LRE,GLN,RP,RLN,LGRE,HGRE]  = glrlm(I,quantize,mask)
 glrlfeatures4= [SRE,LRE,GLN,RP,RLN,LGRE,HGRE];
 
 figure;
 bar(glrlfeatures16)
 xlabel('SRE,LRE,GLN,RP,RLN,LGRE,HGRE');
 title('features for 16 bit depth using GLRL matrix');
 
 figure;
 bar(glrlfeatures8)
 xlabel('SRE,LRE,GLN,RP,RLN,LGRE,HGRE');
 title('features for 8 bit depth using GLRL matrix');
 
 
 figure;
 bar(glrlfeatures6)
 xlabel('SRE,LRE,GLN,RP,RLN,LGRE,HGRE');
 title('features for 6 bit depth using GLRL matrix');
 
 
 figure;
 bar(glrlfeatures16)
 xlabel('SRE,LRE,GLN,RP,RLN,LGRE,HGRE');
 title('features for 4 bit depth using GLRL matrix');
 
 
 
 