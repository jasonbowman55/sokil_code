function ptClouds = downsampleAllPointClouds(ptClouds, downsampling)
    for i = 1:length(ptClouds)
        ptClouds{i} = Sokil_LiDAR.downsampleSinglePointCloud(ptClouds{i},downsampling);
    end
end