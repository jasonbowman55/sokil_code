function convertSinglePointCloudToPCD(ptCloud,folderPath,pcdFilename)
    % CONVERTSInglePointCloudsToPCD takes a matlab point cloud and
    % converts it into .pcd file format and saves it as a pcd
    if ~exist(folderPath, 'dir')
        mkdir(folderPath);
    end
        colorData = im2uint8(ptCloud.Color);
        locationData = ptCloud.Location;
        intensityData = ptCloud.Intensity;
        ptCloudMod = pointCloud(locationData, 'Color', colorData, 'Intensity',intensityData);
        outputFile = pcdFilename + '.pcd';
        filePath = fullfile(folderPath,outputFile);
        pcwrite(ptCloudMod, filePath);
end