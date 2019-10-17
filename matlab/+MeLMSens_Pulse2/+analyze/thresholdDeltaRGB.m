function deltaRGB = thresholdDeltaRGB(acquisition)
% Extract nominal threshold deltaRGB from acquisition
% Returns the contrast determined from a psychometric function fit

deltaRGB = acquisition.fitPsychometricFunctionThreshold();
end