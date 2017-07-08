%
% ISEL - Instituto Superior de Engenharia de Lisboa.
%
% LEIC - Licenciatura em Engenharia Informatica e de Computadores.
%
% PIB - Processamento de Imagem e Biometria.
%
% main_weka.m  
% Use of the WEKA tool for machine learning.
%

function main_weka()

% Get the current path.
curPath = pwd;

% Load weka jar, and common interfacing methods.
path(path, [curPath filesep 'lib']);
path(path, [curPath filesep 'lib' filesep 'weka']);
loadWeka([filesep 'lib' filesep 'weka']);

% Set the train and the test data.
% Number of train patterns (per class).
TrainExamples = 10;

% Number of test patterns (per class).
TestExamples = 6;

% Load the dataset (train and test).
[X, y, Xt, yt ] = set_CaltechFaceDatabase( TrainExamples, TestExamples );
%[X, y, Xt, yt ] =  set_hepatitis( TrainExamples, TestExamples);
    
% Train an SVM classifier and evaluate its 
% performance on the test set.
[predicted_yt, Err_perc] = test_smo_weka( X, y, Xt, yt );       

[predicted_yt ; yt']'
Err_perc
Err_number = Err_perc * length(yt) / 100

% Train a decision tree classifier and evaluate its 
[predicted_yt, Err_perc] = test_j48_weka( X, y, Xt, yt );       
[predicted_yt ; yt']'
Err_perc
Err_number = Err_perc * length(yt) / 100

end

