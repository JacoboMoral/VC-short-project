function [X] = extractMatrixFromFeatures(dataObject)
    status = 'starting matrix extraction from features'

    dataFields = fieldnames(dataObject);
    X = [];
    %for i = 1:3
    for i = 1:length(dataObject.ull)
        
        aux = [];
        for j = 2:numel(dataFields)
            aux = [aux, dataObject.(dataFields{j}){i}];
        end
        X = [X; aux];
        
        if(mod(i,1000) == 1)
            strcat(num2str(round(i/length(dataObject.ull))),'% completed')
        end
    end

   status = 'ending matrix extraction from features'
end