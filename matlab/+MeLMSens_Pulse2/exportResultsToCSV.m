function exportResultsToCSV()
%EXPORTRESULTSTOCSV Exports all results to CSV-file
%   Detailed explanation goes here

fprintf('Exporting Pulse2 thresholds...\n');

% Get results
results = MeLMSens_Pulse2.dataManagement.functionForAll(@MeLMSens_Pulse2.analyze.sessionResultsFromName);

% Write to file
writetable(results,fullfile(getpref('MeLMSens','dataDir'),'experimental','pulse2.results.csv'));
end