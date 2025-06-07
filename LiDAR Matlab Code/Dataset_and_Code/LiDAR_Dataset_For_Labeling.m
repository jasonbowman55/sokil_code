%%Code for downsampling current dataset to 100,000 for quick labeling, and
%%normalizing the ground

addpath('+Sokil_LiDAR')

ds = Sokil_LiDAR.makeLASDatastore();
pointClouds = Sokil_LiDAR.makeAllPointCloudsFromDatastore(ds); %this creates a cell array full of our point clouds, works like normal array but use {} instead!
pointClouds = Sokil_LiDAR.downsampleAllPointClouds(pointClouds, 225000); %downsample to 250,000 to decrease size
pointClouds{14} = Sokil_LiDAR.cropPointCloud(pointClouds{14},-2, 2, -2,2, -3,2); %these two point clouds have major outliers and dcnoise nearest neighbor and threshold wasn't working for me
pointClouds{15} = Sokil_LiDAR.cropPointCloud(pointClouds{14},-2, 2, -2,2, -3,2);
pointClouds = Sokil_LiDAR.downsampleAllPointClouds(pointClouds, 200000); %downsample to 200,000 for consistent point cloud size (outlier removal might have made them uneven)
pointCloudsModified = Sokil_LiDAR.maxContrastAllPointClouds(pointClouds);
Sokil_LiDAR.viewPointClouds(pointClouds); %allows to go through each pointcloud and see if it looks right
Sokil_LiDAR.convertAllPointCloudsToPCD(pointClouds,'PCD_For_Labeling');
Sokil_LiDAR.plotPointCloud(pointCloudsModified{48}, "modified")
Sokil_LiDAR.plotPointCloud(pointClouds{48}, "original")
