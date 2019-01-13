function [matrix, array] = extractMatrixFromFeatures(HOGObject)
    
    
    %matrix = ['ulls', 'HOGAverage', 'HOGMedian', 'HOGMax', 'HOGMin'];
    matrix = [];
    array = [];
    %for i = 1:3
    for i = 1:length(HOGObject)
        aux = [mean(HOGObject{i}.featureVector), median(HOGObject{i}.featureVector), max(HOGObject{i}.featureVector), min(HOGObject{i}.featureVector)];
        array = [array; HOGObject{i}.ull];
        matrix = [matrix; aux];
    end
    
    
    %{
    for i = 1:3
    %for i = 1:length(HOGObject)
        matrix.ull{i} = HOGObject{i}.ull;
        matrix.mean{i} = mean(HOGObject{i}.featureVector);
        matrix.median{i} = median(HOGObject{i}.featureVector);
        matrix.max{i} = max(HOGObject{i}.featureVector);
        matrix.min{i} = min(HOGObject{i}.featureVector);

    end 
    %}
end

