function pointClouds = correctAllPointCloudsOrientation(ptClouds)
    % CORRECTALLPOINTCLOUDSORIENTATION takes in a matlab pointcloud and
    % fixes the orientation based on how we capture point clouds with our
    % avia from the drone 
    for i = 1:length(ptClouds)
        pointClouds{i} =correctSinglePointCloudOrientation(ptClouds{i})
    end
end