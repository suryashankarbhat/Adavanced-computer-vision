IMAGE_FOLDER=('C:\Users\Computing\Downloads\skin lesion dataset\org data');
imgFiles = dir('*.jpg');   % get all jpg files in the folder 
numfiles = length(imgFiles);  % total number of files 


for k = 1:numfiles   % loop for each file 
    img = imgFiles(k).name    % present image file 
    %%do what you want %%
end