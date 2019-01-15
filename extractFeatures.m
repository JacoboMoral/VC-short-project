function [features] = extractFeatures(imageArray, boolean)
    status = 'start features extraction'
    %for i = 1:1
    for i = 1:length(imageArray)
        
        features{i}.ull = boolean;
        
        I = imageArray{i};
        I = imresize(I, [64 64]);
        
        %HOG features
        [featureVector,hogVisualization] = extractHOGFeatures(I, 'CellSize', [8 8]);
        %features{i}.hogVisualization = hogVisualization;
        %featureVector
     
        features{i}.featureVector = featureVector;
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

        %correct if some fields are nan
        dataFields = fieldnames(features{i});
        for j = 1:numel(dataFields)
            if (isnan(features{i}.(dataFields{j})))
                features{i}.(dataFields{j}) = 0;
            end
        end
    end
    
    status = 'end features extraction'
end

