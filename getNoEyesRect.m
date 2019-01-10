function [rect] = getNoEyesRect(imageSize,forbiddenRect)
    
    a = -1;    
    %a = xmin (horizontal)
    while a < 0
        a = randi(imageSize(1)); 
        if (a >= forbiddenRect(1) && a <= (forbiddenRect(1)+forbiddenRect(3)))
            a = -1;
        end
    end
    
    b = -1;
    %b = ymin (vertical)
    while b < 0
        b = randi(imageSize(2)); 
        if (b >= forbiddenRect(2) && b <= (forbiddenRect(2)+forbiddenRect(4)))
            b = -1;
        end
    end
    
    c = -1;
    %c = width (horizontal)
    while c < 0
        if (a < forbiddenRect(1))
            c = randi(forbiddenRect(1)-a)+5; 
        elseif (a == forbiddenRect(1))
            c = randi(5);
        elseif (a >= (forbiddenRect(1)+forbiddenRect(3)))
            c = randi(imageSize(1)-a)+a; 
        end
    end
    
    d = -1;
    %d = height (vertical)
    while d < 0
        if (b < forbiddenRect(2))
            d = randi(forbiddenRect(2)-b)+5; 
        elseif (b == forbiddenRect(2))
            d = randi(5);
        elseif (b >= (forbiddenRect(2)+forbiddenRect(4)))
            d = randi(imageSize(2)-b)+b; 
        end
    end
    
    rect = [a b c d];
end

