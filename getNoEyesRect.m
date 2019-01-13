function [rect] = getNoEyesRect(imageSize,forbiddenRect)
    %a = xmin (horizontal)
    a = randi(imageSize(2)-5);
    
    b = -1;
    %b = ymin (vertical)
    while b < 0
        b = randi(imageSize(1)-5);
        if (b >= forbiddenRect(2) && b <= (forbiddenRect(2)+forbiddenRect(4)))
            b = -1;
        end
    end
    
    c = max(5,randi(imageSize(2)-a));
    
    d = -1;
    %d = height (vertical)
    
    %{
    imageSize
    forbiddenRect
    a
    b
    c
    %}
    
    while d < 0
        d = max(3,randi(imageSize(1)-b));
        
        if ( (a <= forbiddenRect(1)+5 && c >= (forbiddenRect(1) - a+5) || (a >= forbiddenRect(1)+5 && (a <= (forbiddenRect(1)+forbiddenRect(3)-5))) ) && (b <= forbiddenRect(2)+5 && d >= (forbiddenRect(2) - b+5) || (b >= forbiddenRect(2)+5 && (b <= (forbiddenRect(2)+forbiddenRect(4)-5))) ))
            d = -1;
        end

    end
    
    rect = [a b c d];
end

