function convertSinglePointCloudsToPCD(ptCloud)
    % CONVERTSInglePointCloudsToPCD takes a matlab point cloud and
    % converts it into .pcd file format and saves it as a pcd
        colorData = im2uint8(ptCloud.Color);
        ptCloudMod = pointCloud(ptCloud.Location, 'Color', colorData);
        outputFile = 'pointCloud' + '.pcd';
        filePath = fullfile(outputFile);
        pcwrite(ptCloudMod,filePath);
end