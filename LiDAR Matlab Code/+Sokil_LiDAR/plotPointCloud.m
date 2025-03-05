function plotPointCloud(ptCloud, txt)
% PLOTPOINTCLOUD takes in a matlab pointcloud and creates a plot with the
% title of the input string txt
    figure;
    pcshow(ptCloud,"MarkerSize",10,"ColorSource", "Intensity")
    title('Point Cloud' , txt);
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
    %axis equal;
    colorbar;
end