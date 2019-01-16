function [features] = extractFeaturesSingleImage(image)  
    I = imresize(image, [64 64]);

    %HOG features
    [featureVector,hogVisualization] = extractHOGFeatures(I, 'CellSize', [8 8]);

    %features{i}.HOGFeatureVector = featureVector(1:100);
    features = [featureVector(1:100)];

    %LBP features
    lbp = extractLBPFeatures(image);
    %features{i}.LBPFeatureVector = lbp; %around 150 features
    features = [features, lbp];
        
end

