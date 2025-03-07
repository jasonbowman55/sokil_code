function convertAllPointCloudsToPLY(ptClouds, folderPath)
    % CONVERTALLPOINTCLOUDSTOPLY takes in a cell array of matlab point clouds and
    % converts all of them into .ply file format and saves them in a new
    for i = 1:length(ptClouds)
        outputFile = 'pointCloud' + string(i);
        Sokil_LiDAR.convertSinglePointCloudToPLY(ptClouds{i},folderPath,outputFile);
    end
end