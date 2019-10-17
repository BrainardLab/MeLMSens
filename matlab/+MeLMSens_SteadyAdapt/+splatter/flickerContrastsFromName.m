function backgroundContrastsTable = flickerContrastsFromName(participant,sessionName)
%   
% Syntax:
%   resultsTable = flickerContrastsFromName(participant,sessionName)
%
% Description:
%   
% Inputs:
%    participant  - scalar string / char-array specified participant
%    sessionName  - scalar string / char-array specifying session. Will be
%                   partially matched.
%
% Outputs:

materials = MeLMSens_SteadyAdapt.dataManagement.loadSessionMaterialsFromName(participant, sessionName);
backgroundContrastsTable = MeLMSens_SteadyAdapt.splatter.flickerContrastsFromMaterials(materials);

% Prepend participant, session identified
backgroundContrastsTable = addvarString(backgroundContrastsTable,[string(participant) string(sessionName)],...
                        'VariableNames',{'participant','session'}); % add participant,session identifier
backgroundContrastsTable = backgroundContrastsTable(:,[end-1:end, 1:end-2]); % move to front
end