function [waveformTimebase, waveformMel, waveformLMS, markerTimes] = waveforms(framerate)
%% Params
ISI = seconds(.5);
rampDuration = seconds(0.5);
preRampDuration = seconds(.25);
postRampDuration = seconds(0);

flickerDuration = seconds(.5);
flickerFrequency = 5; % Hz

%% Waveforms
% pre: cosine-window 0 -> 1
cosineWaveform = cosineRamp(rampDuration,framerate);
rampOnWaveform = [cosineWaveform, constant(postRampDuration,framerate)];

% reference: constant at 1
referenceWaveform = constant(seconds(flickerDuration),framerate);

% flicker: sinusoid
flickerWaveform = sinewave(flickerDuration,framerate,flickerFrequency);
flickerWaveform(1) = 0;
flickerWaveform(end) = 0;

% post: cosine-window 1 -> 0
rampOffWaveform = [constant(preRampDuration,framerate), fliplr(cosineWaveform)];

% IS: constant at 1
ISWaveform = constant(ISI,framerate);

%% 
waveformMel = [rampOnWaveform, referenceWaveform, ISWaveform, referenceWaveform, rampOffWaveform, 0*ISWaveform];
waveformLMS = [0*rampOnWaveform, 0*referenceWaveform, 0*ISWaveform, flickerWaveform, 0*rampOffWaveform, 0*ISWaveform];
waveformTimebase = (1:length(waveformMel))*1/framerate;

%%
markerTimesIdx = [0*rampOnWaveform,1,0*referenceWaveform,1,0*ISWaveform,1,0*referenceWaveform,1,0*rampOffWaveform];
markerTimesIdx = find(markerTimesIdx)-[0 1 2 3];
markerTimes = markerTimesIdx * (1/framerate);

end