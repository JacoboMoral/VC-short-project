function [rect] = getNoEyesRect(imageSize,forbiddenRect)
    %a = xmin (horizontal)
    a = randi(imageSize(2)-1);
    
    b = -1;
    %b = ymin (vertical)
    while b < 0
        b = randi(imageSize(1)-1);
        if (b >= forbiddenRect(2) && b <= (forbiddenRect(2)+forbiddenRect(4)))
            b = -1;
        end
    end
    
    c = randi(imageSize(2)-a);
    
    d = -1;
    %d = height (vertical)
    while d < 0
        d = randi(imageSize(1)-b);
        
        if ( (a <= forbiddenRect(1) && c >= (forbiddenRect(1) - a) || (a >= forbiddenRect(1) && (a <= (forbiddenRect(1)+forbiddenRect(3)))) ) && (b <= forbiddenRect(2) && d >= (forbiddenRect(2) - b) || (b >= forbiddenRect(2) && (b <= (forbiddenRect(2)+forbiddenRect(4)))) ))
            d = -1;
        end

    end
    
    rect = [a b c d];
end

