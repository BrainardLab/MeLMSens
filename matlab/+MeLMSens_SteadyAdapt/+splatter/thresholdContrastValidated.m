function thresholdContrastValidated = thresholdContrastValidated(acquisition)
% Extract validated LMS threshold contrast from acquisition
%   
% Syntax:
%   thresholdContrastValidated = thresholdContrastValidated(acquisition)
%
% Description:
%    Return single LMS contrast value, based on validation measurements
%    taken of nominally threshold stimulus.
%   
% Inputs:
%    acquisition                - scalar MeLMSense acquisition
%
% Outputs:
%    thresholdContrastValidated - scalar numberic LMS contrast based on
%                                 validation at threshold

% Check for validations
if ~isempty(acquisition.validationAtThreshold) && ...
        isfield(acquisition.validationAtThreshold,'contrastActual')
    
    % Extract validated contrast at threshold
    validations = acquisition.validationAtThreshold;
    contrastActual = cat(3,validations.contrastActual);
    
    % Convert to LMS
    thresholdContrastValidated = MeLMSens_SteadyAdapt.splatter.LMSContrastFromBipolarReceptorContrasts(contrastActual);
else
    thresholdContrastValidated = NaN;
end
end