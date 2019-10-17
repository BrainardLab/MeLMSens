function output = functionForAll(fcn)
%FUNCTIONFORALL Execute given function for all sessions by all participants

% Reformat fcn
str = func2str(fcn);
fcn = str2func(sprintf('@(p,s) %s(p,s)',str));

% Get participant names
participants = MeLMSens_Pulse.dataManagement.listParticipants();

for participant = participants
    participant = participant{:};

    fprintf('Processing participant %s...\n',participant);
    
    % Get session names
    sessionNames = MeLMSens_Pulse.dataManagement.listSessions(participant);

    % Execute
    for sessionName = sessionNames
        sessionName = sessionName{:};

        fprintf('\tsession %s...',sessionName);
        % Execute
        if ~exist('output','var')
            output = fcn(participant, sessionName);
        else
            tmp = fcn(participant, sessionName);
            output = vertcat(output,tmp);
        end
        
        fprintf('done.\n');
    end
end
end