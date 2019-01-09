function eyes = getEyes(data)
    for i = 1:length(data.imatges)
    %for i = 1:50
        rect = [data.eyes{i}.RX-17 min(data.eyes{i}.RY,data.eyes{i}.LY)-23 (data.eyes{i}.LX-data.eyes{i}.RX)+35 40 ];
        eye = imcrop(data.imatges{i},rect);
        
        %figure; imshow(eye);
        
        eyes{i} = eye;
     end
end

