function [mashedArray] = mash(inputArray1,inputArray2)
    disp('status: start mashing');
    
    a = inputArray1(randperm(length(inputArray1)));
    b = inputArray2(randperm(length(inputArray2)));
    
    mashedArray = [a, b];
    
    mashedArray = mashedArray(randperm(length(mashedArray)));
    
    disp('status: end mashing');
end

