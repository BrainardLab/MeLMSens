function [waveformTimebase, waveformMel, waveformLMS, markerTimes] = waveforms(framerate)
%% Params
ISI = seconds(.5);

flickerDuration = seconds(.5);
flickerFrequency = 5; % Hz

%% Waveforms
% reference: constant at 1
referenceWaveform = constant(seconds(flickerDuration),framerate);

% flicker: sinusoid
flickerWaveform = sinewave(flickerDuration,framerate,flickerFrequency);
flickerWaveform(1) = 0;
flickerWaveform(end) = 0;

% IS: constant at 1
ISWaveform = constant(ISI,framerate);

%% 
waveformMel = [referenceWaveform, ISWaveform, referenceWaveform, ISWaveform];
waveformLMS = [0*referenceWaveform, 0*ISWaveform, flickerWaveform, 0*ISWaveform];
waveformTimebase = (1:length(waveformMel))*1/framerate;

%%
markerTimesIdx = [1,0*referenceWaveform,1,0*ISWaveform,1,0*referenceWaveform,1];
markerTimesIdx = find(markerTimesIdx)-[0 1 2 3];
markerTimes = markerTimesIdx * (1/framerate);

end