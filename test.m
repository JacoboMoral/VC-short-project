function [predictions] = test(model, testData)
    status = 'starting testing'
    
    predictions = predict(model, testData);
    
    status = 'ending testing'
end

