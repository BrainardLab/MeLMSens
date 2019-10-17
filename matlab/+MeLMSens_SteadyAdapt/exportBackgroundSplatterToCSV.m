function exportBackgroundSplatterToCSV()
%EXPORTRESULTSTOCSV Exports all threshold splatter to CSV-file
%   Detailed explanation goes here

fprintf('Exporting SteadyAdapt background splatter...\n');

% Get results
results = MeLMSens_SteadyAdapt.dataManagement.functionForAll(@MeLMSens_SteadyAdapt.splatter.backgroundContrastsFromName);

% Write to file
writetable(results,fullfile(getpref('MeLMSens','dataDir'),'experimental','adapt.backgrounds.splatter.csv'));
end