%%Labeling
%This script was generated using Microsoft's Copilot AI
% Load the PCD dataset
pcdFolder = 'PCD_Dataset';
pcds = fileDatastore(pcdFolder, 'ReadFcn', @pcread);

% Create a folder to save labels if it doesn't exist
labelFolder = 'labels';
if ~exist(labelFolder, 'dir')
    mkdir(labelFolder);
end

% Loop through the dataset and add bounding boxes
for i = 1:numel(pcds.Files)
    % Read point cloud
    ptCloud = read(pcds);
    
    % Display point cloud
    figure;
    pcshow(ptCloud, "ColorSource", "Intensity");
    title(sprintf('Point Cloud %d', i));
    
    % Ask user if the point cloud contains any objects
    containsObjects = input('Does this point cloud contain any objects? (y/n): ', 's');
    
    if strcmpi(containsObjects, 'y')
        boundingBoxes = [];
        classLabels = {};
        
        while true
            % Prompt user to add a bounding box
            disp('Draw a bounding box on the point cloud. Press Enter when done.');
            bbox = drawcuboid('Color', 'r');
            
            % Adjust the size of the bounding box
            bbox.Position(4:6) = bbox.Position(4:6) * 0.5; % Scale down the size by 50%
            
            % Store bounding box data
            boundingBoxes = [boundingBoxes; bbox.Position];
            
            % Prompt user to enter class label for the bounding box
            classLabel = input('Enter class label for the bounding box: ', 's');
            classLabels{end+1} = classLabel;
            
            % Ask if the user wants to add another bounding box
            addAnother = input('Do you want to add another bounding box? (y/n): ', 's');
            if strcmpi(addAnother, 'n')
                break;
            end
        end
        
        % Create a structure to store bounding box and label data
        labelData = struct('BoundingBoxes', boundingBoxes, 'ClassLabels', {classLabels});
        
        % Save label data to a file
        labelFileName = fullfile(labelFolder, sprintf('label_%d.mat', i));
        save(labelFileName, 'labelData');
    else
        disp('Skipping this point cloud.');
    end
    
    % Close figure
    close;
end

disp('Bounding boxes and labels saved to the labels folder.');