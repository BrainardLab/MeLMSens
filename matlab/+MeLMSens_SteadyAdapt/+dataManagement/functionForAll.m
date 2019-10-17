function output = functionForAll(fcn)
%FUNCTIONFORALL Execute given function for all sessions by all participants

% Reformat fcn
str = func2str(fcn);
fcn = str2func(sprintf('@(p,s) %s(p,s)',str));

% Get participant names
participants = MeLMSens_SteadyAdapt.dataManagement.listParticipants();

for participant = participants
    participant = participant{:};
    
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
end