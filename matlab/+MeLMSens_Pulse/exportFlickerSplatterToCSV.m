function exportFlickerSplatterToCSV()
%EXPORTRESULTSTOCSV Exports all flicker splatter to CSV-file
%   Detailed explanation goes here

fprintf('Exporting Pulse2 flicker splatter...\n');

% Get results
results = MeLMSens_Pulse.dataManagement.functionForAll(@MeLMSens_Pulse.splatter.flickerContrastsFromName);

% Write to file
writetable(results,fullfile(getpref('MeLMSens','dataDir'),'experimental','pulse.flicker.splatter.csv'));
end