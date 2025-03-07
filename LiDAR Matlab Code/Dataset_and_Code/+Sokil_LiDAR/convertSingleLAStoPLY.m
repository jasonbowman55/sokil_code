function convertSingleLAStoPLY(lasfile,folderPath,plyFilename)
    %%CONVERTSINGLELASTOPLY takes in a las file and outputs a ply file
    %%with the inputed name and folder destination
    ptCloud = Sokil_LiDAR.convertSingleLASToPointCloud(lasfile);
    Sokil_LiDAR.convertSinglePointCloudToPLY(ptCloud,folderPath,plyFilename);  
end 