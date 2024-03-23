-- FONCTIONS ET PROCÉDURES
-- 1 : mise à jour du nom d'un participant en fonction de son identifiant
CREATE OR REPLACE PROCEDURE P04_miseAJourNomParticipant(
    p_participant_id INT,
    p_new_name VARCHAR2
) AS
BEGIN
    UPDATE P04_participant
    SET nom_participant = p_new_name
    WHERE id_participant = p_participant_id;
END P04_miseAJourNomParticipant;

-- 2 : retourne le nombre de participants pour une marque de véhicule passée en argument
CREATE OR REPLACE FUNCTION P04_nombreParticipantsParMarque(marque VARCHAR2) RETURN INTEGER IS
    total_participants INTEGER;
BEGIN
    SELECT COUNT(*)
    INTO total_participants
    FROM P04_participant P
    LEFT JOIN p04_vehicule V ON P.id_vehicule = V.id_vehicule
    WHERE V.marque_vehicule = marque;
    RETURN total_participants;
    EXCEPTION
    WHEN others THEN
        RETURN -1; -- Valeur de retour pour gérer l'erreur
END P04_nombreParticipantsParMarque;

-- 3 : retourne le vehicule d'un participant dont le nom et prénom sont passés en paramètre
CREATE OR REPLACE PROCEDURE P04_get_vehicule_participant(
    nom_param IN VARCHAR2,
    prenom_param IN VARCHAR2,
    vehicule_cursor OUT SYS_REFCURSOR
)
AS
    idParticipant INTEGER;
    ligne P04_vehicule%ROWTYPE;
BEGIN
    -- Obtention de l'ID du participant en fonction du nom et du prénom
    SELECT id_participant
    INTO idParticipant
    FROM P04_Participant
    WHERE nom_participant = nom_param
      AND prenom_participant = prenom_param;

    -- Ouverture du curseur pour stocker les résultats
    OPEN vehicule_cursor FOR
        SELECT V.*
        FROM P04_vehicule V,
             P04_participant P
        WHERE V.id_vehicule = P.id_vehicule
          AND P.id_participant = idParticipant;
EXCEPTION
    WHEN others THEN
        -- Gestion des exceptions (peut être adaptée selon les besoins)
        NULL;
END P04_get_vehicule_participant;

-- 4
-- avec une fonction : retourne les participants en fonction de leur role
CREATE OR REPLACE PROCEDURE P04_get_participants_par_role(
    nom_role IN VARCHAR2,
    participants_cursor OUT SYS_REFCURSOR
)
IS
    participant_enregistrement P04_participant%ROWTYPE;
BEGIN
    OPEN participants_cursor FOR
        SELECT *
        FROM P04_participant
        WHERE role_participant = nom_role;

    LOOP
        FETCH participants_cursor INTO participant_enregistrement;
        EXIT WHEN participants_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID Participant: ' || participant_enregistrement.id_participant);
        -- Ajoutez d'autres colonnes selon la structure de votre table P04_participant
    END LOOP;

    CLOSE participants_cursor;
EXCEPTION
    WHEN others THEN
        -- Gestion des exceptions (peut être adaptée selon les besoins)
        DBMS_OUTPUT.PUT_LINE('Une erreur s''est produite.');
END P04_get_participants_par_role;

-- avec une procedure : Met à jour l'âge des participants en fonction de la nationalité avec gestion des exceptions
CREATE OR REPLACE PROCEDURE P04_update_age_par_nationalite(
    nationalite_nom IN VARCHAR2,
    nouvel_age IN NUMBER
)
IS
    participant_id NUMBER;
BEGIN
    FOR participant_rec IN (SELECT id_participant FROM P04_participant WHERE nationalite_participant = nationalite_nom)
    LOOP
        UPDATE P04_participant SET age_participant = nouvel_age WHERE id_participant = participant_rec.id_participant;
    END LOOP;
END P04_update_age_par_nationalite;


-- TRIGGERS
-- 1 : trigger qui sauvegarde les informations d'un participant les informations avant une mise à jour
-- Création de la table de sauvegarde
CREATE TABLE P04_info_avant_modification (
    id_participant NUMBER,
    nom_avant VARCHAR2(255),
    prenom_avant VARCHAR2(255),
    age_avant NUMBER,
    nationalite_avant VARCHAR2(255)
);
-- Trigger déclenché avant la mise à jour
CREATE OR REPLACE TRIGGER trigger_avant_modif_participant
BEFORE UPDATE ON P04_participant
FOR EACH ROW
DECLARE
BEGIN
    INSERT INTO P04_info_avant_modification(id_participant, nom_avant, prenom_avant, age_avant, nationalite_avant)
    VALUES (:OLD.id_participant, :OLD.nom_participant, :OLD.prenom_participant, :OLD.age_participant, :OLD.nationalite_participant);
