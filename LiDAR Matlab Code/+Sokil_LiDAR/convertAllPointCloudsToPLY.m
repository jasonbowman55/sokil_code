function convertAllPointCloudsToPLY(ptClouds)
    % CONVERTALLPOINTCLOUDSTOPLY takes in a cell array of matlab point clouds and
    % converts all of them into .ply file format and saves them in a new
    % folder called PLY_Dataset
    folderPath = 'PLY_Dataset';
    if ~exist(folderPath, 'dir')
        mkdir(folderPath);
    end
    for i = 1:length(ptClouds)
        outputFile = 'pointCloud' + string(i) + '.ply';
        filePath = fullfile(folderPath, outputFile);
        pcwrite(ptClouds{i},filePath);
    end
end