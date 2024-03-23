-- FONCTIONS ET PROCÉDURES
-- 1 : mise à jour du nom d'un participant en fonction de son identifiant
CREATE OR REPLACE PROCEDURE P04_miseAJourNomParticipant(p_participant_id INT, p_new_name VARCHAR(255)) AS
$$
BEGIN
    UPDATE P04_participant
    SET nom_participant = p_new_name
    WHERE id_participant = p_participant_id;
    IF NOT FOUND THEN
        RAISE EXCEPTION 'Aucun participant trouvé avec l''identifiant : %', p_participant_id;
    END IF;
EXCEPTION
    WHEN others THEN
        RAISE EXCEPTION 'Erreur lors de la mise à jour du nom du participant';
END;
$$ LANGUAGE plpgsql;

-- 2 : retourne le nombre de participants pour une marque de véhicule passée en argument
CREATE OR REPLACE FUNCTION P04_nombreParticipantsParMarque(marque VARCHAR) RETURNS INTEGER AS
$$
DECLARE
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
END;
$$ LANGUAGE plpgsql;

-- 3 : retourne le vehicule d'un participant dont le nom et prénom sont passés en paramètre
CREATE OR REPLACE FUNCTION P04_get_vehicule_participant(nom VARCHAR, prenom VARCHAR)
    RETURNS SETOF P04_vehicule AS
$$
DECLARE
    idParticipant INTEGER;
    ligne         P04_vehicule%ROWTYPE;
BEGIN
    SELECT id_participant
    INTO idParticipant
    FROM P04_Participant
    WHERE nom_participant = nom
      AND prenom_participant = prenom;

    FOR ligne IN (SELECT V.*
                  FROM P04_vehicule V,
                       P04_participant P
                  WHERE V.id_vehicule = P.id_vehicule
                    AND P.id_participant = idParticipant)
        LOOP
            RETURN NEXT ligne;
        END LOOP;
    RETURN;
EXCEPTION
    WHEN others THEN
        RETURN;
END;
$$ LANGUAGE plpgsql;

-- 4
--Avec une fonction : retourne les participants en fonction de leur role
CREATE OR REPLACE FUNCTION P04_get_participants_par_role(nom_role VARCHAR)
    RETURNS SETOF P04_participant AS
$$
DECLARE
    participant_enregistrement P04_participant;
    curseur_participant CURSOR FOR SELECT *
                                   FROM P04_participant
                                   WHERE role_participant = nom_role;
BEGIN
    OPEN curseur_participant;
    LOOP
        FETCH curseur_participant INTO participant_enregistrement;
        EXIT WHEN NOT FOUND;
        RETURN NEXT participant_enregistrement;
    END LOOP;
    CLOSE curseur_participant;
    RETURN;
EXCEPTION
    WHEN others THEN
        RETURN;
END;
$$ LANGUAGE plpgsql;

-- avec une procedure : Met à jour l'âge des participants en fonction de la nationalité avec gestion des exceptions
CREATE OR REPLACE PROCEDURE P04_update_age_par_nationalite(nationalite_nom VARCHAR, nouvel_age INT)
AS
$$
DECLARE
    participant_id INT;
BEGIN
    FOR participant_id IN SELECT id_participant FROM P04_participant WHERE nationalite_participant = nationalite_nom
        LOOP
            UPDATE P04_participant SET age_participant = nouvel_age WHERE id_participant = participant_id;
        END LOOP;
EXCEPTION
    WHEN others THEN
        RAISE EXCEPTION 'Erreur lors de la mise à jour de l''âge des participants';
END;
$$ LANGUAGE plpgsql;


-- TRIGGERS
-- 1 : trigger qui sauvegarde les informations d'un participant les informations avant une mise à jour
-- Création de la table de sauvegarde
CREATE TABLE IF NOT EXISTS P04_info_avant_modification (
    id_participant INT,
    nom_avant VARCHAR(255),
    prenom_avant VARCHAR(255),
    age_avant INT,
    nationalite_avant VARCHAR(255)
);
-- Trigger déclenché avant la mise à jour
CREATE OR REPLACE FUNCTION avant_modif_participant()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO P04_info_avant_modification(id_participant, nom_avant, prenom_avant, age_avant, nationalite_avant)
    VALUES (OLD.id_participant, OLD.nom_participant, OLD.prenom_participant, OLD.age_participant, OLD.nationalite_participant);
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER trigger_avant_modif_participant
BEFORE UPDATE ON P04_participant
FOR EACH ROW
EXECUTE FUNCTION avant_modif_participant();

-- 2 : trigger qui renvoi un message lorsque les informations sont  mise à jour
CREATE OR REPLACE FUNCTION avant_modif_participant_statement()
RETURNS TRIGGER AS $$
BEGIN
    -- Vérifie si c'est une mise à jour et
    IF TG_OP = 'UPDATE' THEN
        RAISE NOTICE 'Les informations pour l''id_participant % ont été mises à jour.', NEW.id_participant;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_avant_modif_participant_statement
AFTER UPDATE ON P04_participant
FOR EACH STATEMENT
EXECUTE FUNCTION avant_modif_participant_statement();


-- TESTS
-- 1
CALL P04_miseAJourNomParticipant(2, 'aaaaa');
SELECT *
FROM p04_participant
WHERE id_participant = 2;
--2
SELECT P04_nombreParticipantsParMarque('YAMAHA');
--3
SELECT P04_get_vehicule_participant('Sunderland', 'Sam');
--4
SELECT * FROM P04_get_participants_par_role('Pilote');
CALL P04_update_age_par_nationalite('FRA', 30);
SELECT *
FROM p04_participant
WHERE nationalite_participant = 'FRA';

--triggers
-- 1
-- Effectuer la mise à jour d'un participant
UPDATE p04_participant
SET nom_participant='lolo'
WHERE id_participant=5;
-- Vérifier le contenu de la table de sauvegarde
SELECT * FROM P04_info_avant_modification;
SELECT * FROM p04_participant;

-- 2
UPDATE P04_participant
SET age_participant = 30
WHERE id_participant IN (1, 2, 3, 7, 8,9);
SELECT * FROM P04_info_avant_modification ;
select * from p04_participant;