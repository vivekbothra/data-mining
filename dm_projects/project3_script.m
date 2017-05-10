A= csvread('handwritten.txt');
labels = A(1,:);
data = A(2:size(A,1),:);
k=26;


[clusterID center]=kmeans(data',k);

newclusterID= clusterID'
C= confusionMatrix(labels,clusterID');
acc = (sum(diag(C))/sum(sum(C)))*100;


