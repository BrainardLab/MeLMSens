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
results.axis = name(1);
results.level = name(2);
results.threshold_contrast = MeLMSens_SteadyAdapt.analyze.thresholdContrastFromAcquisition(acquisition);
results.LMS_background = MeLMSens_SteadyAdapt.analyze.backgroundLMSFromAcquisition(acquisition);
results.threshold_JND = results.threshold_contrast * results.LMS_background;
end