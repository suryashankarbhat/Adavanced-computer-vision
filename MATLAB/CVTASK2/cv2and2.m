f = imread('C:\Users\Computing\Downloads\ImgPIA.jpg');
imshow(f);
f = rgb2gray(f);

% [pixelcount,graylevel]=imhist(f)
% totalpixels=sum(pixelcount);
% mean=sum(graylevel.*(pixelcount/totalpixels));
% varience=0;
% skewness=0;
% kurtosis=0;
% % for i=0:length(pixelcount)-1
% %     varience=varience+(i-mean)^2*
% %     skewness=
% %     kurtosis=
% % end

%for 0 degree
glcm_0_s = graycomatrix(f, 'offset', [0 1],'NumLevels', 256, 'Symmetric', true)
figure;

imshow(glcm_0_s)
title('for 0 degree');
%for 45 degree
glcm_45_s = graycomatrix(f, 'offset', [-1 1],'NumLevels', 256, 'Symmetric', true)
figure;

imshow(glcm_45_s)
title('for 45 degree');
%for 90 degree
glcm_90_s = graycomatrix(f, 'offset', [1 0],'NumLevels', 256, 'Symmetric', true)
figure;

imshow(glcm_90_s)
title('for 90 degree');
%for 135 degree
glcm_135_s = graycomatrix(f, 'offset', [-1 -1],'NumLevels', 256, 'Symmetric', true);
figure;

imshow(glcm_135_s)
title('for 135 degree');

 
%for 90 degree

% stats_0_s = graycoprops(glcm_0_s,{'contrast','correlation','energy','homogeneity'})
% stats_0_ns = graycoprops(glcm_0_ns,{'contrast','correlation','energy','homogeneity'})
coOcMat=glcm_0_s ;
coOcMat45=glcm_45_s;
coOcMat90=glcm_90_s;
coOcMat135=glcm_135_s;

features0=haralickTextureFeatures(coOcMat);
features45=haralickTextureFeatures(coOcMat45);
features90=haralickTextureFeatures(coOcMat90);
features135=haralickTextureFeatures(coOcMat135);

figure;
bar(features0)
xlabel('1=energy,2=contrast,3= Correlation, 4=Variance, 5=Inverse Difference Moment,6=Sum Average, 7=Sum Variance,8=Sum Entropy,9= Entropy,10=Difference 11=Variance,12=difference entopy,13=Information Measures of Correlation,14=Maximal Correlation Coefficient  ');

title('features for 0 degree');
figure;
bar(features45)
xlabel('1=energy,2=contrast,3= Correlation, 4=Variance, 5=Inverse Difference Moment,6=Sum Average, 7=Sum Variance,8=Sum Entropy,9= Entropy,10=Difference 11=Variance,12=difference entopy,13=Information Measures of Correlation,14=Maximal Correlation Coefficient  ');

title('features for 45 degree');
figure;
bar(features90)
xlabel('1=energy,2=contrast,3= Correlation, 4=Variance, 5=Inverse Difference Moment,6=Sum Average, 7=Sum Variance,8=Sum Entropy,9= Entropy,10=Difference 11=Variance,12=difference entopy,13=Information Measures of Correlation,14=Maximal Correlation Coefficient  ')
title('features for 90 degree');
figure;
bar(features135)
xlabel('1=energy,2=contrast,3= Correlation, 4=Variance, 5=Inverse Difference Moment,6=Sum Average, 7=Sum Variance,8=Sum Entropy,9= Entropy,10=Difference 11=Variance,12=difference entopy,13=Information Measures of Correlation,14=Maximal Correlation Coefficient  ')
title('features for 135 degree');