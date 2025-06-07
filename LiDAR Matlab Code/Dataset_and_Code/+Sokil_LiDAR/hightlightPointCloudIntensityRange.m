function maxContrastPointCloud = maxContrastSinglePointCloud(ptCloud,intensityMin, intensityMax)
% MAXCONTRASTSINGLEPOINTCLOUD takes in a matlab pointcloud and fits the
% ground to the x-y plane 

% Normalize elevation by ground
highlightIntensity = ptCloud.Intensity;
maxIntensity = max(ptCloud.Intensity(:));
minIntensity = min(ptCloud.Intensity(:));

for i = 1:length(ptCloud)
    %normalize the intensity to range [1,255]
    highlightIntensity(i) = 1 + (highlightIntensity(i) - minIntensity) * (254/(maxIntensity-minIntensity))
end

maxContrastPointCloud = pointCloud(ptCloud.Location,"Intensity", highlightIntensity);
end