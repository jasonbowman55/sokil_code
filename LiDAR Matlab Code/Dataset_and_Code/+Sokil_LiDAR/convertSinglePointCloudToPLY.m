function convertSinglePointCloudToPLY(ptCloud,folderPath,outputFileName)
    %%CONVERTSINGLEPOINTCLOUDTOPLY takes in a atlab point cloud, converts
    %%it to .ply and then saves it in a new folder 
    if ~exist(folderPath, 'dir')
        mkdir(folderPath);
    end
        outputFile = outputFileName + '.ply';
        filePath = fullfile(folderPath,outputFile);
        pcwrite(ptCloud,filePath);
end