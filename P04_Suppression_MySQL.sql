-- Suppression des tables
DROP TABLE IF EXISTS P04_resultat;
DROP TABLE IF EXISTS P04_participe;
DROP TABLE IF EXISTS P04_participant;
DROP TABLE IF EXISTS P04_vehicule;
DROP TABLE IF EXISTS P04_speciale;
DROP TABLE IF EXISTS P04_etape;

-- Suppression des vues
DROP VIEW IF EXISTS P04_Vue_Resultats_Par_Etape;
DROP VIEW IF EXISTS P04_Vue_Vehicules_Pilotes;
DROP VIEW IF EXISTS P04_Vue_Participants_Etape;