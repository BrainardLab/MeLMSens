function sessions = listSessions(participant)
%LISTSESSIONS session IDs for given participant
dataRawPath = getpref('MeLMSens_SteadyAdapt','ProtocolDataRawPath');
FSEntries = dir(fullfile(dataRawPath,participant,'*session*'));
directories = FSEntries([FSEntries.isdir]);
directories = directories(~strcmp({directories.name},{'..'}) & ~strcmp({directories.name},{'.'}));
sessions = {directories.name};
end