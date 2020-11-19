melContrast = 0;
framerate = 200;
[waveformTimebase, waveformMel, waveformLMS, markerTimes] = MeLMSens_Pulse.schematic.waveforms(framerate);

%% plot
F = figure(1); clf; F.Position = [1000 500 800 800];
ax = gca; cla;  hold on;
plot3(ax,0.2*waveformLMS,waveformTimebase,melContrast*waveformMel+1,'color','red','LineWidth',1.5);
xlabel('LMS contrast');
zlabel('Melanopic level');
ylabel('Time (s)');
ax.YDir = 'reverse';
ax.XLim = [-.3 .3];
ax.YLim = [0 3.25];
ax.ZLim = [1 4.5];
view(315,35);
grid on;
for i = markerTimes
    line(ax,[-.05 .05],[i i],melContrast*[1 1]+1,'Color','black','linestyle','--','LineWidth',1.5);
end

%% Export
F.PaperOrientation = 'landscape';
F.PaperPositionMode = 'manual';
F.PaperUnits = 'points';
F.PaperSize = [1920 1080];
%saveas(F,'pulse.session.schematic.pdf');
print(fullfile(getpref('MeLMSens','dataDir'),'..','figs','low.pulse.trial.schematic.pdf'),'-dpdf','-bestfit');

%%
melContrast = 3.5;
framerate = 200;
[waveformTimebase, waveformMel, waveformLMS, markerTimes] = MeLMSens_Pulse.schematic.waveforms(framerate);

%% plot
F = figure(1); clf; F.Position = [1000 500 800 800];
ax = gca; cla;  hold on;
plot3(ax,0.2*waveformLMS,waveformTimebase,melContrast*waveformMel+1,'color','red','LineWidth',1.5);
xlabel('LMS contrast');
zlabel('Melanopic level');
ylabel('Time (s)');
ax.YDir = 'reverse';
ax.XLim = [-.3 .3];
ax.YLim = [0 3.25];
ax.ZLim = [1 4.5];
view(315,35);
grid on;
for i = markerTimes
    line(ax,[-.05 .05],[i i],melContrast*[1 1]+1,'Color','black','linestyle','--','LineWidth',1.5);
end

%% Export
F.PaperOrientation = 'landscape';
F.PaperPositionMode = 'manual';
F.PaperUnits = 'points';
F.PaperSize = [1920 1080];
%saveas(F,'pulse.session.schematic.pdf');
print(fullfile(getpref('MeLMSens','dataDir'),'..','figs','high.pulse.trial.schematic.pdf'),'-dpdf','-bestfit');