function [rawData] = extractData(path)
    status = 'start data extraction'

    rawImatges = dir(strcat(path, '*.pgm'));
    rawEyesCoords = dir(strcat(path, '*.eye'));
    lookingFile = dir(strcat(path, 'miram.txt'));
    
    for i = 1:length(rawImatges)
       rawData.imatges{i} = imread(strcat(path, rawImatges(i).name));
       rawData.eyes{i} = getEyesCoordinates(strcat(path, rawEyesCoords(i).name));
       rawData.looking = strsplit(fileread(lookingFile.name));
    end
    
    status = 'end data extraction'
end
