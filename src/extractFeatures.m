function [features] = extractFeatures(imageArray, boolean)
    status = 'start features extraction'
    %for i = 1:1
    features = [];
    for i = 1:length(imageArray)
        %aux = [boolean];
        
        I = imageArray{i};
        I = imresize(I, [64 64]);
        
        %HOG features
        [featureVector,hogVisualization] = extractHOGFeatures(I, 'CellSize', [8 8]);
        
        features{i}.HOGFeatureVector = featureVector(1:100);

        %LBP features
        lbp = extractLBPFeatures(imageArray{i});
        features{i}.LBPFeatureVector = lbp; %around 150 features
      
        if(mod(i,1000) == 1)
            clc
            tpu = i/length(imageArray);
            tpc = tpu * 100;
            status = 'start features extraction'
            strcat(num2str(round(tpc)),'% completed')
        end
        
        %features = [features; aux];
        
    end
    
    status = 'end features extraction'
end

