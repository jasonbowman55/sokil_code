function pointCloud = removePointCloudGround(ptCloud)
% REMOVEPOINTCLOUDGROUND takes in a matlab pointcloud and removes the
% ground points 
    groundPts = segmentGroundSMRF(ptCloud);
    pointCloud = select(ptCloud, ~groundPts)
end