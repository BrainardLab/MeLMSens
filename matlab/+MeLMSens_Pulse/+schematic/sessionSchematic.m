%%
framerate = 200;

%% Adaptation waveform
adaptationDuration = seconds(5);
adaptationContrast = 0;
adaptationWaveform = 0 * ones(1,framerate*seconds(adaptationDuration));

%% Trial
[~, waveformMel] = MeLMSens_Pulse.schematic.waveforms(framerate);

%% Trial contrast sequence
nTrials = 6;
melContrast = 3.5;
trialSequence = [1 1 0 1 0 0];

%% Convolve
waveform = [];
for i = 1:length(trialSequence)
    waveform = [waveform waveformMel*3.5*trialSequence(i)];
end

%% Marker times
adaptationMarker = seconds(adaptationDuration)*framerate;
trialMarkers = (1:length(trialSequence)) * length(waveformMel) + adaptationMarker;

%% Cat
waveform = [adaptationWaveform, waveform];

%% Plot
F= figure(); clf; F.Position = [1000 500 1600 450];
plot(waveform); hold on;
line([adaptationMarker; adaptationMarker],[-1; 4],'Color','red','LineStyle','-');
line([trialMarkers; trialMarkers],[-1; 4],'Color','black','LineStyle',':');
ylim([-1,4])
yticks([0 3.5])
yticklabels({'low','high'})
ylabel('Melanopic stimulation')
xlabel('Time');
xticks([]);

%% Annotate
fontSize = 15;

% Adaptation period
text(250,-.25,sprintf('\\fontsize{%d} \\uparrow adaptation (5 min)',fontSize));

% Trial numbers
trialNumbers = {'trial 1','   ...','   ...','   ...','   ...','trial 240'};
for i = 1:nTrials
    x = trialMarkers(i) - .65*length(waveformMel);
    y =-.25;
    text(x,y,sprintf('\\fontsize{%d} %s',fontSize,trialNumbers{i}));
end

% Symbols
fontSize = 20;
symbols = {'-','\sim';'\sim','-';'-','\sim';'-','\sim';'\sim','-';'-','\sim';'\sim','-'};
for i = 1:nTrials
    x1 = trialMarkers(i) - .85*length(waveformMel);
    x2 = trialMarkers(i) - .45*length(waveformMel);
    y =0.25+trialSequence(i)*3.5;
    text(x1,y,sprintf('\\fontsize{%d} \\bf %s',fontSize,symbols{i,1}));
    text(x2,y,sprintf('\\fontsize{%d} \\bf %s',fontSize,symbols{i,2}));
end

%% Export
F.PaperOrientation = 'landscape';
F.PaperPositionMode = 'manual';
F.PaperUnits = 'points';
F.PaperSize = [1920 1080];
%saveas(F,'pulse.session.schematic.pdf');
print(fullfile(getpref('MeLMSens','dataDir'),'..','figs','pulse.session.schematic.pdf'),'-dpdf','-bestfit');