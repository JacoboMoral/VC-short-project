function eyes = getEyes(data)
    for i = 1:length(data.imatges)
        %leftEyePosition.x = data.eyes{i}.LX;
        %leftEyePosition.y = data.eyes{i}.LY;
        %rightEyePosition.x = data.eyes{i}.RX;
        %rightEyePosition.y = data.eyes{i}.RY;
        
        leftRect = [data.eyes{i}.LX-15 data.eyes{i}.LY-5 30 15];
        leftEye = imcrop(data.imatges{i},leftRect);       
        %figure; imshow(leftEye);
        
        rightRect = [data.eyes{i}.RX-15 data.eyes{i}.RY-5 30 15];
        rightEye = imcrop(data.imatges{i},rightRect);
        %figure; imshow(rightEye);
        
        eyes{i}.left = leftEye;
        eyes{i}.right = rightEye;
     end
end

