%%
framerate = 200;

%% Adaptation waveform
adaptationDuration = seconds(5);
adaptationContrast = 1;
adaptationWaveform = ones(1,framerate*seconds(adaptationDuration));

%% Trial
[~, waveformMel] = MeLMSens_SteadyAdapt.schematic.waveforms(framerate);

%% Build acquisition
nTrials = 3;
trialsWaveform = repmat(waveformMel,[1 nTrials]);
acquisitionWaveform = [adaptationWaveform, trialsWaveform];

% Marker times
adaptationMarker = seconds(adaptationDuration)*framerate;
acquisitionMarker = length(acquisitionWaveform);
trialMarkers = (1:nTrials) * length(waveformMel);
trialMarkers = trialMarkers+adaptationMarker;

%% Build session
breakWaveform = NaN(1,200);
sessionWaveform = [acquisitionWaveform, breakWaveform, 3.5*acquisitionWaveform];
adaptationMarker = [adaptationMarker, length(acquisitionWaveform)+length(breakWaveform)+adaptationMarker];
trialMarkers = [trialMarkers, length(acquisitionWaveform)+length(breakWaveform)+trialMarkers];

%% Plot
F= figure(); clf; F.Position = [1000 500 1600 450];
plot(sessionWaveform); hold on;
line([adaptationMarker; adaptationMarker],[-1; 4],'Color','red','LineStyle','-');
line([acquisitionMarker; acquisitionMarker],[-1; 4],'Color','red','LineStyle','-');
line([trialMarkers; trialMarkers],[-1; 4],'Color','black','LineStyle',':');
ylim([0,4])
yticks([1 3.5])
yticklabels({'low','high'})
ylabel('Melanopic stimulation')
xlabel('Time');
xticks([]);

%% Annotate
fontSize = 15;

% Adaptation period
text(250,.75,sprintf('\\fontsize{%d} \\uparrow adaptation (5 min)',fontSize));
text(250+length(acquisitionWaveform)+length(breakWaveform),3.25,sprintf('\\fontsize{%d} \\uparrow adaptation (5 min)',fontSize));

% Trial numbers
trialNumbers = {'trial 1','   ...','trial 120'};
for i = 1:nTrials
    x = trialMarkers(i) - .65*length(waveformMel);
    y =.75;
    text(x,y,sprintf('\\fontsize{%d} %s',fontSize,trialNumbers{i}));
end
for i = 1:nTrials
    x = trialMarkers(nTrials+i) - .65*length(waveformMel);
    y =3.25;
    text(x,y,sprintf('\\fontsize{%d} %s',fontSize,trialNumbers{i}));
end

% Symbols
fontSize = 20;
symbols = {'-','\sim';'\sim','-';'-','\sim'};
for i = 1:nTrials
    x1 = trialMarkers(i) - .85*length(waveformMel);
    x2 = trialMarkers(i) - .35*length(waveformMel);
    y =1.25;
    text(x1,y,sprintf('\\fontsize{%d} \\bf %s',fontSize,symbols{i,1}));
    text(x2,y,sprintf('\\fontsize{%d} \\bf %s',fontSize,symbols{i,2}));
end
for i = 1:nTrials
    x1 = trialMarkers(nTrials+i) - .85*length(waveformMel);
    x2 = trialMarkers(nTrials+i) - .35*length(waveformMel);
    y =3.75;
    text(x1,y,sprintf('\\fontsize{%d} \\bf %s',fontSize,symbols{i,1}));
    text(x2,y,sprintf('\\fontsize{%d} \\bf %s',fontSize,symbols{i,2}));
end

% Axis break
text(length(acquisitionWaveform)+.5*length(breakWaveform),0,'\fontsize{15} \\\\')

%% Export
F.PaperOrientation = 'landscape';
F.PaperPositionMode = 'manual';
F.PaperUnits = 'points';
F.PaperSize = [1920 1080];
%saveas(F,'pulse.session.schematic.pdf');
print(fullfile(getpref('MeLMSens','dataDir'),'..','figs','adapt.session.schematic.pdf'),'-dpdf','-bestfit');