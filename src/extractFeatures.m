function [features] = extractFeatures(imageArray, boolean)
    
    disp('status: start features extraction');
    %for i = 1:1
    features = [];
    for i = 1:length(imageArray)
        %aux = [boolean];
        features{i}.y = boolean;
        
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
            disp('status: extracting features from data');
            status = strcat(num2str(round(tpc)),'% completed');
            disp(status);
        end
        %features = [features; aux];
        
    end
    clc
    disp('status: extracting features from data');
    status = '100% completed';
    disp(status);
    
    disp('end features extraction');
end

