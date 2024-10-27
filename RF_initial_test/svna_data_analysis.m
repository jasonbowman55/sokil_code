function output = svna_data_analysis(x)
    % x = list of indexes used in file naming convention    x = 18;
    for i = 1:length(x) % Goes through each whole file
        file_i = string(x(i));
        csv_filename = append('CSV',file_i,'.csv');
    
        % Read the CSV file into a matrix
        data = csvread(csv_filename, 14, 0);
        
        % Extract the columns as matrices with all the data
        freq(i,:) = data(:, 1);  % frequency
        re(i,:) = data(:, 2);  % real 
        im(i,:) = data(:, 3);  % imaginary
    end
    

        % Error regression: go through columns 2 and 3, combine align the 5 
        % values for each column, standard deviation for each point, find average
        % plot with error based on std
        
        % Fourier Transform: convet to complex numbers (keep as radians)
    
    freq = freq*10^(-6);
    mag = sqrt(re.^2 + im.^2);
    logmag = 20*log10(mag);% log magnitude
    phase = atan2(im,re);
    
    output = [freq;mag;phase;re;im];

    
    %plot(data(:,1), data(:,2));
    %hold on;
    %plot(data(:,1), data(:,3));
    %hold off;
    %figure 
    %plot(data(:,2), data(:,3));
     
    %plot(data(:,1), unwrap(atan2(data(:,3),data(:,2))));
    
    
end
