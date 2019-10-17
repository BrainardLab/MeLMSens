function [acquisitions, metadata] = loadSessionAcquisitions(sessionPath)
% Loads acquisitions, metadata, from specified session

acquisitions = containers.Map();
metadata = containers.Map();

% Dummy staircase for proper constructor initialization
S = Staircase('standard',.05,[1],[1],[1]);

% Load acquisitions
acquisitionNames = ["NoPedestal","Pedestal"];
for a = acquisitionNames
    metadatum = struct();
    metadatum.name = a;
    metadatum.datafileName = "data-*-" + a + ".mat";
    metadatum.datafile = dir(fullfile(sessionPath,metadatum.datafileName));
    tmp = load(fullfile(metadatum.datafile.folder,metadatum.datafile.name));
    metadatum.acquisition = tmp.acquisition;
    metadata(char(a)) = metadatum;
    acquisitions(char(a)) = metadatum.acquisition;
end

end