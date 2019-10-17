function backgroundLMS = backgroundLMSFromAcquisition(acquisition)
% Return background (L+M+S)/3 from acquisition
background = acquisition.background;
receptors  = acquisition.receptors;

excitations = background.ToReceptorExcitation(receptors);

backgroundLMS = mean(excitations(1:3));
end