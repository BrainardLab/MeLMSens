function flickerContrastsTable = flickerContrastsFromMaterials(materials)
flickerContrastsTable = table();

if isfield(materials,'validationsPre')
    % Extract validations
    validationsPre = materials.validationsPre;
    
    % Get contrasts
    T = flickerContrastsFromValidations(validationsPre);
    T = addvarString(T,'PreCorrection','VariableName',"label");
    
    % Add to table
    flickerContrastsTable = [flickerContrastsTable; T];
end

if isfield(materials,'validationsPostCorrection')
    % Extract validations
    validationsPostCorrection = materials.validationsPostCorrection;
    
    % Get contrasts
    T = flickerContrastsFromValidations(validationsPostCorrection);
    T = addvarString(T,'PostCorrection','VariableName',"label");
    
    % Add to table
    flickerContrastsTable = [flickerContrastsTable; T];    
end

if isfield(materials,'validationsPostSession')
    % Extract validations
    validationsPostSession = materials.validationsPostSession;
    
    % Get contrasts
    T = flickerContrastsFromValidations(validationsPostSession);
    T = addvarString(T,'PostSession','VariableName',"label");
    
    % Add to table
    flickerContrastsTable = [flickerContrastsTable; T];    
end
end

function flickerContrastsTable = flickerContrastsFromValidations(validations)
    flickerContrastsTable = table();

    % Extract flickers
    FlickerDirection_Mel_high = validations('FlickerDirection_Mel_high');
    FlickerDirection_Mel_low = validations('FlickerDirection_Mel_low');
    
    % Extract contrasts
    flickerContrasts_Mel_high = flickerContrastsFromDirectionValidations(FlickerDirection_Mel_high);
    flickerContrasts_Mel_high = addvarString(flickerContrasts_Mel_high,"FlickerDirection_Mel_high",'VariableNames',"direction");
    flickerContrastsTable = [flickerContrastsTable; flickerContrasts_Mel_high];
    
    flickerContrasts_Mel_low = flickerContrastsFromDirectionValidations(FlickerDirection_Mel_low);
    flickerContrasts_Mel_low = addvarString(flickerContrasts_Mel_low,"FlickerDirection_Mel_low",'VariableNames',"direction");    
    flickerContrastsTable = [flickerContrastsTable; flickerContrasts_Mel_low];
end

function flickerContrastsTable = flickerContrastsFromDirectionValidations(validations)
    flickerContrastsTable = table();
    for v = 1:length(validations)
        contrasts = validations(v).contrastActual;
    
        % Write lines
        TPos = table();
        TPos.L = contrasts(1,1);
        TPos.M = contrasts(2,1);
        TPos.S = contrasts(3,1);
        TPos.Mel = contrasts(4,1);
        TPos.component = "positive";
        
        TNeg = table();
        TNeg.L = contrasts(1,1);
        TNeg.M = contrasts(2,1);
        TNeg.S = contrasts(3,1);
        TNeg.Mel = contrasts(4,1);        
        TNeg.component = "negative";
        
        % Add to table
        flickerContrastsTable = [flickerContrastsTable; TPos; TNeg];    
    end
end