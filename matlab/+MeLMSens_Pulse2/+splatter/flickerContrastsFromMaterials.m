function flickerContrastsTable = flickerContrastsFromMaterials(materials)
flickerContrastsTable = table();

receptors = materials.receptors;

if isfield(materials,'measurementsNominal')
    % Extract measurements
    measurementsPre = materials.measurementsNominal;
    
    % Get contrasts
    T = flickerContrastsFromMeasurements(measurementsPre,receptors);
    T = addvarString(T,'PreCorrection','VariableName',"label");
    
    % Add to table
    flickerContrastsTable = [flickerContrastsTable; T];
end

if isfield(materials,'measurementsPre')
    % Extract measurements
    measurementsPostCorrection = materials.measurementsPre;
    
    % Get contrasts
    T = flickerContrastsFromMeasurements(measurementsPostCorrection,receptors);
    T = addvarString(T,'PostCorrection','VariableName',"label");
    
    % Add to table
    flickerContrastsTable = [flickerContrastsTable; T];    
end

if isfield(materials,'measurementsPost')
    % Extract measurements
    measurementsPostSession = materials.measurementsPost;
    
    % Get contrasts
    T = flickerContrastsFromMeasurements(measurementsPostSession,receptors);
    T = addvarString(T,'PostSession','VariableName',"label");
    
    % Add to table
    flickerContrastsTable = [flickerContrastsTable; T];    
end
end

function flickerContrastsTable = flickerContrastsFromMeasurements(measurements,receptors)
    flickerContrastsTable = table();

    % Extract backgrounds
    Mel_high = measurements('Mel_high');
    Mel_low = measurements('Mel_low');
    
    % Extract contrasts
    flickerContrasts_Mel_high = flickerContrastsFromDirectionMeasurements(Mel_high,receptors);
    flickerContrasts_Mel_high = addvarString(flickerContrasts_Mel_high,"FlickerDirection_Mel_high",'VariableNames',"direction");
    flickerContrastsTable = [flickerContrastsTable; flickerContrasts_Mel_high];
    
    flickerContrasts_Mel_low = flickerContrastsFromDirectionMeasurements(Mel_low,receptors);
    flickerContrasts_Mel_low = addvarString(flickerContrasts_Mel_low,"FlickerDirection_Mel_low",'VariableNames',"direction");    
    flickerContrastsTable = [flickerContrastsTable; flickerContrasts_Mel_low];
end

function flickerContrastsTable = flickerContrastsFromDirectionMeasurements(measurements, receptors)
    % Load flicker SPDs
    MeLMSens_Pulse2.splatter.flickerProjectorSPDs;


    for v = 1:length(measurements)
        % Background SPD
        SPD_background = measurements(v).SPD;
        
        % Contrasts
        contrastsPos = SPDToReceptorContrast([SPDsHighPos, SPD_background],receptors);
        contrastsPos = contrastsPos(1:end-1,end,:);
        contrastsPos = reshape(contrastsPos,[4,25]);
        contrastsPos = median(contrastsPos,2);

        contrastsNeg = SPDToReceptorContrast([SPDsHighNeg, SPD_background],receptors);
        contrastsNeg = contrastsNeg(1:end-1,end,:);
        contrastsNeg = reshape(contrastsNeg,[4,25]);
        contrastsNeg = median(contrastsNeg,2);        
        
        % Write lines
        TPos = table();
        TPos.L = contrastsPos(1,1);
        TPos.M = contrastsPos(2,1);
        TPos.S = contrastsPos(3,1);
        TPos.Mel = contrastsPos(4,1);
        TPos.component = "positive";
        
        TNeg = table();
        TNeg.L = contrastsNeg(1,1);
        TNeg.M = contrastsNeg(2,1);
        TNeg.S = contrastsNeg(3,1);
        TNeg.Mel = contrastsNeg(4,1);        
        TNeg.component = "negative";
        
        % Add to table
        flickerContrastsTable = [TPos; TNeg];    
    end
end