function maxContrastPointClouds = maxContrastAllPointClouds(ptClouds)
% MAXCONTRASTALLPOINTCLOUDS takes in a matlab pointcloud cell array and
% maximizes the intensity contrast
    for i = 1:length(ptClouds)
        maxContrastPointClouds{i} = Sokil_LiDAR.maxContrastSinglePointCloud(ptClouds{i});
    end
end