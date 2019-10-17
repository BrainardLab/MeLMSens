function nominalThresholdContrast = thresholdContrastFromAcquisition(acquisition)
% Extract nominal threshold contrast from acquisition
% Returns the contrast determined from a psychometric function fit

nominalThresholdContrast = acquisition.fitPsychometricFunctionThreshold();
end