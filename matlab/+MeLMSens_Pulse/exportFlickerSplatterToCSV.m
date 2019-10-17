function exportFlickerSplatterToCSV()
%EXPORTRESULTSTOCSV Exports all flicker splatter to CSV-file
%   Detailed explanation goes here

% Get results
results = MeLMSens_Pulse.dataManagement.functionForAll(@MeLMSens_Pulse.splatter.flickerContrastsFromName);

% Write to file
writetable(results,fullfile(getpref('MeLMSens','dataDir'),'experimental','pulse.flicker.splatter.csv'));
end