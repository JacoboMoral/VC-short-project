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

%read data and store it
rawData = extractData(path);

%split dataset
[trainingData, testData] = splitData(rawData, splitRatio);

%del training -> recortar ojos y recortar no ojos * 10
[eyesImages, noEyesImages] = getEyesAndRest(trainingData, eyesRatio);

%get looks (ulls tancats o oberts)
[looksImages, noLooksImages] = getLooksAndRest(eyesImages, trainingData.looking);

%extreure caracteristiques ulls
HOGFeaturesEyes = getHOGFeatures(eyesImages);


