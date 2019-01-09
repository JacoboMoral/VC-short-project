function [trainingData, testData] = splitData(inputData, trainingRatio)
%0 <= trainingRatio <= 1
    
    trainingDataLength = round(trainingRatio*length(inputData.imatges));
    
    %training
    for i = 1:trainingDataLength
        dataFields = fieldnames(inputData);
        for j = 1:numel(dataFields)
            trainingData.(dataFields{j}){i} = inputData.(dataFields{j}){i};
        end
    end
    
    %test
    for i = trainingDataLength+1:length(inputData.imatges)
        dataFields = fieldnames(inputData);
        for j = 1:numel(dataFields)
            testData.(dataFields{j}){i-trainingDataLength} = inputData.(dataFields{j}){i};
        end
    end

end

