function exportFlickerSplatterToCSV()
%EXPORTRESULTSTOCSV Exports all flicker splatter to CSV-file
%   Detailed explanation goes here

fprintf('Exporting SteadyAdapt flicker splatter...\n');

% Get results
results = MeLMSens_SteadyAdapt.dataManagement.functionForAll(@MeLMSens_SteadyAdapt.splatter.flickerContrastsFromName);

% Write to file
writetable(results,fullfile(getpref('MeLMSens','dataDir'),'experimental','adapt.flicker.splatter.csv'));
end