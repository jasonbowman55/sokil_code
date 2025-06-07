function ptClouds = normalizeAllPointCloudsElevation(ptClouds)
% NORMALIZEALLPOINTCLOUDS takes in a matlab pointcloud array and fits the
% ground to the x-y plane for all point clouds

%This actually didn't work for me, but individually on a point cloud the
%sinle one does, so I'm unsure if it's that some of our pointclouds don't work w/
%matlabs code that I modified slightly, or if there's a bug. 
    for i = 1:length(ptClouds)
        ptClouds{i} = Sokil_LiDAR.normalizePointCloudElevation(ptClouds{i});
    end
end

