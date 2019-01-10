function [rect] = getNoEyesRect(imageSize,forbiddenRect)
    
    %a = xmin (horizontal)
    a = randi(imageSize(1)-1)
    
    b = -1;
    %b = ymin (vertical)
    while b < 0
        b = randi(imageSize(2)-1) 
        if (b >= forbiddenRect(2) && b <= (forbiddenRect(2)+forbiddenRect(4)))
            b = -1;
        end
    end
    
    c = randi(imageSize(1)-a)
    
    d = -1;
    %d = height (vertical)
    while d < 0
        d = randi(imageSize(2)-b-1)
        
        if ( (a <= forbiddenRect(1) && c >= (forbiddenRect(1) - a) || (a >= forbiddenRect(1) && (a <= (forbiddenRect(1)+c))) ) && (b <= forbiddenRect(2) && d >= (forbiddenRect(2) - b) || (b >= forbiddenRect(2) && (b <= (forbiddenRect(2)+d))) ))
            d = -1;
        end

    end
    
    imageSize
    rect = [a b c d]
end

