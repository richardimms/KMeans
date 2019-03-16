function centroids = init_centroids(X, k)

    %Ensure the size of the array is the correct size.
    centroids = zeros(k, size(X, 2));

    % Randomly reorder examples
    randidx = randperm(size(X, 1));

    % Take the first k examples as centroids
    centroids = X(randidx(1:k), :);
    
end

