function kmeans_clustering()

%Define the mean for set 1 and 2.
mean1 = mean(-4,1);
mean2 = mean(3,4);

%Define the std for set1 and 2.
std1 = 0.75;
std2 = 2.0;

%Define the sample size.
samples = 10000;

%Create the two sample sets with standard deviation and mean.
set1  = randn(samples,2) * std1 + mean1;
set2  = randn(samples,2) * std2 + mean2;

%Data X is all rows from the first column.        
x1 = set1(1:end,1);
x2 = set2(1:end,1);
%Data Y is all rows from the second column
y1 = set1(1:end,2);
y2 = set2(1:end,2);

%Concatenate the datasets
TrainData = [set1;set2;];

x3 = TrainData(1:end,1);
y3 = TrainData(1:end,2);

%Initialise the centroids
initialCentroids = init_centroids(TrainData,2);

%Use Kmeans Algorithm to cluster.
[centroids,member] = k_means(TrainData, initialCentroids, 100);

%Plot the graph.
figure(1);hold on;
title('K-Means classification on data points');
xlabel('x-value');
ylabel('y-value');
plot(x3(member==1),y3(member==1),'r.');
plot(x3(member==2),y3(member==2),'b.');
plot(centroids,'kx','LineWidth',3);
legend('cluster 1','cluster 2');

% figure;hold on;
% title('2D raw data plot');
% xlabel('x-value');
% ylabel('y-value');
% 
% plot(x1,y1,'b.');
% plot(x2,y2,'r.');
% legend('cluster 1','cluster 2')


%  figure;hold on;
%  title('2D raw data plot concat');
%  xlabel('x-value');
%  ylabel('y-value');
%  
%  plot(x3,y3,'b.');


end
