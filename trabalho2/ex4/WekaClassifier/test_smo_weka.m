%
% ISEL - Instituto Superior de Engenharia de Lisboa.
%
% LEIC - Licenciatura em Engenharia Informatica e de Computadores.
%
% PIB - Processamento de Imagem e Biometria.
%
% test_smo_weka.m  
% Learn and evaluate a SVM classifier using WEKA.
% Input:
%   X,  n x d, matrix with the training examples.
%   y,  n x 1, vector with the training class labels.
%   Xt, m x d, matrix with the test examples.
%   yt, m x 1, vector with the test class labels.
% Output:
%   Lab, m x 1, vector with the predicted class labels.
%   Err, a scalar with the percentage of error on the test set. 

function [Lab, Err] = test_smo_weka(X,Y,Xt,Yt)

% Check if the class labels are in their range.
uu = unique(Y);
if ( min(uu)~=1 )
    error(' Y is not in 1,2,3,...');
end

% Prepare train data
train_data = wekaCategoricalData(X,SY2MY(Y));

% Learn/train classifier
t = weka.classifiers.functions.SMO();
t.buildClassifier( train_data );

% Evaluate on the test set
n   = size(Xt,1); 
Lab = zeros(1,n);
for i=1 : n
    test_instance = weka.core.Instance(1.0, Xt(i,:) );
    test_instance.setDataset( train_data );
    Lab(i)        = t.classifyInstance( test_instance );
    % lab \in {0, 1}
end

Lab = Lab + 1;
% lab \in {1, 2, ...}

% Compute test error (percentage).
Err = 100*( length( find( Yt ~= Lab') ) / n );
return;
