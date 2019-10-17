function participantRawPath = participantRawPathFromName(participant)
% Construct path to session directory from participant name, session name

dataRawPath = getpref('MeLMSens_Pulse2','ProtocolDataRawPath');
participantRawPath = fullfile(dataRawPath,participant);
end