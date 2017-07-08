%
% ISEL - Instituto Superior de Engenharia de Lisboa.
%
% LEIC - Licenciatura em Engenharia Informatica e de Computadores.
%
% PIB - Processamento de Imagem e Biometria.
%
% set_iris.m 
% Set a partition of the Iris dataset. 
% Input:
%   TrainExamples, number of training examples (per class). 
%   TestExamples, number of test examples (per class).  
% Output:
%   X,  n x d, matrix with the training examples.
%   y,  n x 1, vector with the training class labels.
%   Xt, m x d, matrix with the test examples.
%   yt, m x 1, vector with the test class labels.

function [X, y, Xt, yt ] = set_CaltechFaceDatabase( TrainExamples, TestExamples )

fid = fopen( 'CaltechFaceDatabase.data' );
if ( fid == -1 )
    error(' Opening hepatitis.data ');
end
% All data patterns. 
% The last column is the class label.
M = 58; N = 2;
Data = zeros ( M, N );
j = 1;
for i=1 : M  
    tline = fgets( fid );  
    Data(i,:) = str2num( tline );    
end
fclose( fid );
            
data   = Data(:, 2:end );
labels = Data(:, 1 );

[M,N] = size(Data);

fprintf(' ----------------------------------- \n');
fprintf(' Dataset: %d patterns \n', size(Data,1) );
fprintf(' Class 1 = %d \n', length( find(Data(:,N)==1)) );
fprintf(' Class 2 = %d \n', length( find(Data(:,N)==2)) );
fprintf(' Class 3 = %d \n', length( find(Data(:,N)==3)) );

% Random partition - training set.
class_a = randi( [1,   21], [1, TrainExamples ] );
class_b = randi( [22, 42], [1, TrainExamples ] );
class_c = randi( [43, 58],[1, TrainExamples ] );

% Compose the training data patterns.
X = [ Data(class_a, 1:(N-1));  Data(class_b, 1:(N-1));  Data(class_c, 1:(N-1)) ]; 
% Compose the training data labels.
y = [ Data(class_a,N); Data(class_b,N); Data(class_c,N) ];

% Random partition - test set.
class_a = randi([1,   21],  [TrainExamples, TestExamples] );
class_b = randi([22,  42], [TrainExamples, TestExamples]  );
class_c = randi([43, 58], [TrainExamples, TestExamples] );

% Compose the test data patterns.
Xt = [ Data(class_a, 1:(N-1));  Data(class_b, 1:(N-1));  Data(class_c, 1:(N-1)) ]; 
% Compose the test data labels.
yt = [ Data(class_a,N); Data(class_b,N); Data(class_c,N) ];


return;
