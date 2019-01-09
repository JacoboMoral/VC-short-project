function [HOGFeatures] = getHOGFeatures(imageArray)
    for i = 1:1
    %for i = 1:length(imageArray)
        [featureVector,hogVisualization] = extractHOGFeatures(imageArray{i});
        HOGFeatures{i}.featureVector = featureVector;
        HOGFeatures{i}.hogVisualization = hogVisualization;
       
        %imshow(imageArray{i}); 
        %hold on;
        %plot(hogVisualization);
        
    end
end

