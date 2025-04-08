function croppedPtCloud = cropPointCloud(ptCloud, xmin,xmax, ymin, ymax, zmin, zmax)
% CROPPOINTCLOUD takes in a matlab pointcloud and crops it to the
% given x, y, z constraints in units of (m) I think. We should really check
% that ):
%

%Define the boundary conditions
boundaries = [xmin, xmax, ymin, ymax, zmin, zmax];

% Find points within the boundary conditions
indices = findPointsInROI(ptCloud, boundaries);

% Select the points within the boundary conditions
croppedPtCloud = select(ptCloud, indices);
end