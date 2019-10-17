function acquisitions = loadSessionAcquisitionsFromName(participant, sessionName)
% Get session path
sessionPath = MeLMSens_Pulse2.dataManagement.sessionRawPathFromName(participant, sessionName);

% Get acquisitions
acquisitions = MeLMSens_Pulse2.dataManagement.loadSessionAcquisitions(sessionPath);
end