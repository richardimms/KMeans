function [centroids,memberships] = k_means(X, initial_centroids, max_iters)

    %Make the number of clusters equal the amount of centroids.
    k = size(initial_centroids, 1);

    %Assign the initial centroids to variable of centroids.
    centroids = initial_centroids;
    
    %Assign centroids to prev centroids for itteration p
    prevCentroids = centroids;

    % Run K-Means
    for (i = 1 : max_iters)

        % For each example in X, assign it to the closest centroid
        memberships = find_closest_centroid(X, centroids);
        % Given the memberships, compute new centroids
        centroids = compute_centroids(X, centroids, memberships, k);

        % Check for convergence. If the centroids haven't changed since
        % last iteration, we've converged.
        if (prevCentroids == centroids)
            break;
        end
        
        % Update the 'previous' centroids.
        prevCentroids = centroids;
    end

end

