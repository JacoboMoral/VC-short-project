function [y] = extractYFromFeatures(dataObject)
    disp('status: starting y extraction from features')

    y = [];
    %for i = 1:3
    for i = 1:length(dataObject.y)
        y = [y; dataObject.y{i}];
    end
    
    disp('status: ending y extraction from features');
end