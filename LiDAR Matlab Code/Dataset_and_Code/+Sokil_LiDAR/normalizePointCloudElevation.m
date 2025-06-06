function normalizedPointCloud = normalizePointCloudElevation(ptCloud)
% NORMALIZEPOINTCLOUDELEVATION takes in a matlab pointcloud and fits the
% ground to the x-y plane 

%%WARNING:used this on one of our fall test datasets... and it flattens
%%them. It worked somewhat with tall elevation, would probably want to find
%%a more complex algorithm for this unfortunately 

%this is copy and pasted exactly from the matlab documentation found here: https://www.mathworks.com/help/lidar/ug/extraction-of-forest-metrics-and-individual-tree-attributes.html
groundPtsIdx = segmentGroundSMRF(ptCloud);
groundPtCloud = select(ptCloud,groundPtsIdx);

groundPoints = groundPtCloud.Location;
%Eliminate duplicate points along x- and y-axes
[uniqueZ,uniqueXY] = groupsummary(groundPoints(:,3),groundPoints(:,1:2),@mean);
uniqueXY = [uniqueXY{:}];
% Create interpolant and use it to estimate ground elevation at each point
F = scatteredInterpolant(double(uniqueXY),double(uniqueZ),"natural");
estElevation = F(double(ptCloud.Location(:,1)),double(ptCloud.Location(:,2)));
% Normalize elevation by ground
normalizedPoints = ptCloud.Location;
normalizedPoints(:,3) = normalizedPoints( :,3) - estElevation;

%This part I added to add intensity data back (:
normalizedPointCloud = pointCloud(normalizedPoints,"Intensity",ptCloud.Intensity);
end