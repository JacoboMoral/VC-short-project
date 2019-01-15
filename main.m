%read data and store it

%split dataset -> 20% test; 80% training

%del training -> recortar ojos y recortar no ojos * 10

%extreure caracteristiques ulls

%aplicar algoritmo clasificador a las caracteristicas anteriores para
%entrenar

%usar dataset test para comprovar la precision

%SE TIENE QUE *CREAR* LAS IMAGENES DE OJOS ANTES O DESPUES DEL SPLIT??





%clear;
close all;

%CONSTANTS
path = strcat(pwd,'./raw_data/');
splitRatio = 0.8; %ratio of training data of the whole
eyesRatio = 0.05; %ratio of images being actual eyes

%{
rawData = extractData(path);

[eyesImages, noEyesImages] = getEyesAndRest(rawData, eyesRatio);

%[looksImages, noLooksImages] = getLooksAndRest(eyesImages, rawData.looking);

%clear rawData;

%}
featuresEyes = extractFeatures(eyesImages, 1);

%clear eyesImages;

featuresNoEyes = extractFeatures(noEyesImages, 0);

%clear noEyesImages;


featuresEyesAndNoEyes = mash(featuresEyes, featuresNoEyes);

%clear featuresEyes;
%clear featuresNoEyes;

[trainingEyes, testEyes] = splitData(featuresEyesAndNoEyes, splitRatio);
%[trainingLooks, testLooks] = splitData(rawData, splitRatio);

%clear featuresEyesAndNoEyes;

y = extractYFromFeatures(trainingEyes);
X = extractMatrixFromFeatures(trainingEyes);


%preparar


%training of model using TreeBagger
trainedModel = TreeBagger(100,X, y);

ytesting = extractYFromFeatures(testEyes);
Xtesting = extractMatrixFromFeatures(testEyes);

p = test(trainedModel, Xtesting);
p = str2num(cell2mat(p));
conf = confusionmat(p, ytesting);

%FALTA SACAR FEATURES + ENTRENAR A LOS DOS DATASETS QUE MIRAN Y NO MIRAN A
%LA CAMARA
