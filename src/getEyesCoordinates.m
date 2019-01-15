function [coordinates] = getEyesCoordinates(eyePath)
    rawCoordinates = strsplit(fileread(eyePath));
    coordinates.LX = str2num(rawCoordinates{5});
    coordinates.LY = str2num(rawCoordinates{6});
    coordinates.RX = str2num(rawCoordinates{7});
    coordinates.RY = str2num(rawCoordinates{8});
end

