function backgroundContrastsTable = backgroundContrastsFromMaterials(materials)
backgroundContrastsTable = table();

receptors = materials.receptors;

if isfield(materials,'measurementsNominal')
    % Extract measurements
    measurementsPre = materials.measurementsPre;
    
    % Get contrasts
    T = backgroundContrastsFromMeasurements(measurementsPre,receptors);
    T = addvarString(T,'PreCorrection','VariableName',"label");
    
    % Add to table
    backgroundContrastsTable = [backgroundContrastsTable; T];
end

if isfield(materials,'measurementsPre')
    % Extract measurements
    measurementsPostCorrection = materials.measurementsPre;
    
    % Get contrasts
    T = backgroundContrastsFromMeasurements(measurementsPostCorrection,receptors);
    T = addvarString(T,'PostCorrection','VariableName',"label");
    
    % Add to table
    backgroundContrastsTable = [backgroundContrastsTable; T];
end

if isfield(materials,'measurementsPost')
    % Extract measurements
    measurementsPostSession = materials.measurementsPost;
    
    % Get contrasts
    T = backgroundContrastsFromMeasurements(measurementsPostSession,receptors);
    T = addvarString(T,'PostSession','VariableName',"label");
    
    % Add to table
    backgroundContrastsTable = [backgroundContrastsTable; T];
end
end

function backgroundContrastsTable = backgroundContrastsFromMeasurements(measurements,receptors)
backgroundContrastsTable = table();

% Extract backgrounds
Mel_high = measurements('Mel_high');
Mel_low = measurements('Mel_low');

% Calculate contrast for paired measurements
for v = 1:length(Mel_high)
    SPD_high = [Mel_high(v).SPD];
    SPD_low = [Mel_low(v).SPD];
    contrasts = SPDToReceptorContrast([SPD_high SPD_low],receptors);
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