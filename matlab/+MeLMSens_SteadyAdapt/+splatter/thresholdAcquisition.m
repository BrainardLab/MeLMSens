function T = thresholdAcquisition(acquisition, materials)

% Quick nominal contrast
contrastNominalQuick = mean(acquisition.thresholds);

% LMS background nominal
LMSBackgroundNominal = LMSBackgroundNominalFromAcquisition(acquisition);

% JND Nominal Quick
JNDNominalQuick = contrastNominalQuick * LMSBackgroundNominal;

% Quick validated contrast
contrastMeasuredQuick = MeLMSens_SteadyAdapt.splatter.thresholdContrastValidated(acquisition);

% LMS background measured
LMSBackgroundMeasured = median(LMSBackgroundMeasuredFromMaterials(acquisition, materials));

% Quick JND validated
JNDMeasuredQuick = contrastMeasuredQuick * LMSBackgroundMeasured;

% k
ratioContrastMeasuredNominal = contrastMeasuredQuick / contrastNominalQuick;

% Fit nominal contrast
contrastNominalFit = acquisition.fitPsychometricFunctionThreshold();

% JND nominal
JNDNominalFit = contrastNominalFit * LMSBackgroundNominal;

% L-M splatter
LMMeasured = MeLMSens_SteadyAdapt.splatter.thresholdLM(acquisition);

%% Write line
T = table(...
        contrastNominalQuick,...
        LMSBackgroundNominal,...
        JNDNominalQuick,...    
        contrastMeasuredQuick,...    
        LMSBackgroundMeasured,...    
        JNDMeasuredQuick,...    
        ratioContrastMeasuredNominal,...
        contrastNominalFit,...
        JNDNominalFit,...
        LMMeasured);
end

function LMSBackgroundMeasured = LMSBackgroundMeasuredFromMaterials(acquisition, materials)
    LMSBackgroundMeasured = [];
    name = char(acquisition.name);
    
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