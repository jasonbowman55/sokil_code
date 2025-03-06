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
end