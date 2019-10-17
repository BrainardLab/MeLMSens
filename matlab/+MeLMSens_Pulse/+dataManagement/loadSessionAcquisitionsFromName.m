function acquisitions = loadSessionAcquisitionsFromName(participant, sessionName)
% Get session path
sessionPath = MeLMSens_Pulse.dataManagement.sessionRawPathFromName(participant, sessionName);

% Get acquisitions
acquisitions = MeLMSens_Pulse.dataManagement.loadSessionAcquisitions(sessionPath);
end