function exportFlickerSplatterToCSV()
%EXPORTRESULTSTOCSV Exports all flicker splatter to CSV-file
%   Detailed explanation goes here

% Get results
results = MeLMSens_Pulse2.dataManagement.functionForAll(@MeLMSens_Pulse2.splatter.flickerContrastsFromName);

% Write to file
writetable(results,fullfile(getpref('MeLMSens','dataDir'),'experimental','pulse2.flicker.splatter.csv'));
end