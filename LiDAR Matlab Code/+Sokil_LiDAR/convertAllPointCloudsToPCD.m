function convertAllPointCloudsToPCD(ptClouds)
    % CONVERTAllPointCloudsToPCD takes in a cell array of matlab point clouds and
    % converts all of them into .pcd file format and saves them in a new
    % folder called PCD_Dataset
    folderPath = 'PCD_Dataset';
    if ~exist(folderPath, 'dir')
        mkdir(folderPath);
    end
    for i = 1:length(ptClouds)
        colorData = im2uint8(ptClouds{i}.Color);
        ptCloudMod = pointCloud(ptClouds{i}.Location, 'Color', colorData);
        outputFile = 'pointCloud' + string(i) + '.pcd';
        filePath = fullfile(folderPath, outputFile);
        pcwrite(ptCloudMod,filePath);
    end
end
