function [predictions] = test(model, testData)
    disp('status: starting testing');
    
    predictions = predict(model, testData);
    
    disp('status: ending testing');
end

