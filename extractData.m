function [rawData] = extractData(path)
    rawImatges = dir(strcat(path, '*.pgm'));
    rawEyesCoords = dir(strcat(path, '*.eye'));
    for i = 1:length(rawImatges)
       rawData.imatges{i} = imread(strcat(path, rawImatges(i).name));
       rawData.eyes{i} = getEyesCoordinates(strcat(path, rawEyesCoords(i).name));
    end
end


