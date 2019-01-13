function [features] = extractFeatures(imageArray, boolean)
    

    %for i = 1:1
    for i = 1:length(imageArray)
        
        features{i}.ull = boolean;
        
        %HOG features
        [featureVector,hogVisualization] = extractHOGFeatures(imageArray{i});
        %features{i}.hogVisualization = hogVisualization;
        features{i}.featureVectorMean = mean(featureVector);
        features{i}.featureVectorMedian = median(featureVector);
        features{i}.featureVectorMax = max(featureVector);
        features{i}.featureVectorMin = min(featureVector);
        
        %LBP features
        lbp = extractLBPFeatures(imageArray{i});
        features{i}.lbpMean = mean(lbp);
        features{i}.lbpMedian = median(lbp);
        features{i}.lbpMax = max(lbp);
        features{i}.lbpMin = min(lbp);
    end

end

