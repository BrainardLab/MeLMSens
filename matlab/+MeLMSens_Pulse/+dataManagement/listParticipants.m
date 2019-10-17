function participants = listParticipants
%LISTPARTICIPANTS return cell-array of participant IDs for protocol
dataRawPath = getpref('MeLMSens_Pulse','ProtocolDataRawPath');
FSEntries = dir(dataRawPath);
directories = FSEntries([FSEntries.isdir]);
directories = directories(~strcmp({directories.name},{'..'}) & ~strcmp({directories.name},{'.'}));
participants = {directories.name};
end