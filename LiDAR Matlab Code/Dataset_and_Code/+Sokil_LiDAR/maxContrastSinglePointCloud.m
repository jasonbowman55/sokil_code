function maxContrastPointCloud = maxContrastSinglePointCloud(ptCloud)
    % MAXCONTRASTSINGLEPOINTCLOUD takes a MATLAB point cloud and
    % maximizes its intensity contrast using adaptive histogram equalization.
    
    % Extract intensity values and normalize them to the range [1, 255]
    highlightIntensity = ptCloud.Intensity;
    minIntensity = min(highlightIntensity(:));
    maxIntensity = max(highlightIntensity(:));
    highlightIntensity = 1 + (highlightIntensity - minIntensity) * (254 / (maxIntensity - minIntensity));
    
    % Number of intensity points
    numPoints = numel(highlightIntensity);
    
    % Use ceil to determine a square size that can hold all points.
    newSize = ceil(sqrt(numPoints));
    
    % Calculate the required padding amount so that the total number of elements equals newSize^2
    padAmt = newSize^2 - numPoints;
    
    % Pad the intensity array at the end to create a complete square.
    paddedIntensity = padarray(highlightIntensity, [padAmt, 0], 'post');
    
    % Reshape into a 2D matrix of size newSize x newSize
    reshapedIntensity = reshape(paddedIntensity, newSize, newSize);
    
    % Apply adaptive histogram equalization
    enhancedIntensity = adapthisteq(uint8(reshapedIntensity));
    
    % Flatten the 2D matrix back to a vector and then crop to preserve the original count
    newData = double(enhancedIntensity(:));
    enhancedHighlightIntensity = newData(1:numPoints);
    
    % Create a new point cloud using the enhanced intensity values
    maxContrastPointCloud = pointCloud(ptCloud.Location, "Intensity", enhancedHighlightIntensity);
end
