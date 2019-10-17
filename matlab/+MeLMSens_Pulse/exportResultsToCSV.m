function exportResultsToCSV()
%EXPORTRESULTSTOCSV Exports all results to CSV-file
%   Detailed explanation goes here

fprintf('Exporting Pulse thresholds...\n');

% Get results
results = MeLMSens_Pulse.dataManagement.functionForAll(@MeLMSens_Pulse.analyze.sessionResultsFromName);

% Write to file
writetable(results,fullfile(getpref('MeLMSens','dataDir'),'experimental','pulse.results.csv'));
end