function memberships = find_closest_centroid(X, centroids)
    
    %Get the amount of rows in X
    [N,~]=size(X);
    %Get the amount of rows in centroids.
    [c,~]=size(centroids);
    %Create a distance array containing the number of rows and columns.
    dist = zeros(N,c);
   
    %Over the clusters
    for i = 1:c
        %Find the Euclidean Distance
        dist(:,i) = sum(bsxfun(@minus, X, centroids(i,:)).^2, 2);
    end
    
    %Determine the membership as the minimum distances.
    [~,memberships] = min(dist,[],2);
    
end

