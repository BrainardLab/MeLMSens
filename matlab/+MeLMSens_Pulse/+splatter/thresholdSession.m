function T = thresholdSession(acquisition,materials)
%% Low
mel_low = acquisition('NoPedestal');
U = MeLMSens_Pulse.splatter.thresholdAcquisition(mel_low,materials);
U.axis = "Melanopsin";
U.level = "low";

%% high
mel_high = acquisition('Pedestal');
V = MeLMSens_Pulse.splatter.thresholdAcquisition(mel_high,materials);
V.axis = "Melanopsin";
V.level = "high";

%%
T = [U;V];
end