A = csvread('iris_new.txt') %reading the data
k=3;    %selecting the k in k-fold cross
  
label = A(1,:);
A = A(2:size(A,1),:);
% dimensions = [5,10,20,30,50,100,200];  

feature = featureSelection2(A,4,label);               %validation
                                                  %test data
 for i=1:size(feature,1)
 ind = feature(i);
 %fprintf('feature: %d',ind);
 data_set(i,:) = A(ind,:);
 end
 data_set = [label;data_set] ;

[train test] = cValidation(data_set,k);      % returns K folds of training and
for c = 1:k
tr =train{c};
ts =test{c};
train_labels = tr(1,:);
test_labels = ts(1,:);
tr=(tr(2:size(tr,1),:)');
ts=(ts(2:size(ts,1),:)');
[predKNN,accuracyknn] = knn(tr,ts,train_labels,test_labels,1);
[predCentroid accuracycentroid] = centroid(tr,ts,train_labels,test_labels);
[predRegression accuracyregr] = linearRegression(tr,ts,train_labels,test_labels);
 [predSVM,accuracysvm]=svmClassifier(tr,ts,train_labels,test_labels);
%accuracyknn
%accuracycentroid
%accuracyregr
%accuracysvm
knn_accuracy{c} = accuracyknn;
Centroid_accuracy{c} = accuracycentroid;
Regression_accuracy{c} = accuracyregr;
 SVM_accuracy{c} = accuracysvm;
end
fprintf('5 dimensions feature selection');
AverageAccuracyKNN = sum([knn_accuracy{1:k}])/k
AverageAccuracyCentroid = sum([Centroid_accuracy{1:k}])/k
AverageAccuracyRegression = sum([Regression_accuracy{1:k}])/k
 AverageAccuracySVM = sum([SVM_accuracy{1:k}])/k

