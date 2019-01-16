my_timer = test();
    %{
    figure;
    imshow('BioID_0001.pgm');
    h = drawrectangle('Color', [1 1 0], 'Position', [2, 2, 120, 40]);
    %}
    
function a = test
    
    a = timer('ExecutionMode','fixedRate','Period',0.8,'TimerFcn',@myfun);
    start(a);
    
end

function myfun(obj,evt)
    rect = evalin('base', 'h');
    cropRect = rect.Position;
    I = imread('BioID_0000.pgm');
    J = imcrop(I, rect.Position);
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