
A = csvread('handwritten.txt'); %reading the data
k=5;    %selecting the k in k-fold cross


[train test] = cValidation(A,k);      % returns K folds of training and test


 
 
for c = 1:k
tr =train{c};
ts =test{c};
train_labels = tr(1,1:size(tr,2));
test_labels = ts(1,1:size(ts,2));
tr=(tr(2:size(tr,1),1:size(tr,2))');
ts=(ts(2:size(ts,1),1:size(ts,2))');
%    [predKNN accuracyknn] = knn(tr,ts,train_labels,test_labels,3);
%      [predCentroid accuracycentroid] = centroid(tr,ts,train_labels,test_labels);
%      [predRegression accuracyregr] = linearRegression(tr,ts,train_labels,test_labels);
    [predSVM accuracysvm]=svmClassifier(tr,ts,train_labels,test_labels);
%accuracyknn
%accuracycentroid
%accuracyregr
%accuracysvm
%    knn_accuracy{c} = accuracyknn
%      Centroid_accuracy{c} = accuracycentroid
%      Regression_accuracy{c} = accuracyregr
   SVM_accuracy{c} = accuracysvm;
end
% AverageAccuracyKNN = sum([knn_accuracy{1:k}])/k;
% AverageAccuracyCentroid = sum([Centroid_accuracy{1:k}])/k;
% AverageAccuracyRegression = sum([Regression_accuracy{1:k}])/k;
%  AverageAccuracySVM = sum([SVM_accuracy{1:k}])/k;
