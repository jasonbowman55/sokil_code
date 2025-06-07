function viewPointClouds(ptClouds)
    % viewPointClouds takes in a cell array of matlab point clouds and
    % plots each one individually for the user to view
    for i = 1:length(ptClouds)
         Sokil_LiDAR.plotPointCloud(ptClouds{i},"PointCloud" + string(i));
         next = input('Click enter in Command Window for next PointCloud.', 's');
         while next ~= char(32)
            % Prompt user to add a bounding box
            next = input('Click enter in Command Window for next PointCloud.', 's');
         end
         close;
    end
end