%close all windows;
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

featuresLooks = extractFeatures(looksImages, 1);
featuresNoLooks = extractFeatures(noLooksImages, 0);
featuresLooksAndNoLooks = mash(featuresLooks, featuresNoLooks);

[trainingEyes, testEyes] = splitData(featuresEyesAndNoEyes, splitRatio);
[trainingLooks, testLooks] = splitData(featuresLooksAndNoLooks, splitRatio);


yeyes = extractYFromFeatures(trainingEyes);
Xeyes = extractMatrixFromFeatures(trainingEyes);

ylooks = extractYFromFeatures(trainingLooks);
Xlooks = extractMatrixFromFeatures(trainingLooks);


%training of models using TreeBagger
eyesPredictionModel = TreeBagger(100, Xeyes, yeyes);
looksPredictionFromEyesModel = TreeBagger(100, Xlooks, ylooks);

yeyesTesting = extractYFromFeatures(testEyes);
XeyesTesting = extractMatrixFromFeatures(testEyes);

ylooksTesting = extractYFromFeatures(testLooks);
XlooksTesting = extractMatrixFromFeatures(testLooks);

p1 = test(eyesPredictionModel, XeyesTesting);
p1 = str2num(cell2mat(p1));
conf1 = confusionmat(yeyesTesting, p1);

p2 = test(looksPredictionFromEyesModel, XlooksTesting);
p2 = str2num(cell2mat(p2));
conf2 = confusionmat(ylooksTesting, p2);