function ptClouds = makeAllPointCloudsFromDatastore(ds)
    % MAKEALLPOINTCLOUDSFROMDATASTORE creates a cell array full of matlab point
    % clouds created from the las files stored in the datastore 
    % OUTPUT = MAKEPOINTCLOUDSFROMDS(DS) takes the datastore that gives
    % access to our .las files and converts the .las files into matlab
    % point clouds and stores in them in a cell array using the
    % las2PointCloud as the datastore 'ReadFcn'
    ptClouds = {};
    while hasdata(ds)
        ptCloud = read(ds);
        ptClouds{end + 1} = ptCloud;
    end
end