function [y] = extractYFromFeatures(dataObject)
    status = 'starting y extraction from features'

    y = [];
    %for i = 1:3
    for i = 1:length(dataObject.ull)
        y = [y; dataObject.ull{i}];
    end
    
    status = 'ending y extraction from features'
end