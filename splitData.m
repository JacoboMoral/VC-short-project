function [trainingData, testData] = splitData(inputData, trainingRatio)
%0 <= trainingRatio <= 1
    
    trainingDataLength = round(trainingRatio*length(inputData));
    
    %training
    for i = 1:trainingDataLength
        dataFields = fieldnames(inputData{i});
        for j = 1:numel(dataFields)
            trainingData.(dataFields{j}){i} = inputData{i}.(dataFields{j});
        end
    end
    
    %test
    for i = trainingDataLength+1:length(inputData)
        dataFields = fieldnames(inputData{i});
        for j = 1:numel(dataFields)
            testData.(dataFields{j}){i-trainingDataLength} = inputData{i}.(dataFields{j});
        end
    end

end

