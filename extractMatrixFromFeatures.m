function [X] = extractMatrixFromFeatures(dataObject)
    status = 'starting matrix extraction from features'

    dataFields = fieldnames(dataObject);
    X = [];
    %for i = 1:3
    for i = 1:length(dataObject.y)
        
        aux = [];
        for j = 2:numel(dataFields)
            aux = [aux, dataObject.(dataFields{j}){i}];
        end
        X = [X; aux];
        
        if(mod(i,1000) == 1)
            tpu = i/length(dataObject.y);
            tpc = tpu * 100;
            clc
            status = 'starting matrix extraction from features'
            strcat(num2str(round(tpc)),'% completed')
        end
    end

   status = 'ending matrix extraction from features'
end