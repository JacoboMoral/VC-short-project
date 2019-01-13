function [y] = extractYFromFeatures(dataObject)
    y = [];
    %for i = 1:3
    for i = 1:length(dataObject)
        y = [y; dataObject{i}.ull];
    end
end