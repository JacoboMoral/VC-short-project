%read data and store it

%split dataset -> 20% test; 80% training

%del training -> recortar ojos y recortar no ojos * 10

%extreure caracteristiques ulls

%aplicar algoritmo clasificador a las caracteristicas anteriores para
%entrenar

%usar dataset test para comprovar la precision

%SE TIENE QUE *CREAR* LAS IMAGENES DE OJOS ANTES O DESPUES DEL SPLIT??

clear;
close all;

%CONSTANTS
path = strcat(pwd,'./raw_data/');
splitRatio = 0.8; %ratio of training data of the whole
eyesRatio = 0.05; %ratio of images being actual eyes

rawData = extractData(path);

[eyesImages, noEyesImages] = getEyesAndRest(rawData, eyesRatio);

[looksImages, noLooksImages] = getLooksAndRest(eyesImages, rawData.looking);

HOGFeaturesEyes = getHOGFeatures(eyesImages, 1);
HOGFeaturesNoEyes = getHOGFeatures(noEyesImages, 0);
%HogFeaturesEyesAndNoEyes = mash(HOGFeaturesEyes, HOGFeaturesNoEyes);

[X, y] = extractInfoFromHOGFeatures(HOGFeaturesEyes);


[trainingEyes, testEyes] = splitData(rawData, splitRatio);

[trainingLooks, testLooks] = splitData(rawData, splitRatio);


%preparar


%training of model using TreeBagger
model = TreeBagger(100,X,y);
