function [X] = extractMatrixFromFeatures(dataObject)
    disp('status: starting matrix generation from features object');

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
            disp('status: generating matrix from features object');
            status = strcat(num2str(round(tpc)),'% completed');
            disp(status);
        end
    end
    clc
    disp('status: generating matrix from features object');
    status = '100% completed';
    disp(status);

    disp('status: ending matrix generation from features object');
end