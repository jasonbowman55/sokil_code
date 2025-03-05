function ptCloud = LASToSinglePointCloud(lasFileLocation)
    % LAS2POINTCLOUD creates a downsampled matlab pointcloud based on an
    % input las file
    % OUTPUT = LAS2POINTCLOUD(LASFILELOCATION,DOWNSAMPLE) takes the las
    % file location and the downsampled number of points and returns the
    % downsampled matlab point cloud
    
    %read the las file
    lasReader = lasFileReader(lasFileLocation);

    % Read the point cloud data
    ptCloud = readPointCloud(lasReader);

    % Define the transformation matrix to swap X and Z axes and flip final Z
    % axis (it will be sideways if you don't do this)
    tform = affine3d([0 0 -1 0; 0 1 0 0; 1 0 0 0; 0 0 0 1]);

    %Apply the transformation
    ptCloud = pctransform(ptCloud, tform);
end