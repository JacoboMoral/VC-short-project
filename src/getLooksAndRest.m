function [looksImages, noLooksImages] = getLooksAndRest(eyesImages, looking)
    disp('status: starting looks gathering');

    j = 1;
    k = 1;
    for i = 1:length(eyesImages)

        if (looking{i} == '0')
            looksImages{j} = eyesImages{i};
            j = j+1;
        else
            noLooksImages{k} = eyesImages{i};
            k = k+1;
        end
    end
        
    disp('status: finishing looks gathering');
end

