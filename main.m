%read data and store it

%split dataset -> 30% test; 70% training

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
[trainingData, testData] = splitData(rawData, splitRatio);
[eyesImages, noEyesImages] = getEyesAndRest(trainingData, eyesRatio);
HOGFeatures = getHOGFeatures(eyesImages);
