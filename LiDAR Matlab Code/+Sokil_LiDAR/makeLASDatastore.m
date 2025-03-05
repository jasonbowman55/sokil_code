function ds = makeLASDatastore()
% MAKELASDATASTORE goes through the steps of creating a datastore with its
% folderPath to our 'Dataset' folder. this datastore has the 'ReadFcn'
% LASTOSINGLEPOINTCLOUD

folderPath = 'Dataset';
filePattern = fullfile(folderPath,'PtCloud*.las');

%Create a datastore, essentially this creates a list of the files to call
ds = fileDatastore(filePattern, 'ReadFcn', @Sokil_LiDAR.LASToSinglePointCloud);

end