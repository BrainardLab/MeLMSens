function T = thresholdSession(acquisition,materials)
%% Low
mel_low = acquisition('Mel_low');
U = MeLMSens_SteadyAdapt.splatter.thresholdAcquisition(mel_low,materials);
U.axis = "Melanopsin";
U.level = "low";

%% high
mel_high = acquisition('Mel_high');
V = MeLMSens_SteadyAdapt.splatter.thresholdAcquisition(mel_high,materials);
V.axis = "Melanopsin";
V.level = "high";

%%
T = [U;V];
end