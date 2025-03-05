%%Dataset Code 
%What this code does is it allows easy modification of our dataset and
%We need to do transforms, downsampling, etc. and so this is useful 

addpath('+Sokil_LiDAR')

ds = Sokil_LiDAR.makeLASDatastore();
pointClouds = Sokil_LiDAR.makeAllPointCloudsFromDatastore(ds);
pointClouds = Sokil_LiDAR.downsampleAllPointClouds(pointClouds, 500000);
pointCloud1 = pointClouds{1};
%Sokil_LiDAR.convertAllPointCloudsToPCD(pointClouds);
Sokil_LiDAR.convertAllPointCloudsToPLY(pointClouds);
Sokil_LiDAR.plotPointCloud(pointCloud1, "Point Cloud")