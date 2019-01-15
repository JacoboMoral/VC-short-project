function [features] = extractFeatures(imageArray, boolean)
    status = 'start features extraction'
    %for i = 1:1
    features = [];
    for i = 1:length(imageArray)
        %aux = [boolean];
        features{i}.ull = boolean;
        
        I = imageArray{i};
        I = imresize(I, [64 64]);
        
        %HOG features
        [featureVector,hogVisualization] = extractHOGFeatures(I, 'CellSize', [8 8]);
        %aux = [aux, featureVector];
        
        features{i}.HOGFeatureVector = featureVector(1:100);
        %features{i}.featureVectorMean = mean(featureVector);
        %features{i}.featureVectorMedian = median(featureVector);
        %features{i}.featureVectorMax = max(featureVector);
        %features{i}.featureVectorMin = min(featureVector);

        %LBP features
        lbp = extractLBPFeatures(imageArray{i});
        features{i}.LBPFeatureVector = lbp;
        %features{i}.lbpMean = mean(lbp);
        %features{i}.lbpMedian = median(lbp);
        %features{i}.lbpMax = max(lbp);
        %features{i}.lbpMin = min(lbp);

        %correct if some fields are nan
        %dataFields = fieldnames(features{i});
        %for j = 1:numel(dataFields)
        %    if (isnan(features{i}.(dataFields{j})))
        %        features{i}.(dataFields{j}) = 0;
        %    end
        %end
        
        
        if(mod(i,1000) == 1)
            tpu = i/length(imageArray);
            tpc = tpu * 100;
            strcat(num2str(round(tpc)),'% completed')
        end
        
        %features = [features; aux];
        
    end
    
    status = 'end features extraction'
end

