function convertSingleLAStoPCD(lasfile,folderPath,pcdFilename)
    %%CONVERTSINGLELASTOPCD takes in a las file and outputs a pcd file
    %%with the inputed name and folder destination
    ptCloud = Sokil_LiDAR.convertSingleLASToPointCloud(lasfile);
    Sokil_LiDAR.convertSinglePointCloudToPCD(ptCloud,folderPath,pcdFilename);  
end 