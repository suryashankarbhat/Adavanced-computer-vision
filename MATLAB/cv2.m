imdsTrain=imageDatastore('C:\Users\Computing\Downloads\skin lesion dataset\org data','IncludeSubfolders',true);

% Define class names and their corresponding IDs
classNames=["Lesion","Background"];
labelIDs=[255,0];

% Create a pixelLabelDatastore holding the ground truth pixel labels
pxdsTrain=pixelLabelDatastore('C:\Users\Computing\Downloads\skin lesion dataset\GT',classNames, labelIDs);

% Create a pixel label image datastore of all images  
pximds=pixelLabelImageDatastore(imdsTrain,pxdsTrain);
ds = combine(imdsTrain,pxdsTrain);
tbl = countEachLabel(pxdsTrain)


numberPixels = sum(tbl.PixelCount);
frequency = tbl.PixelCount / numberPixels;
classWeights = 1 ./ frequency;

inputSize = [767 1022 3];
filterSize = 3;
numFilters = 32;
numClasses = numel(classNames);

layers = [
    imageInputLayer(inputSize)
    
    convolution2dLayer(filterSize,numFilters,'DilationFactor',1,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    convolution2dLayer(filterSize,numFilters,'DilationFactor',2,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    convolution2dLayer(filterSize,numFilters,'DilationFactor',4,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    convolution2dLayer(1,numClasses)
    softmaxLayer
    pixelClassificationLayer('Classes',classNames,'ClassWeights',classWeights)];


options = trainingOptions('sgdm', ...
    'MaxEpochs', 100, ...
    'MiniBatchSize', 64, ... 
    'InitialLearnRate', 1e-3);

net = trainNetwork(ds,layers,options);
