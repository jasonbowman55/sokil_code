function pointCloud = correctSinglePointCloudOrientation(ptCloud)
    % CORRECTSINGLEPOINTCLOUDORIENTATION takes in a matlab pointcloud and
    % fixes the orientation based on how we capture point clouds with our
    % avia from the drone 
    
    % Define the transformation matrix to swap X and Z axes and flip final Z
    % axis (it will be sideways if you don't do this)
    tform = affine3d([0 0 -1 0; 0 1 0 0; 1 0 0 0; 0 0 0 1]);

    %Apply the transformation
    pointCloud = pctransform(ptCloud, tform);
end
