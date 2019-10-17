function results = resultsFromAcquisition(acquisition)
% Extract table(row) of results from an acquisition
%
% Syntax:
%   results = extractResultsFromAcquisition(acquistion)
%
% Description:
%    From a completed Acquisition_FlickerSensitivity_2IFC, extract the
%    nominal LMS threshold contrast and LMS Just-Noticable-Difference
%    (JND).
%
%    Nominal contrast is the scalar value based on the staircase(s). The
%    nominal JND is the mean predicted excitation difference on the L, M
%    and S cone photoreceptors, based on the nominal background SPD and a
%    direction scaled to the nominal contrast value.
%
% Inputs:
%    acquisition - scalar Acquisition_FlickerSensitivity_2IFC object,
%                  completed.
%
% Outputs:
%    results     - table(), with variables 'axis', 'level',
%                  'threshold_contrast', 'LMS_background', 'threshold_JND'
%
% Optional keyword arguments:
%    None.
%
% See also:
%    Acquisition_FlickerSensitivity_2IFC

results = table();
name = split(acquisition.name,'_');
results.axis = "Mel";
switch name
    case "NoPedestal"
        results.level = "low";
    case "Pedestal"
        results.level = "high";
end
results.threshold_JND = MeLMSens_Pulse2.analyze.thresholdDeltaRGB(acquisition);

end