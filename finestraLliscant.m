my_timer = test();
    %{
    figure;
    imshow('BioID_0000.pgm');
    h = drawrectangle('Label', 'k fino', 'Color', [1 1 0], 'Position', [2, 2, 120, 40]);
    %}
    
function a = test
    
    a = timer('ExecutionMode','fixedRate','Period',5,'TimerFcn',@myfun);
    start(a);
end

function myfun(obj,evt)
    figure;
    rect = evalin('base', 'h');
    cropRect = rect.Position;
    I = imread('BioID_0000.pgm');
    J = imcrop(I, rect.Position);
    imshow(J);
    disp('===============');
end