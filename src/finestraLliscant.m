close all; 
figure;
I = imread('BioID_0456.pgm'); %image to test
imshow(I);
h = drawrectangle('Color', [1 1 0], 'Position', [2, 2, 120, 40]);

timer = interval();

    
function a = interval
    
    a = timer('ExecutionMode','fixedRate','Period',0.8,'TimerFcn',@slidingWindow);
    start(a);
    
end

function slidingWindow(obj,evt)
    rect = evalin('base', 'h');
    cropRect = rect.Position;
    image = evalin('base', 'I');
    J = imcrop(image, rect.Position);
    features = extractFeaturesSingleImage(J);
    modelUlls = evalin('base', 'eyesPredictionModel');
    prediction = predict(modelUlls, features);
    if(prediction{1} == '1')
        %disp('Predicció d''ulls: VERITAT');
        %title('ULLS');
        modelMirada = evalin('base', 'looksPredictionFromEyesModel');
        prediction2 = predict(modelMirada, features);
        if(prediction2{1} == '1')
            title('MIRADA D''ULLS A CAMERA');
        else
            title('ULLS NO MIRANT A CAMERA');
        end
        
    else
        %disp('Predicció d''ulls: FALS');
        title('NO ULLS');
    end
end