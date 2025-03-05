function ptCloud = downsampleSinglePointCloud(ptCloud, numPoints)
    % DOWNSAMPLE2SIZE downsamples the pointcloud by sampling randomly
    % and ensures number of points is exactly the number of points
    % specificed
    % OUTPUT = DOWNSAMPLE2SIZE(PTCLOUD, NUMPOINTS) takes a point cloud and
    % returns the downsampled pointcloud

    ptCloudDownsampled = pcdownsample(ptCloud, 'random', numPoints / ptCloud.Count);

    % Ensure the number of points matches the desired count 
    if ptCloudDownsampled.Count > numPoints 
        ptCloudDownsampled = select(ptCloudDownsampled, 1:numPoints); 
    end 
    ptCloud = ptCloudDownsampled;
end