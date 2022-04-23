% Clear workspace 
clear; close all; clc;

% All images
imds=imageDatastore('C:\Users\Computing\Downloads\skin lesion dataset\org data','IncludeSubfolders',true);

% Define class names and their corresponding IDs
classNames=["Lesion","Background"];
labelIDs=[255,0];

% Create a pixelLabelDatastore holding the ground truth pixel labels
pxds=pixelLabelDatastore('C:\Users\Computing\Downloads\skin lesion dataset\GT',classNames, labelIDs);

% Create a pixel label image datastore of all images  
pximds=pixelLabelImageDatastore(imds,pxds);
I = readimage(imds,1);
figure
imshow(I)

C = readimage(pxds,1);
C(2,2)
B = labeloverlay(I,C);
figure
imshow(B)

buildingMask = C == 'Lesion';

figure
imshowpair(I, buildingMask,'montage')

inputSize = [32 32 3];
imgLayer = imageInputLayer(inputSize)

filterSize = 3;
numFilters = 32;
conv = convolution2dLayer(filterSize,numFilters,'Padding',1);
relu = reluLayer();
poolSize = 2;
maxPoolDownsample2x = maxPooling2dLayer(poolSize,'Stride',2);

downsamplingLayers = [
    conv
    relu
    maxPoolDownsample2x
    conv
    relu
    maxPoolDownsample2x
    ]

filterSize = 4;
transposedConvUpsample2x = transposedConv2dLayer(4,numFilters,'Stride',2,'Cropping',1);


upsamplingLayers = [
    transposedConvUpsample2x
    relu
    transposedConvUpsample2x
    relu
    ]

numClasses = 2;
conv1x1 = convolution2dLayer(1,numClasses);

finalLayers = [
    conv1x1
    softmaxLayer()
    pixelClassificationLayer()
    ]
net = [
    imgLayer    
    downsamplingLayers
    upsamplingLayers
    finalLayers
    ]


%Train A Semantic Segmentation Network

I = read(imds);
C = read(pxds);

I = imresize(I,5);
L = imresize(uint8(C{1}),5);
imshowpair(I,L,'montage')

numFilters = 64;
filterSize = 3;
numClasses = 2;
layers = [
    imageInputLayer([32 32 3])
    convolution2dLayer(filterSize,numFilters,'Padding',1)
    reluLayer()
    maxPooling2dLayer(2,'Stride',2)
    convolution2dLayer(filterSize,numFilters,'Padding',1)
    reluLayer()
    transposedConv2dLayer(4,numFilters,'Stride',2,'Cropping',1);
    convolution2dLayer(1,numClasses);
    softmaxLayer()
    pixelClassificationLayer()
    ];

opts = trainingOptions('sgdm', ...
    'InitialLearnRate',1e-3, ...
    'MaxEpochs',100, ...
    'MiniBatchSize',64);

% Desired Image Size 
imageSize=[32 32 3];

% Create a pixel label image datastore of all resized images  
trainingData=pixelLabelImageDatastore(imds,pxds,'OutputSize',imageSize);
net = trainNetwork(trainingData,layers,opts);
total_num_images=length(pximds.Images);
test_idx=randperm(total_num_images,60);
imdsTest=partitionByIndex(trainingData,test_idx);

pxdsPred = semanticseg(imdsTest,net,'MiniBatchSize',32,'WriteLocation',tempdir);

metrics = evaluateSemanticSegmentation(pxdsPred,pxdsTest);