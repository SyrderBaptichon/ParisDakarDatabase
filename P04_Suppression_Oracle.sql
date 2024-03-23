-- Suppression des vues
DROP VIEW P04_Vue_Resultats_Par_Etape;
DROP VIEW P04_Vue_Vehicules_Pilotes;
DROP VIEW P04_Vue_Participants_Etape;

-- Suppression des triggers
DROP TRIGGER trigger_avant_modif_participant;
DROP TRIGGER trigger_avant_modif_participant_statement;

-- Suppression des fonctions et procedures
DROP PROCEDURE P04_miseAJourNomParticipant;
DROP FUNCTION P04_nombreParticipantsParMarque;
DROP PROCEDURE P04_get_vehicule_participant;
DROP PROCEDURE P04_get_participants_par_role;
DROP  PROCEDURE P04_update_age_par_nationalite;

-- Suppression des tables
DROP TABLE P04_resultat;
DROP TABLE P04_participe;
DROP TABLE P04_participant;
DROP TABLE P04_vehicule;
DROP TABLE P04_speciale;
DROP TABLE P04_etape;
DROP TABLE P04_info_avant_modification;

-- Suppression des séquences
DROP SEQUENCE participant_seq;
DROP SEQUENCE vehicule_seq;
DROP SEQUENCE etape_seq;
DROP SEQUENCE speciale_seq;
