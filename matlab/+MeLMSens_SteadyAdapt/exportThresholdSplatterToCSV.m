function exportThresholdSplatterToCSV()
%EXPORTRESULTSTOCSV Exports all threshold splatter to CSV-file
%   Detailed explanation goes here

fprintf('Exporting SteadyAdapt threshold splatter...\n');

% Get results
results = MeLMSens_SteadyAdapt.dataManagement.functionForAll(@MeLMSens_SteadyAdapt.splatter.thresholdSessionFromName);

% Write to file
writetable(results,fullfile(getpref('MeLMSens','dataDir'),'experimental','adapt.thresholds.splatter.csv'));
end