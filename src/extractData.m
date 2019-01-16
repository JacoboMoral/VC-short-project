function [rawData] = extractData(path)
    disp('status: start data extraction');

    rawImatges = dir(strcat(path, '*.pgm'));
    rawEyesCoords = dir(strcat(path, '*.eye'));
    lookingFile = dir(strcat(path, 'miram.txt'));
    
    for i = 1:length(rawImatges)
       rawData.imatges{i} = imread(strcat(path, rawImatges(i).name));
       rawData.eyes{i} = getEyesCoordinates(strcat(path, rawEyesCoords(i).name));
       rawData.looking = strsplit(fileread(lookingFile.name));
       
       
       if(mod(i,10) == 1)
            tpu = i/length(rawImatges);
            tpc = tpu * 100;
            clc
            disp('status: extracting data from images');
            status = strcat(num2str(round(tpc)),'% completed');
            disp(status);
       end       
    end
    clc
    disp('status: extracting data from images');
    status = '100% completed';
    disp(status);
    
    disp('status: start data extraction');
end
