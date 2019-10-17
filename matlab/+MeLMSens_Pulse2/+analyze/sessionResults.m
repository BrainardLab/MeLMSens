function results = sessionResults(acquisitions)
% Extract results from all acquisitions in a session
%   
% Syntax:
%   resultsTable = sessionResults(acquisitions)
%
% Description:
%    From a set of completed MeLMSens_SteadyAdapt acquisitions, extract the
%    nominal and validated LMS threshold contrast.
%   
% Inputs:
%    acquisitions - containers.Map with MeLMSens_SteadyAdapt acquisition(s)
%
% Outputs:
%    results      - table(), with variables 'axis', 'level',
%                   'threshold_contrast', 'LMS_background', 'threshold_JND'

% Initialize
results = table();

% Loop over acquisitions
for acquisition = acquisitions.values
    T = MeLMSens_Pulse2.analyze.resultsFromAcquisition(acquisition{:});
    results = vertcat(results,T);
end
end