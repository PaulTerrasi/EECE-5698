% Image set to use
% i_paths = {'grafitti/grafitti1_rect_color.jpg', ...
%     'grafitti/grafitti2_rect_color.jpg', ...
%     'grafitti/grafitti3_rect_color.jpg', ...
%     'grafitti/grafitti4_rect_color.jpg', ...
%     'grafitti/grafitti5_rect_color.jpg'};

i_paths = {'grafitti_low_overlap/fence1_rect_color.jpg', ...
    'grafitti_low_overlap/fence2_rect_color.jpg', ...
    'grafitti_low_overlap/fence3_rect_color.jpg', ...
    'grafitti_low_overlap/fence4_rect_color.jpg', ...
    'grafitti_low_overlap/fence5_rect_color.jpg'};

% i_paths = {'wall/wall1_rect_color.jpg', ...
%     'wall/wall2_rect_color.jpg', ...
%     'wall/wall3_rect_color.jpg', ...
%     'wall/wall4_rect_color.jpg', ...
%     'wall/wall5_rect_color.jpg'};


% Read the first image from the image set.
I = imread(i_paths{1});

% Get the mask from the calibration
distortion_mask = rgb2gray(imread('calibration/mask_rect.jpg')) < 128;

% Initialize features for I(1)
grayImage = rgb2gray(I);
[corners_y, corners_x] = harris(grayImage, 2500, 'tile', [2 2], 'disp', ...
    'mask', distortion_mask);
[features, points] = extractFeatures(grayImage, [corners_x, corners_y]);

% Initialize all the transforms to the identity matrix. Note that the
% projective transform is used here because the building images are fairly
% close to the camera. Had the scene been captured from a further distance,
% an affine transform would suffice.
numImages = length(i_paths);
tforms(numImages) = projective2d(eye(3));

% Iterate over remaining image pairs
for n = 2:numImages

    % Store points and features for I(n-1).
    pointsPrevious = points;
    featuresPrevious = features;

    % Read I(n).
    I = imread(i_paths{n});

    % Detect and extract SURF features for I(n).
    grayImage = rgb2gray(I);
    [corners_y, corners_x] = harris(grayImage, 2500, 'tile', [2 2], 'disp', ...
        'mask', distortion_mask);
    [features, points] = extractFeatures(grayImage, [corners_x, corners_y]);

    % Find correspondences between I(n) and I(n-1).
    indexPairs = matchFeatures(features, featuresPrevious, 'Unique', true);

    matchedPoints = points(indexPairs(:,1), :);
    matchedPointsPrev = pointsPrevious(indexPairs(:,2), :);

    % Estimate the transformation between I(n) and I(n-1).
    tforms(n) = estimateGeometricTransform(matchedPoints, matchedPointsPrev,...
        'projective', 'Confidence', 99.9, 'MaxNumTrials', 2000);

    % Compute T(n) * T(n-1) * ... * T(1)
    tforms(n).T = tforms(n).T * tforms(n-1).T;
end

imageSize = size(I);  % all the images are the same size

% Compute the output limits  for each transform
for i = 1:numel(tforms)
    [xlim(i,:), ylim(i,:)] = outputLimits(tforms(i), [1 imageSize(2)], [1 imageSize(1)]);
end

% Find the center image
avgXLim = mean(xlim, 2);
[~, idx] = sort(avgXLim);
centerIdx = floor((numel(tforms)+1)/2);
centerImageIdx = idx(centerIdx);

% Apply center's inverse transform to other images
Tinv = invert(tforms(centerImageIdx));
for i = 1:numel(tforms)
    tforms(i).T = tforms(i).T * Tinv.T;
end

for i = 1:numel(tforms)
    [xlim(i,:), ylim(i,:)] = outputLimits(tforms(i), [1 imageSize(2)], [1 imageSize(1)]);
end

% Find the minimum and maximum output limits
xMin = min([1; xlim(:)]);
xMax = max([imageSize(2); xlim(:)]);

yMin = min([1; ylim(:)]);
yMax = max([imageSize(1); ylim(:)]);

% Width and height of panorama.
width  = round(xMax - xMin);
height = round(yMax - yMin);

if width*height < 100000000

    % Initialize the "empty" panorama.
    panorama = zeros([height width 3], 'like', I);

    blender = vision.AlphaBlender('Operation', 'Binary mask', ...
        'MaskSource', 'Input port');

    % Create a 2-D spatial reference object defining the size of the panorama.
    xLimits = [xMin xMax];
    yLimits = [yMin yMax];
    panoramaView = imref2d([height width], xLimits, yLimits);

    % Create the panorama.
    for i = 1:numImages

        I = imread(i_paths{i});

        % Transform I into the panorama.
        warpedImage = imwarp(I, tforms(i), 'OutputView', panoramaView);

        % Generate a binary mask.
        mask = imwarp(distortion_mask, tforms(i), 'OutputView', panoramaView);

        % Overlay the warpedImage onto the panorama.
        panorama = step(blender, panorama, warpedImage, mask);
    end

    figure
    imshow(panorama)

    % Calculate the image distances

    center_x = size(I, 2) / 2;
    center_y = size(I, 1) / 2;

    im_disp_x = zeros(1, 5);
    im_disp_y = zeros(1, 5);

    for i = 1:numImages
        [im_disp_x(i), im_disp_y(i)] = ...
            tforms(i).transformPointsForward(center_x, center_y);
    end

    im_disp_x = im_disp_x - im_disp_x(centerIdx)
    im_disp_y = im_disp_y - im_disp_y(centerIdx)
    
end
