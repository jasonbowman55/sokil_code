function convertAllPointCloudsToPCD(ptClouds,folderPath)
    % CONVERTAllPOINTCLOUDSTOPCD takes in a cell array of matlab point clouds and
    % converts all of them into .pcd file format and saves them in a new
    % folder 
    for i = 1:length(ptClouds)
        outputFile = 'pointCloud' + string(i);
        Sokil_LiDAR.convertSinglePointCloudToPCD(ptClouds{i},folderPath,outputFile);
    end
end