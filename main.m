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

path = strcat(pwd,'./raw_data/');
splitRatio = 0.8; %ratio of training data of the whole


rawData = extractData(path);
[trainingData, testData] = splitData(rawData, splitRatio);
eyesImages = getEyes(trainingData);