function pointCloud = convertSinglePCDToPointCloud(pcdFile)
% CONVERTSINGLEPCDTOPOINTCLOUD takes a pcd file and creates a matlab pointcloud
 pointCloud = pcread(pcdFile);
end