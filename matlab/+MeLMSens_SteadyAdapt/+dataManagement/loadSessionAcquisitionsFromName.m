function acquisitions = loadSessionAcquisitionsFromName(participant, sessionName)
% Get session path
sessionPath = MeLMSens_SteadyAdapt.dataManagement.sessionRawPathFromName(participant, sessionName);

% Get acquisitions
acquisitions = MeLMSens_SteadyAdapt.dataManagement.loadSessionAcquisitions(sessionPath);
end