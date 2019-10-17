function backgroundContrastsTable = backgroundContrastsFromMaterials(materials)
backgroundContrastsTable = table();

if isfield(materials,'validationsPre')
    % Extract validations
    validationsPre = materials.validationsPre;
    
    % Get contrasts
    T = backgroundContrastsFromValidations(validationsPre);
    T = addvarString(T,'PreCorrection','VariableName',"label");
    
    % Add to table
    backgroundContrastsTable = [backgroundContrastsTable; T];
end

if isfield(materials,'validationsPostCorrection')
    % Extract validations
    validationsPostCorrection = materials.validationsPostCorrection;
    
    % Get contrasts
    T = backgroundContrastsFromValidations(validationsPostCorrection);
    T = addvarString(T,'PostCorrection','VariableName',"label");
    
    % Add to table
    backgroundContrastsTable = [backgroundContrastsTable; T];    
end

if isfield(materials,'validationsPostSession')
    % Extract validations
    validationsPostSession = materials.validationsPostSession;
    
    % Get contrasts
    T = backgroundContrastsFromValidations(validationsPostSession);
    T = addvarString(T,'PostSession','VariableName',"label");
    
    % Add to table
    backgroundContrastsTable = [backgroundContrastsTable; T];    
end
end

function backgroundContrastsTable = backgroundContrastsFromValidations(validations)
    backgroundContrastsTable = table();

    % Extract backgrounds
    Mel_high = validations('Mel_high');
    Mel_low = validations('Mel_low');
    
    % Calculate contrast for paired measurements
    for v = 1:length(Mel_high)
        excitations_high = Mel_high(v).excitationActual(:,2);
        excitations_low = Mel_low(v).excitationActual(:,2);
        contrasts = ReceptorExcitationToReceptorContrast([excitations_high excitations_low]);
        contrasts = contrasts(:,2);
    
        % Write line
        T = table();
        T.axis = "Mel-directed backgrounds";
        T.L = contrasts(1);
        T.M = contrasts(2);
        T.S = contrasts(3);
        T.Mel = contrasts(4);
    
        % Add to table
        backgroundContrastsTable = [backgroundContrastsTable; T];    
    end
end