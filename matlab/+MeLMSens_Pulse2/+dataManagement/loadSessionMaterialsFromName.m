function materials = loadSessionMaterialsFromName(participant,sessionName)
%LOADSESSIONFROMNAME Summary of this function goes here
%   Detailed explanation goes here
sessionPath = MeLMSens_Pulse2.dataManagement.sessionRawPathFromName(participant, sessionName);
materialsFilename = MeLMSens_Pulse2.dataManagement.sessionMaterialFileFromName(participant,sessionName);
materialsFile = dir(fullfile(sessionPath,materialsFilename));
materials = load(fullfile(materialsFile.folder, materialsFile.name));
end