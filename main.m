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

featuresEyes = extractFeatures(eyesImages, 1);
featuresNoEyes = extractFeatures(noEyesImages, 0);
featuresEyesAndNoEyes = mash(featuresEyes, featuresNoEyes);

[trainingEyes, testEyes] = splitData(featuresEyesAndNoEyes, splitRatio);
%[trainingLooks, testLooks] = splitData(rawData, splitRatio);

y = extractYFromFeatures(featuresEyes);
X = extractMatrixFromFeatures(featuresEyes);


%preparar


%training of model using TreeBagger
model = TreeBagger(100,X, y);
