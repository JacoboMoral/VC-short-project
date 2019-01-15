function [eyes, noEyes] = getEyesAndRest(data, eyesRatio)
    status = 'starting eyes and rest generation'
    
    newImagesPerEyesImage = round(1/eyesRatio);
    %newImagesPerEyesImage = 5
    
    for i = 1:length(data.imatges)
    %for i = 1:3
        rect = [data.eyes{i}.RX-17 min(data.eyes{i}.RY,data.eyes{i}.LY)-23 (data.eyes{i}.LX-data.eyes{i}.RX)+35 40 ];
        eye = imcrop(data.imatges{i},rect);
        
        %figure; imshow(eye);
        
        eyes{i} = eye;
        imageSize = size(data.imatges{i}); %[height width]
        
        %figure; imshow(data.imatges{i});
        for j = 1:newImagesPerEyesImage
            noEyesRect = getNoEyesRect(imageSize, rect);
            %noEyesRect = [380 280 4 4];
            noEye = imcrop(data.imatges{i},noEyesRect);
            %figure; imshow(noEye);
            noEyes{(i-1)*newImagesPerEyesImage + j} = noEye;
        end
    end
     
    status = 'ending eyes and rest generation'
end
