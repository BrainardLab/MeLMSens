function materialFilename = sessionMaterialFileFromName(participant,sessionName)
%SESSIONMATERIALFILEFROMNAME Summary of this function goes here
%   Detailed explanation goes here
if length(sessionName) > 10
    sessionName = sessionName(10:end);
end
materialFilename = sprintf('materials-%s-%s.mat',participant,sessionName);
end