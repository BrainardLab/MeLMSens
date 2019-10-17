function MeLMSensLocalHook
%% Sets preferences for directories

%% Toplevel raw data directory: where all data lives
% By default, for the Aguirre-Brainard Lab, find user from OS, and look for
% '/Users/$USER/Dropbox (Aguirre-Brainard Lab)'.
% Override rawDataDir for any other data directory.

% Get Dropbox dir
[~, userID] = system('whoami');
userID = strtrim(userID);
dir_dropbox = fullfile('/','Users',userID,'Dropbox (Aguirre-Brainard Lab)'); 

% Set raw data dir
rawDataDir = fullfile(dir_dropbox,'MELA_data','Experiments','OLApproach_Psychophysics');

%% Define protocol names
protocolNames = {'MeLMSens_SteadyAdapt','MeLMSens_Pulse','MeLMSens_Pulse2'};

%% Protocol raw data dirs
for protocol = protocolNames
    protocol = protocol{:};
    protocolRawDataDir = fullfile(rawDataDir,protocol);
    setpref(protocol,'ProtocolDataRawPath',protocolRawDataDir);
end

%% Output data dir
projectDir = tbLocateProject('MeLMSens');
dataDir = fullfile(projectDir, 'data');
setpref('MeLMSens','dataDir',dataDir);
if ~exist(fullfile(dataDir,'experimental'),'dir')
    mkdir(fullfile(dataDir,'experimental'));
end
if ~exist(fullfile(projectDir,'figs'),'dir')
    mkdir(fullfile(projectDir,'figs'));
end