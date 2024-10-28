% despriction of what it does

% output = [freq_avg;mag_avg;phase_avg;re;im]
clear all

% x = indexing "CSV_.csv" file from 10-21 test
x = [13 17 18];

% 11 = empty chamber w/ tube
normData = svna_data_analysis(11);

% Set up Legend
legend_all = ["Empty chamber (w/ cardboard)", "Empty chamber (w/out cardboard)", "Steel ball", "Acrylic ball", "HDPE Green sheet", "Steel block", "Aluminum sheet"];
% all possible x values
x_all = [11 12 13 15 17 16 18];
legend_L = []; % Legend string list
for y = x
    i = find(x_all==y); % index of desired x
    legend_L = [legend_L, legend_all(i)];
end

% Make plots
figure
for i = x
    data = svna_data_analysis(i);
    freq = data(1,:);
    % comp = complex
    comp = (data(4,:)+j*data(5,:))./(normData(4,:)+j*normData(5,:));
    re = real(comp);
    im = imag(comp);
    mag = sqrt(re.^2 + im.^2);
    logmag = 20*log10(mag); % log magnitude
    phase = atan2(im,re);
    
    subplot(3,1,1);
    hold on;
    plot(freq, logmag, 'LineWidth', 1.5);
    xlabel('Frequency [MHz]');
    ylabel('Normalized Log Magnitude');
    title('Normalized Log Magnitude |S11| comparison');
    legend(legend_L, 'Location', 'southwest');

    hold off;
    subplot(3,1,2);
    hold on;
    plot(freq, phase, 'LineWidth', 1.5);
    xlabel('Frequency [MHz]');
    ylabel('Normalized Phase [rads]');
    title('Normalized S11 Phase comparison');
    legend(legend_L, 'Location', 'southwest');
    hold off;

    subplot(3,1,3);
    hold on;
    for i = 1:length(freq)
        if freq(i) < 700
            comp(i) = 0;
        end
    end
    comp = [zeros(1,150), comp];
    TD = ifft(comp); % normalized time domain signals
    plot(abs(TD), 'LineWidth', 1.5);
    xlabel('Wrong units');
    ylabel('Normalized S11?');
    title('Normalized Inverse Fourier Transform');
    legend(legend_L, 'Location', 'northeast');
    hold off;
end




    

