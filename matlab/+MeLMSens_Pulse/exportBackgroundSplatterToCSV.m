function exportBackgroundSplatterToCSV()
%EXPORTRESULTSTOCSV Exports all threshold splatter to CSV-file
%   Detailed explanation goes here

fprintf('Exporting Pulse background splatter...\n');

% Get results
results = MeLMSens_Pulse.dataManagement.functionForAll(@MeLMSens_Pulse.splatter.backgroundContrastsFromName);

% Write to file
writetable(results,fullfile(getpref('MeLMSens','dataDir'),'experimental','pulse.backgrounds.splatter.csv'));
end