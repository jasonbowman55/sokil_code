%%Dataset Code 
%What this code does is it allows easy modification of our dataset and
%We need to do transforms, downsampling, etc. and so this is useful 

addpath('+Sokil_LiDAR')

%We have our LAS Files saved in a folder 'Dataset', we have to create
%a datastore that hasa read function that says how to read them, I have it
%to where it reads them as a matlab type pointcloud. This allows us to use 
%the matlab lidar toolbox commands 
ds = Sokil_LiDAR.makeLASDatastore();
pointClouds = Sokil_LiDAR.makeAllPointCloudsFromDatastore(ds); %this creates a cell array full of our point clouds, works like normal array but use {} instead!
pointClouds = Sokil_LiDAR.downsampleAllPointClouds(pointClouds, 500000); %PLEASE I AM BEGGING YOU downsample or your code will take an EXTREMELY long time to run ),:
pointCloud1 = pointClouds{1}; %This is how you access a single point cloud from your cell array 

%Just so we can keep our files nice and organized (: 
folderPath_PCD = 'PCD_Dataset';
folderPath_PLY = 'PLY_Dataset';

Sokil_LiDAR.convertSinglePointCloudToPCD(pointCloud1,folderPath_PCD, "pointCloud1");

%These commands convert the matlab point clouds above, and save them in
%their respective folders 
%Sokil_LiDAR.convertAllPointCloudsToPCD(pointClouds, folderPath_PCD);
%Sokil_LiDAR.convertAllPointCloudsToPLY(pointClouds, folderPath_PLY);

%Single Pointcloud examples: 
%folderPath = 'Dataset';
%filename = 'Just-TM-62.las';
%filepattern = fullfile(folderPath,filename);
%TM62PointCloud = Sokil_LiDAR.convertSingleLASToPointCloud(filepattern);
%TM62PointCloud = Sokil_LiDAR.correctSinglePointCloudOrientation(TM62PointCloud);
%Sokil_LiDAR.plotPointCloud(TM62PointCloud, "Point Cloud")
%For Matlab point cloud file saving
%Sokil_LiDAR.convertSinglePointCloudToPLY(TM62PointCloud,folderPath_PLY, "JUST-TM-62");
%Sokil_LiDAR.convertSinglePointCloudToPCD(TM62PointCloud,folderPath_PCD, "JUST-TM-62");
%For LAS FILE Conversion
%Sokil_LiDAR.convertSingleLAStoPCD(filepattern,folderPath_PCD, "JUST-TM-62-Test2");
%Sokil_LiDAR.convertSingleLAStoPLY(filepattern,folderPath_PLY, "JUST-TM-62-Test2");

%filename = 'pointCloud1.pcd'
%filepattern = fullfile(folderPath_PCD,filename)
%ptCloud = Sokil_LiDAR.convertSinglePCDToPointCloud(filepattern)
%Sokil_LiDAR.plotPointCloud(ptCloud, "pcd test")


