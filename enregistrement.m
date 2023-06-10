% Fréquences des notes
DO = 261.63;
RE = 293.66;
MI = 329.63;
FA = 349.23;
SOL = 392.00;
LA = 440.00;

% Durées des notes en secondes
quarterNote = 0.5;
halfNote = 1;
wholeNote = 2;

% Partition de "Au clair de la lune"
notes = [DO DO DO RE MI RE DO MI RE RE DO DO DO DO RE MI RE DO MI RE RE DO RE RE RE RE];

% Durées correspondantes
durations = [quarterNote, quarterNote, quarterNote, quarterNote, halfNote, halfNote, quarterNote, quarterNote, quarterNote, quarterNote, wholeNote, quarterNote, quarterNote, quarterNote, quarterNote, halfNote, halfNote, quarterNote, quarterNote, quarterNote, quarterNote, wholeNote, quarterNote, quarterNote, quarterNote, quarterNote ];

% Tempo du morceau (modifier si nécessaire)
tempo = 120;

% Calcul de la durée de chaque note en secondes
noteDurations = durations * (60/tempo);

fs = 16000; % Fréquence d'échantillonnage
durationTotal = sum(noteDurations); % Durée totale du morceau en secondes

% Génération du signal audio
t = 0:(1/fs):durationTotal;
y = zeros(size(t));

currentSample = 1;
for i = 1:length(notes)
    note = notes(i);
    duration = noteDurations(i);
    
    if note ~= 0
        samples = round(duration * fs);
        tNote = t(currentSample:currentSample+samples-1);
        y(currentSample:currentSample+samples-1) = sin(2*pi*note*tNote);
        pause(duration);
    else
        pause(duration);
    end
    currentSample = currentSample + samples;
    
end

% Enregistrement du signal audio dans un fichier .wav
filename = ['clair_de_lune_2.wav'];
audiowrite(filename, y, fs);

disp('Le fichier audio a été enregistré avec succès.');