function exportBackgroundSplatterToCSV()
%EXPORTRESULTSTOCSV Exports all threshold splatter to CSV-file
%   Detailed explanation goes here

fprintf('Exporting Pulse2 background splatter...\n');

% Get results
results = MeLMSens_Pulse2.dataManagement.functionForAll(@MeLMSens_Pulse2.splatter.backgroundContrastsFromName);

% Write to file
writetable(results,fullfile(getpref('MeLMSens','dataDir'),'experimental','pulse2.backgrounds.splatter.csv'));
end