function [features] = extractFeatures(imageArray, boolean)
    

    %for i = 1:1
    for i = 1:length(imageArray)
        
        features{i}.ull = boolean;
        
        %HOG features
        [featureVector,hogVisualization] = extractHOGFeatures(imageArray{i});
        features{i}.featureVector = featureVector;
        features{i}.hogVisualization = hogVisualization;
        
        %LBP features
        lbp = extractLBPFeatures(imageArray{i});
        features{i}.lbp = lbp;
    end

end

