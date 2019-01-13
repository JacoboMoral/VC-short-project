function [X] = extractMatrixFromFeatures(dataObject)
    
    X = [];
    %for i = 1:3
    for i = 1:length(dataObject)
        
        aux = [];
        dataFields = fieldnames(dataObject{i});
        for j = 1:numel(dataFields)
            aux = [aux, dataObject{i}.(dataFields{j})];
        end
        
        X = [X; aux];
    end

end