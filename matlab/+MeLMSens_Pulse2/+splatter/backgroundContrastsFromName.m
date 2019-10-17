function backgroundContrastsTable = backgroundContrastsFromName(participant,sessionName)
%   
% Syntax:
%   resultsTable = backgroundContrastsFromName(participant,sessionName)
%
% Description:
%   
% Inputs:
%    participant  - scalar string / char-array specified participant
%    sessionName  - scalar string / char-array specifying session. Will be
%                   partially matched.
%
% Outputs:

materials = MeLMSens_Pulse2.dataManagement.loadSessionMaterialsFromName(participant, sessionName);
backgroundContrastsTable = MeLMSens_Pulse2.splatter.backgroundContrastsFromMaterials(materials);

% Prepend participant, session identified
backgroundContrastsTable = addvarString(backgroundContrastsTable,[string(participant) string(sessionName)],...
                        'VariableNames',{'participant','session'}); % add participant,session identifier
backgroundContrastsTable = backgroundContrastsTable(:,[end-1:end, 1:end-2]); % move to front
end