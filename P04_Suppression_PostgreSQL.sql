-- Suppression des vues
DROP VIEW IF EXISTS P04_Vue_Resultats_Par_Etape;
DROP VIEW IF EXISTS P04_Vue_Vehicules_Pilotes;
DROP VIEW IF EXISTS P04_Vue_Participants_Etape;

-- Suppression des triggers
DROP TRIGGER IF EXISTS trigger_avant_modif_participant ON P04_participant;
DROP TRIGGER IF EXISTS trigger_avant_modif_participant_statement ON P04_participant;

-- Suppression des fonctions et procedures
DROP PROCEDURE IF EXISTS P04_miseAJourNomParticipant;
DROP FUNCTION IF EXISTS P04_nombreParticipantsParMarque;
DROP FUNCTION IF EXISTS P04_get_vehicule_participant;
DROP FUNCTION IF EXISTS P04_get_participants_par_role;
DROP PROCEDURE IF EXISTS P04_update_age_par_nationalite;
DROP FUNCTION IF EXISTS avant_modif_participant;
DROP FUNCTION IF EXISTS avant_modif_participant_statement;

-- Suppression des tables
DROP TABLE IF EXISTS P04_resultat;
DROP TABLE IF EXISTS P04_participe;
DROP TABLE IF EXISTS P04_participant;
DROP TABLE IF EXISTS P04_vehicule;
DROP TABLE IF EXISTS P04_speciale;
DROP TABLE IF EXISTS P04_etape;
DROP TABLE IF EXISTS P04_info_avant_modification;



