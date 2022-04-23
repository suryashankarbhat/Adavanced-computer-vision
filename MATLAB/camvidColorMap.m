function cmap = camvidColorMap()
% Define the colormap used by CamVid dataset.

cmap = [
    255 255 255   % lesion
    0 0 0       % Background
    ];

% Normalize between [0 1].
cmap = cmap ./ 255;
end

