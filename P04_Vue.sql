-- Vue des Résultats par Spéciale
CREATE VIEW P04_Vue_Resultats_Par_Etape AS
SELECT position, nom_participant, prenom_participant, nom_speciale, distance_speciale
FROM P04_resultat R
LEFT OUTER JOIN P04_participant P ON R.id_participant = P.id_participant
LEFT OUTER JOIN P04_speciale S ON R.id_speciale = S.id_speciale;


-- Vue des Véhicules et de Leurs Pilotes
CREATE VIEW P04_Vue_Vehicules_Pilotes AS
SELECT marque_vehicule, modele_vehicule, nom_participant, prenom_participant, role_participant
FROM P04_participant P
JOIN P04_vehicule V ON P.id_vehicule = V.id_vehicule;

-- Vue des Participants par Étape
CREATE VIEW P04_Vue_Participants_Etape AS
SELECT nom_etape, nom_participant, prenom_participant, role_participant
FROM P04_participe PA
JOIN P04_etape E ON PA.id_etape = E.id_etape
JOIN P04_participant P ON PA.id_participant = P.id_participant;


SELECT * FROM P04_Vue_Resultats_Par_Etape;
SELECT * FROM P04_Vue_Vehicules_Pilotes;
SELECT * FROM P04_Vue_Participants_Etape;