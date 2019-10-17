function resultsTable = thresholdSessionFromName(participant, sessionName)
% Extract results from session specified by name
%   
% Syntax:
%   resultsTable = sessionResultsFromName(participant, sessionName)
%
% Description:
%    From a session specified by participant and session name, extract the
%    nominal and validated LMS threshold contrast.
%   
% Inputs:
%    participant - scalar string, participant name
%    sessionName - scalar string, session name
%
% Outputs:
%    results     - table(), with variables 'axis', 'level', 
%                  'threshold_contrast', 'LMS_background', 'threshold_JND'

% Load session acquisitions from participant, session
sessionPath = MeLMSens_SteadyAdapt.dataManagement.sessionRawPathFromName(participant,sessionName);
acquisitions = MeLMSens_SteadyAdapt.dataManagement.loadSessionAcquisitions(sessionPath);
materials = MeLMSens_SteadyAdapt.dataManagement.loadSessionMaterialsFromName(participant,sessionName);

% Get results
resultsTable = MeLMSens_SteadyAdapt.splatter.thresholdSession(acquisitions,materials);

% Prepend participant, session identified
resultsTable = addvarString(resultsTable,[string(participant) string(sessionName)],...
                        'VariableNames',{'participant','session'}); % add participant,session identifier
resultsTable = resultsTable(:,[end-1:end, 1:end-2]); % move to front
end