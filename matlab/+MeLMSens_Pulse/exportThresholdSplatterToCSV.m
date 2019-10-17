function exportThresholdSplatterToCSV()
%EXPORTRESULTSTOCSV Exports all threshold splatter to CSV-file
%   Detailed explanation goes here

fprintf('Exporting Pulse threshold splatter...\n');

% Get results
results = MeLMSens_Pulse.dataManagement.functionForAll(@MeLMSens_Pulse.splatter.thresholdSessionFromName);

% Write to file
writetable(results,fullfile(getpref('MeLMSens','dataDir'),'experimental','pulse.thresholds.splatter.csv'));
end