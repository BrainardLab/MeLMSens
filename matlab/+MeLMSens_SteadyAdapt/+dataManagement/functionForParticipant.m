function output = functionForParticipant(fcn,participant)
%FUNCTIONFORALL Execute given function for all sessions by participant

% Reformat fcn
str = func2str(fcn);
fcn = str2func(sprintf('@(p,s) %s(p,s)',str));

% Get session names
sessionNames = MeLMSens_SteadyAdapt.dataManagement.listSessions(participant);

% Execute
for sessionName = sessionNames
    sessionName = sessionName{:};
    
    % Execute
    if ~exist('output','var')
        output = fcn(participant, sessionName);
    else
        tmp = fcn(participant, sessionName);
        output = vertcat(output,tmp);
    end
end
end