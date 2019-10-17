function materials = loadSessionMaterialsFromName(participant,sessionName)
%LOADSESSIONFROMNAME Summary of this function goes here
%   Detailed explanation goes here
sessionPath = MeLMSens_Pulse.dataManagement.sessionRawPathFromName(participant, sessionName);
materialsFilename = MeLMSens_Pulse.dataManagement.sessionMaterialFileFromName(participant,sessionName);
materialsFile = dir(fullfile(sessionPath,materialsFilename));
materials = load(fullfile(materialsFile.folder, materialsFile.name));
end