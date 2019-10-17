function exportResultsToCSV()
%EXPORTRESULTSTOCSV Exports all results to CSV-file
%   Detailed explanation goes here

% Get results
results = MeLMSens_SteadyAdapt.dataManagement.functionForAll(@MeLMSens_SteadyAdapt.analyze.sessionResultsFromName);

% Write to file
writetable(results,fullfile(getpref('MeLMSens','dataDir'),'results.csv'));
end