END;

-- 2
CREATE OR REPLACE TRIGGER trigger_avant_modif_participant_statement
BEFORE UPDATE ON P04_participant
FOR EACH STATEMENT
DECLARE
BEGIN
    -- Vérifie si c'est une mise à jour
    IF UPDATING THEN
        DBMS_OUTPUT.PUT_LINE('Les informations pour l''id_participant ' || :NEW.id_participant || ' ont été mises à jour.');
    END IF;
END;



-- TESTS
--1
CALL P04_miseAJourNomParticipant(2, 'Syrder');
SELECT * FROM p04_participant WHERE id_participant=2;
--2
DECLARE
    resultat INTEGER;
BEGIN
    SELECT P04_nombreParticipantsParMarque('YAMAHA') INTO resultat FROM DUAL;
    DBMS_OUTPUT.PUT_LINE('Nombre de participants : ' || resultat);
END;
--3
DECLARE
    nom_participant_test VARCHAR2(50) := 'Sunderland';
    prenom_participant_test VARCHAR2(50) := 'Sam';
    vehicule_cursor SYS_REFCURSOR;
    vehicule_row P04_vehicule%ROWTYPE;
BEGIN
    -- Appel de la procédure avec les valeurs de test
    P04_get_vehicule_participant(
        nom_participant_test,
        prenom_participant_test,
        vehicule_cursor
    );

    -- Boucle pour récupérer les résultats du curseur
    LOOP
        FETCH vehicule_cursor INTO vehicule_row;
        EXIT WHEN vehicule_cursor%NOTFOUND;

        -- Affichage des résultats
        DBMS_OUTPUT.PUT_LINE('ID Véhicule: ' || vehicule_row.id_vehicule);
        -- Ajoutez d'autres colonnes selon la structure de votre table P04_vehicule
    END LOOP;

    -- Fermeture du curseur
    CLOSE vehicule_cursor;
EXCEPTION
    WHEN others THEN
        -- Gestion des exceptions (peut être adaptée selon les besoins)
        DBMS_OUTPUT.PUT_LINE('Une erreur s''est produite.');
END;
--4 : fonction
DECLARE
    nom_role_test VARCHAR2(50) := 'Pilote';
    participants_cursor SYS_REFCURSOR;
    participant_enregistrement P04_participant%ROWTYPE;
BEGIN
    -- Appel de la procédure avec le rôle de test
    P04_get_participants_par_role(nom_role_test, participants_cursor);

    -- Boucle pour récupérer les résultats du curseur
    LOOP
        FETCH participants_cursor INTO participant_enregistrement;
        EXIT WHEN participants_cursor%NOTFOUND;

        -- Affichage des résultats
        DBMS_OUTPUT.PUT_LINE('ID Participant: ' || participant_enregistrement.id_participant);
        -- Ajoutez d'autres colonnes selon la structure de votre table P04_participant
    END LOOP;

    -- Fermeture du curseur
    CLOSE participants_cursor;
EXCEPTION
    WHEN others THEN
        -- Gestion des exceptions (peut être adaptée selon les besoins)
        DBMS_OUTPUT.PUT_LINE('Une erreur s''est produite.');
END;
-- 4 : procedure
DECLARE
    nationalite_test VARCHAR2(50) := 'FRA';
    nouvel_age_test NUMBER := 30;
BEGIN
    -- Appel de la procédure avec les valeurs de test
    P04_update_age_par_nationalite(nationalite_test, nouvel_age_test);

    -- Affichage d'un message de confirmation
    DBMS_OUTPUT.PUT_LINE('Mise à jour de l''âge pour la nationalité ' || nationalite_test || ' effectuée.');

EXCEPTION
    WHEN others THEN
        -- Gestion des exceptions (peut être adaptée selon les besoins)
        DBMS_OUTPUT.PUT_LINE('Une erreur s''est produite : ' || SQLERRM);
END;
SELECT *
FROM p04_participant
WHERE nationalite_participant = 'FRA';

-- TRIGGERS
-- 1
UPDATE P04_participant
SET nom_participant = 'NouveauNom'
WHERE id_participant = 1;
-- Sélection pour vérifier les résultats dans la table de sauvegarde
SELECT * FROM P04_info_avant_modification;

-- 2
UPDATE P04_participant
SET age_participant = 30
WHERE id_participant IN (1, 2, 3, 7, 8,9);
SELECT * FROM P04_info_avant_modification ;
select * from p04_participant;