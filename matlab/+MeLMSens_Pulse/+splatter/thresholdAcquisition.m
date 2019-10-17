function T = thresholdAcquisition(acquisition, materials)
% Fit nominal contrast
contrastNominal = acquisition.fitPsychometricFunctionThreshold();

% LMS background nominal
LMSBackgroundNominal = LMSBackgroundNominalFromAcquisition(acquisition);

% JND Nominal Quick
JNDNominal = contrastNominal * LMSBackgroundNominal;

% Quick validated contrast
contrastMeasured = MeLMSens_Pulse.splatter.thresholdContrastValidated(acquisition);

% LMS background measured
LMSBackgroundMeasured = median(LMSBackgroundMeasuredFromMaterials(acquisition, materials));

% Quick JND validated
JNDMeasuredQuick = contrastMeasured * LMSBackgroundMeasured;

% k
ratioContrastMeasuredNominal = contrastMeasured / contrastNominal;

% JND nominal
JNDNominalFit = contrastNominal * LMSBackgroundNominal;

% L-M splatter
LMMeasured = MeLMSens_Pulse.splatter.thresholdLM(acquisition);

%% Write line
T = table(...
        contrastNominal,...
        LMSBackgroundNominal,...
        JNDNominal,...    
        contrastMeasured,...    
        LMSBackgroundMeasured,...    
        JNDMeasuredQuick,...    
        ratioContrastMeasuredNominal,...
        contrastNominal,...
        JNDNominalFit,...
        LMMeasured);
end

function LMSBackgroundMeasured = LMSBackgroundMeasuredFromMaterials(acquisition, materials)
    LMSBackgroundMeasured = [];
    switch acquisition.name
        case "NoPedestal"
            name = 'Mel_low';
        case "Pedestal"
            name = 'Mel_high';
    end
    
    %% PostCorrection
    if isfield(materials,'validationsPostCorrection')
        % Extract validations
        validationsPostCorrection = materials.validationsPostCorrection;
        validations = validationsPostCorrection(name);
        
        % Get LMS
        excitations = cat(3,validations.excitationActual);
        excitations = excitations(:,2,:);
        excitations = squeeze(excitations);
        LMS_pre = (excitations(1,:)+excitations(2,:)+excitations(3,:))/3;
        
        % Accumulate
        LMSBackgroundMeasured = [LMSBackgroundMeasured,LMS_pre];
    end

    %% PostSession
    if isfield(materials,'validationsPostSession')
        % Extract validations
        validationsPostSession = materials.validationsPostSession;
        validations = validationsPostCorrection(name);
        
        % Get LMS
        excitations = cat(3,validations.excitationActual);
        excitations = excitations(:,2,:);
        excitations = squeeze(excitations);
        LMS_post = (excitations(1,:)+excitations(2,:)+excitations(3,:))/3;
        
        % Accumulate
        LMSBackgroundMeasured = [LMSBackgroundMeasured,LMS_post];

    end
end
function LMSBackgroundNominal = LMSBackgroundNominalFromAcquisition(acquisition)
    background = acquisition.background;
    receptors = acquisition.receptors;

    % Get LMS
    excitations = background.ToReceptorExcitation(receptors);
    LMSBackgroundNominal = median((excitations(1,:)+excitations(2,:)+excitations(3,:))/3);
end