% Specify the folder where the files live.
myFolder = ('C:\Users\Computing\Downloads\skin lesion dataset\org data');
GTfolder=('C:\Users\Computing\Downloads\skin lesion dataset\GT');
segmented=('C:\Users\Computing\Downloads\skin lesion dataset\segmented images');
% Check to make sure that folder actually exists.  Warn user if it doesn't.
if ~isfolder(myFolder)
    errorMessage = sprintf('Error: The following folder does not exist:\n%s\nPlease specify a new folder.', myFolder);
    uiwait(warndlg(errorMessage));
    myFolder = uigetdir(); % Ask for a new one.
    if myFolder == 0
         % User clicked Cancel
         return;
    end
end

% Get a list of all files in the folder with the desired file name pattern.
filePattern = fullfile(myFolder, '*.jpg'); % Change to whatever pattern you need.
theFiles = dir(filePattern);
for k = 0 : length(theFiles)
    baseFileName = theFiles(k).name;
    fullFileName = fullfile(theFiles(k).folder, baseFileName);
    fprintf(1, 'Now reading %s\n', fullFileName);
    I = dicomread(fullFileName);
    I1 = mat2gray(I);
    
    imshow(I1)
end