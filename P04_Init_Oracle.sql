-- Création de la table P04_vehicule
CREATE SEQUENCE vehicule_seq;

CREATE TABLE P04_vehicule (
    id_vehicule INT DEFAULT vehicule_seq.nextval PRIMARY KEY,
    marque_vehicule VARCHAR(255) NOT NULL,
    modele_vehicule VARCHAR(255),
    categorie_vehicule VARCHAR(255) NOT NULL CHECK (categorie_vehicule IN ('Moto', 'Camion', 'Auto', 'Quad', 'Proto Léger', 'SSV', 'Classic')),
    ecurie_vehicule VARCHAR(255) NOT NULL
);

-- Création de la table P04_participant
CREATE SEQUENCE participant_seq;

CREATE TABLE P04_participant (
    id_participant INT DEFAULT participant_seq.nextval PRIMARY KEY,
    nom_participant VARCHAR(255) NOT NULL,
    prenom_participant VARCHAR(255) NOT NULL,
    age_participant INT,
    nationalite_participant VARCHAR(255) NOT NULL,
    role_participant VARCHAR(255) NOT NULL CHECK (role_participant IN ('Pilote', 'Copilote')),
    id_vehicule INT,
    FOREIGN KEY (id_vehicule) REFERENCES P04_vehicule(id_vehicule)
);

-- Création de la table P04_etape
CREATE SEQUENCE etape_seq;

CREATE TABLE P04_etape (
    id_etape INT DEFAULT etape_seq.nextval PRIMARY KEY,
    nom_etape VARCHAR(255) NOT NULL,
    date_depart DATE NOT NULL,
    date_arrivee DATE NOT NULL
);

-- Création de la table P04_speciale
CREATE SEQUENCE speciale_seq START WITH 1 INCREMENT BY 1;

CREATE TABLE P04_speciale (
    id_speciale INT DEFAULT speciale_seq.nextval PRIMARY KEY,
    nom_speciale VARCHAR(255) NOT NULL,
    distance_speciale FLOAT NOT NULL,
    id_etape INT NOT NULL ,
    FOREIGN KEY (id_etape) REFERENCES P04_etape(id_etape)
);

-- Création de la table P04_resultat
CREATE TABLE P04_resultat (
    position INT,
    id_speciale INT,
    id_participant INT,
    FOREIGN KEY (id_speciale) REFERENCES P04_speciale(id_speciale),
    FOREIGN KEY (id_participant) REFERENCES P04_participant(id_participant),
    PRIMARY KEY (id_participant, id_speciale)
);

-- Création de la table P04_participe
CREATE TABLE P04_participe (
    id_etape INT,
    id_participant INT,
    FOREIGN KEY (id_etape) REFERENCES P04_etape(id_etape),
    FOREIGN KEY (id_participant) REFERENCES P04_participant(id_participant),
    PRIMARY KEY (id_participant, id_etape)
);


-- alimentation de P04_vehicule
INSERT INTO P04_vehicule(marque_vehicule, modele_vehicule, categorie_vehicule ,ecurie_vehicule) VALUES ('GasGas', '450 Rally Factory', 'Moto', 'GasGas Factory Team');
INSERT INTO P04_vehicule(marque_vehicule, modele_vehicule, categorie_vehicule ,ecurie_vehicule) VALUES ('HONDA', 'CRF 450 RALLY 01', 'Moto', 'Monster Energy Honda Team');
INSERT INTO P04_vehicule(marque_vehicule, modele_vehicule, categorie_vehicule ,ecurie_vehicule) VALUES ('HONDA', 'CRF 450 RALLY', 'Moto', 'Monster Energy JB Team');
INSERT INTO P04_vehicule(marque_vehicule, modele_vehicule, categorie_vehicule ,ecurie_vehicule) VALUES ('HONDA', 'CRF 450 RALLY 02', 'Moto', 'Monster Energy Honda Team');
INSERT INTO P04_vehicule(marque_vehicule, modele_vehicule, categorie_vehicule ,ecurie_vehicule) VALUES ('KTM', '450 RALLY FACTORY', 'Moto', 'Red Bull KTM Factory Racing');

INSERT INTO P04_vehicule(marque_vehicule, modele_vehicule, categorie_vehicule ,ecurie_vehicule) VALUES ('TOYOTA', 'GR DKR HILUX', 'Auto', 'Toyota Gazoo Racing');
INSERT INTO P04_vehicule(marque_vehicule, modele_vehicule, categorie_vehicule ,ecurie_vehicule) VALUES ('PRODRIVE', 'HUNTER', 'Auto', 'Bahrain Raid Xtreme');
INSERT INTO P04_vehicule(marque_vehicule, modele_vehicule, categorie_vehicule ,ecurie_vehicule) VALUES ('TOYOTA', 'HILUX OVERDRIVE', 'Auto', 'Overdrive Racing');
INSERT INTO P04_vehicule(marque_vehicule, modele_vehicule, categorie_vehicule ,ecurie_vehicule) VALUES('MINI', 'JOHN COOPER WORKS PLUS', 'Auto', 'X-Raid Mini JCW Team');
INSERT INTO P04_vehicule(marque_vehicule, modele_vehicule, categorie_vehicule ,ecurie_vehicule) VALUES ('AUDI', 'RS Q E-TRON E2', 'Auto', 'Team Audi Sport');

INSERT INTO P04_vehicule(marque_vehicule, modele_vehicule, categorie_vehicule ,ecurie_vehicule) VALUES('YAMAHA', 'RAPTOR 700', 'Quad', 'Yamaha Racing - SMX - Dragon');
INSERT INTO P04_vehicule(marque_vehicule, modele_vehicule, categorie_vehicule ,ecurie_vehicule) VALUES('YAMAHA', 'RAPTOR 700', 'Quad', '7240 Team');
INSERT INTO P04_vehicule(marque_vehicule, modele_vehicule, categorie_vehicule ,ecurie_vehicule) VALUES('YAMAHA', 'RAPTOR 700', 'Quad', 'Varga Motorsport Team');
INSERT INTO P04_vehicule(marque_vehicule, modele_vehicule, categorie_vehicule ,ecurie_vehicule) VALUES('YAMAHA', 'RAPTOR 700', 'Quad', 'Dragon');
INSERT INTO P04_vehicule(marque_vehicule, modele_vehicule, categorie_vehicule ,ecurie_vehicule) VALUES('YAMAHA', 'RAPTOR 700', 'Quad', 'Orlen Team');

INSERT INTO P04_vehicule(marque_vehicule, modele_vehicule, categorie_vehicule ,ecurie_vehicule) VALUES('IVECO', 'POWERSTAR', 'Camion', 'Project 2030');
INSERT INTO P04_vehicule(marque_vehicule, modele_vehicule, categorie_vehicule ,ecurie_vehicule) VALUES('IVECO', 'POWERSTAR', 'Camion', 'MM Technology');
INSERT INTO P04_vehicule(marque_vehicule, modele_vehicule, categorie_vehicule ,ecurie_vehicule) VALUES('IVECO', 'POWESTAR', 'Camion', 'Boss Machinery Team De Rooy Iveco');
INSERT INTO P04_vehicule(marque_vehicule, modele_vehicule, categorie_vehicule ,ecurie_vehicule) VALUES('TATRA', '815', 'Camion', 'Tatra Buggyra ZM Racing');
INSERT INTO P04_vehicule(marque_vehicule, modele_vehicule, categorie_vehicule ,ecurie_vehicule) VALUES('IVECO', 'POWERSTAR', 'Camion', 'Boss Machinery Team De Rooy Iveco');

INSERT INTO P04_vehicule(marque_vehicule, modele_vehicule, categorie_vehicule ,ecurie_vehicule) VALUES('CAN-AM', 'XRS', 'Proto Léger', 'RED BULL CAN-AM FACTORY TEAM');
INSERT INTO P04_vehicule(marque_vehicule, modele_vehicule, categorie_vehicule ,ecurie_vehicule) VALUES('CAN-AM', 'MAVERICK', 'Proto Léger', 'RED BULL OFF-ROAD JR TEAM USA BY BFG');
INSERT INTO P04_vehicule(marque_vehicule, modele_vehicule, categorie_vehicule ,ecurie_vehicule) VALUES('CAN-AM', 'CAN-AM', 'Proto Léger', 'RED BULL CAN-AM FACTORY TEAM');
INSERT INTO P04_vehicule(marque_vehicule, modele_vehicule, categorie_vehicule ,ecurie_vehicule) VALUES('CAN-AM', 'MAVERICK', 'Proto Léger', 'Monster Energy CAN-AM');
INSERT INTO P04_vehicule(marque_vehicule, modele_vehicule, categorie_vehicule ,ecurie_vehicule) VALUES('GRALLYTEAM', 'OT3', 'Proto Léger', 'GRALLYTEAM');

INSERT INTO P04_vehicule(marque_vehicule, modele_vehicule, categorie_vehicule ,ecurie_vehicule) VALUES('CAN-AM', 'MAVERICK XRS TURBO', 'SSV', 'Red Bull Can-Am Factory Team');
INSERT INTO P04_vehicule(marque_vehicule, modele_vehicule, categorie_vehicule ,ecurie_vehicule) VALUES('CAN-AM', 'MAVERICK XRS TURBO 01', 'SSV', 'Energy landia Rally Team');
INSERT INTO P04_vehicule(marque_vehicule, modele_vehicule, categorie_vehicule ,ecurie_vehicule) VALUES('CAN-AM', 'MAVERICK XRS TURBO ', 'SSV', 'South Racing Can-Am');
INSERT INTO P04_vehicule(marque_vehicule, modele_vehicule, categorie_vehicule ,ecurie_vehicule) VALUES('CAN-AM', 'MAVERICK XRS TURBO 02', 'SSV', 'Energy landia Rally Team');
INSERT INTO P04_vehicule(marque_vehicule, modele_vehicule, categorie_vehicule ,ecurie_vehicule) VALUES('CAN-AM', 'MAVERICK XRS TURBO 03', 'SSV', 'South Racing Can-Am');

INSERT INTO P04_vehicule(marque_vehicule, modele_vehicule, categorie_vehicule ,ecurie_vehicule) VALUES('TOYOTA', 'HDJ80', 'Classic', 'Team FSO');
INSERT INTO P04_vehicule(marque_vehicule, modele_vehicule, categorie_vehicule ,ecurie_vehicule) VALUES('PROTRUCK', 'TEAM FJ', 'Classic', 'Team FJ');
INSERT INTO P04_vehicule(marque_vehicule, modele_vehicule, categorie_vehicule ,ecurie_vehicule) VALUES('TOYOTA', 'LAND CRUISER', 'Classic', 'Toyota Classic');
INSERT INTO P04_vehicule(marque_vehicule, modele_vehicule, categorie_vehicule ,ecurie_vehicule) VALUES('TOYOTA', 'HDJ80', 'Classic', 'Toyota Classic');
INSERT INTO P04_vehicule(marque_vehicule, modele_vehicule, categorie_vehicule ,ecurie_vehicule) VALUES('PORSCHE', 'MARTINY', 'Classic', 'Team Logistic Rallye');


-- alimentation de P04_participant
--moto
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Sam', 'Sunderland', NULL, 'GBR', 'Pilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'GasGas' AND modele_vehicule = '450 Rally Factory' AND ecurie_vehicule = 'GasGas Factory Team'));
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Ricky', 'Brabec', NULL, 'USA', 'Pilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'HONDA' AND modele_vehicule = 'CRF 450 RALLY 01' AND ecurie_vehicule = 'Monster Energy Honda Team'));
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Joan', 'Barreda Bort', NULL, 'ESP', 'Pilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'HONDA' AND modele_vehicule = 'CRF 450 RALLY' AND ecurie_vehicule = 'Monster Energy JB Team'));
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Pablo', 'Quintanilla', NULL, 'CHL', 'Pilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'HONDA' AND modele_vehicule = 'CRF 450 RALLY 02' AND ecurie_vehicule = 'Monster Energy Honda Team'));
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Toby', 'Price', NULL, 'AUS', 'Pilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'KTM' AND modele_vehicule = '450 RALLY FACTORY' AND ecurie_vehicule = 'Red Bull KTM Factory Racing'));


-- auto
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Nasser', 'Al-Attiyah', NULL, 'QAT', 'Pilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'TOYOTA' AND modele_vehicule = 'GR DKR HILUX' AND ecurie_vehicule = 'Toyota Gazoo Racing'));
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Mathieu', 'Baumel', NULL, 'FRA', 'Copilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'TOYOTA' AND modele_vehicule = 'GR DKR HILUX' AND ecurie_vehicule = 'Toyota Gazoo Racing'));
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Sebastien', 'Loeb', NULL, 'FRA', 'Pilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'PRODRIVE' AND modele_vehicule = 'HUNTER' AND ecurie_vehicule = 'Bahrain Raid Xtreme'));
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Fabian', 'Lurquin', NULL, 'BEL', 'Copilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'PRODRIVE' AND modele_vehicule = 'HUNTER' AND ecurie_vehicule = 'Bahrain Raid Xtreme'));
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Yazeed', 'Al Rajhi', NULL, 'SAU', 'Pilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'TOYOTA' AND modele_vehicule = 'HILUX OVERDRIVE' AND ecurie_vehicule = 'Overdrive Racing'));
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Michael', 'Orr', NULL, 'GBR', 'Copilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'TOYOTA' AND modele_vehicule = 'HILUX OVERDRIVE' AND ecurie_vehicule = 'Overdrive Racing'));
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Jakub', 'Przygonski', NULL, 'POL', 'Pilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'MINI' AND modele_vehicule = 'JOHN COOPER WORKS PLUS' AND ecurie_vehicule = 'X-Raid Mini JCW Team'));
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Armand', 'Monleon', NULL, 'ESP', 'Copilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'MINI' AND modele_vehicule = 'JOHN COOPER WORKS PLUS' AND ecurie_vehicule = 'X-Raid Mini JCW Team'));
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Stéphane', 'Peterhansel', NULL, 'FRA', 'Pilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'AUDI' AND modele_vehicule = 'RS Q E-TRON E2' AND ecurie_vehicule = 'Team Audi Sport'));
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Edouard', 'Boulanger', NULL, 'FRA', 'Copilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'AUDI' AND modele_vehicule = 'RS Q E-TRON E2' AND ecurie_vehicule = 'Team Audi Sport'));

-- Quad
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Alexandre', 'Giroud', NULL, 'FRA', 'Pilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'YAMAHA' AND modele_vehicule = 'RAPTOR 700' AND ecurie_vehicule = 'Yamaha Racing - SMX - Dragon'));
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Manuel', 'Andujar', NULL, 'ARG', 'Pilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'YAMAHA' AND modele_vehicule = 'RAPTOR 700' AND ecurie_vehicule = '7240 Team'));
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Juraj', 'Varga', NULL, 'SVK', 'Pilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'YAMAHA' AND modele_vehicule = 'RAPTOR 700' AND ecurie_vehicule = 'Varga Motorsport Team'));
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Francisco', 'Moreno Flores', NULL, 'ARG', 'Pilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'YAMAHA' AND modele_vehicule = 'RAPTOR 700' AND ecurie_vehicule = 'Dragon'));
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Kamil', 'Wisniewski', NULL, 'POL', 'Pilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'YAMAHA' AND modele_vehicule = 'RAPTOR 700' AND ecurie_vehicule = 'Orlen Team'));


    --Camion
    INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Kees', 'Koolen', NULL, 'NLD', 'Pilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'IVECO' AND modele_vehicule = 'POWERSTAR' AND ecurie_vehicule = 'Project 2030'));
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Wouter', 'de Graaff', NULL, 'NLD', 'Copilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'IVECO' AND modele_vehicule = 'POWERSTAR' AND ecurie_vehicule = 'Project 2030'));
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Martin', 'Macik', NULL, 'CZE', 'Pilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'IVECO' AND modele_vehicule = 'POWERSTAR' AND ecurie_vehicule = 'MM Technology'));
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Frantisek', 'Tomasek', NULL, 'CZE', 'Copilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'IVECO' AND modele_vehicule = 'POWERSTAR' AND ecurie_vehicule = 'MM Technology'));
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Janus', 'van Kasteren', NULL, 'NLD', 'Pilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'IVECO' AND modele_vehicule = 'POWESTAR' AND ecurie_vehicule = 'Boss Machinery Team De Rooy Iveco'));
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Darek', 'Rodewald', NULL, 'POL', 'Copilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'IVECO' AND modele_vehicule = 'POWESTAR' AND ecurie_vehicule = 'Boss Machinery Team De Rooy Iveco'));
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Martin', 'Soltys', NULL, 'CZE', 'Pilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'TATRA' AND modele_vehicule = '815' AND ecurie_vehicule = 'Tatra Buggyra ZM Racing'));
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Roman', 'Krejci', NULL, 'CZE', 'Copilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'TATRA' AND modele_vehicule = '815' AND ecurie_vehicule = 'Tatra Buggyra ZM Racing'));
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Victor Willem', 'Versteijnen', NULL, 'NLD', 'Pilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'IVECO' AND modele_vehicule = 'POWERSTAR' AND ecurie_vehicule = 'Boss Machinery Team De Rooy Iveco'));
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Andreas Wilhelm Michiel Marius', 'van der Sande', NULL, 'NLD', 'Copilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'IVECO' AND modele_vehicule = 'POWERSTAR' AND ecurie_vehicule = 'Boss Machinery Team De Rooy Iveco'));

-- Proto Léger
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Francisco', 'Lopez Contardo', NULL, 'CHL', 'Pilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'CAN-AM' AND modele_vehicule = 'XRS' AND ecurie_vehicule = 'RED BULL CAN-AM FACTORY TEAM'));
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Juan Pablo', 'Latrach Vinagre', NULL, 'CHL', 'Copilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'CAN-AM' AND modele_vehicule = 'XRS' AND ecurie_vehicule = 'RED BULL CAN-AM FACTORY TEAM'));
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Seth', 'Quintero', NULL, 'USA', 'Pilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'CAN-AM' AND modele_vehicule = 'MAVERICK' AND ecurie_vehicule = 'RED BULL OFF-ROAD JR TEAM USA BY BFG'));
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Dennis', 'Zenz', NULL, 'DEU', 'Copilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'CAN-AM' AND modele_vehicule = 'MAVERICK' AND ecurie_vehicule = 'RED BULL OFF-ROAD JR TEAM USA BY BFG'));
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Cristina', 'Gutierrez Herrero', NULL, 'ESP', 'Pilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'CAN-AM' AND modele_vehicule = 'CAN-AM' AND ecurie_vehicule = 'RED BULL CAN-AM FACTORY TEAM'));
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Pablo Moreno Huete', 'Gutierrez Herrero', NULL, 'ESP', 'Copilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'CAN-AM' AND modele_vehicule = 'CAN-AM' AND ecurie_vehicule = 'RED BULL CAN-AM FACTORY TEAM'));
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Austin', 'Jones', NULL, 'USA', 'Pilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'CAN-AM' AND modele_vehicule = 'MAVERICK' AND ecurie_vehicule = 'Monster Energy CAN-AM'));
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Gustavo', 'Guglelmin', NULL, 'BRA', 'Copilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'CAN-AM' AND modele_vehicule = 'MAVERICK' AND ecurie_vehicule = 'Monster Energy CAN-AM'));
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Guillaume', 'De Mevius', NULL, 'BEL', 'Pilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'GRALLYTEAM' AND modele_vehicule = 'OT3' AND ecurie_vehicule = 'GRALLYTEAM'));
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Francois', 'Cazalet', NULL, 'FRA', 'Copilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'GRALLYTEAM' AND modele_vehicule = 'OT3' AND ecurie_vehicule = 'GRALLYTEAM'));

--SSV
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Rokas', 'Baciuska', NULL, 'LTU', 'Pilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'CAN-AM' AND modele_vehicule = 'MAVERICK XRS TURBO' AND ecurie_vehicule = 'Red Bull Can-Am Factory Team'));
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Oriol', 'Vidal Montijano', NULL, 'ESP', 'Copilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'CAN-AM' AND modele_vehicule = 'MAVERICK XRS TURBO' AND ecurie_vehicule = 'Red Bull Can-Am Factory Team'));
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Marek', 'Goczal', NULL, 'POL', 'Pilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'CAN-AM' AND modele_vehicule = 'MAVERICK XRS TURBO 01' AND ecurie_vehicule = 'Energy landia Rally Team'));
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Maciej', 'Marton', NULL, 'POL', 'Copilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'CAN-AM' AND modele_vehicule = 'MAVERICK XRS TURBO 01' AND ecurie_vehicule = 'Energy landia Rally Team'));
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Gerard', 'Farres Guell', NULL, 'ESP', 'Pilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'CAN-AM' AND modele_vehicule = '²MAVERICK XRS TURBO' AND ecurie_vehicule = 'South Racing Can-Am'));
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Diego', 'Ortega Gil', NULL, 'ESP', 'Copilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'CAN-AM' AND modele_vehicule = 'MAVERICK XRS TURBO' AND ecurie_vehicule = 'South Racing Can-Am'));
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Michal', 'Goczal', NULL, 'POL', 'Pilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'CAN-AM' AND modele_vehicule = 'MAVERICK XRS TURBO 02' AND ecurie_vehicule = 'Energy landia Rally Team'));
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Szymon', 'Gospodarczy', NULL, 'POL', 'Copilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'CAN-AM' AND modele_vehicule = 'MAVERICK XRS TURBO 02' AND ecurie_vehicule = 'Energy landia Rally Team'));
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Rodrigo', 'Luppi De Oliveira', NULL, 'BRA', 'Pilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'CAN-AM' AND modele_vehicule = 'MAVERICK XRS TURBO 03' AND ecurie_vehicule = 'South Racing Can-Am'));
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Maykel', 'Justo', NULL, 'BRA', 'Copilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'CAN-AM' AND modele_vehicule = 'MAVERICK XRS TURBO 03' AND ecurie_vehicule = 'South Racing Can-Am'));

-- Classic
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Serge', 'Mogno', NULL, 'FRA', 'Pilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'IVECO' AND modele_vehicule = 'POWERSTAR' AND ecurie_vehicule = 'Project 2030'));
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Florent', 'Drulhon', NULL, 'FRA', 'Copilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'IVECO' AND modele_vehicule = 'POWERSTAR' AND ecurie_vehicule = 'Project 2030'));
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Jerome', 'Galpin', NULL, 'FRA', 'Pilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'IVECO' AND modele_vehicule = 'POWERSTAR' AND ecurie_vehicule = 'MM Technology'));
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Anne', 'Galpin', NULL, 'FRA', 'Copilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'IVECO' AND modele_vehicule = 'POWERSTAR' AND ecurie_vehicule = 'MM Technology'));
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Kilian', 'Revuelta', NULL, 'ESP', 'Pilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'IVECO' AND modele_vehicule = 'POWESTAR' AND ecurie_vehicule = 'Boss Machinery Team De Rooy Iveco'));
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Montamarta', 'Mercedes', NULL, 'ESP', 'Copilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'IVECO' AND modele_vehicule = 'POWESTAR' AND ecurie_vehicule = 'Boss Machinery Team De Rooy Iveco'));
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Carlos', 'Santaolalla', NULL, 'ESP', 'Pilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'TATRA' AND modele_vehicule = '815' AND ecurie_vehicule = 'Tatra Buggyra ZM Racing'));
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Sol I Juanola', 'Aran', NULL, 'ESP', 'Copilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'TATRA' AND modele_vehicule = '815' AND ecurie_vehicule = 'Tatra Buggyra ZM Racing'));
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Nicola', 'Feryn', NULL, 'BEL', 'Pilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'IVECO' AND modele_vehicule = 'POWERSTAR' AND ecurie_vehicule = 'Boss Machinery Team De Rooy Iveco'));
INSERT INTO P04_participant (prenom_participant, nom_participant, age_participant, nationalite_participant, role_participant, id_vehicule) VALUES
    ('Kurt', 'Keysers', NULL, 'BEL', 'Copilote', (SELECT id_vehicule FROM P04_vehicule WHERE marque_vehicule = 'IVECO' AND modele_vehicule = 'POWERSTAR' AND ecurie_vehicule = 'Boss Machinery Team De Rooy Iveco'));


-- alimentation de P04_etape
INSERT INTO P04_etape(nom_etape, date_depart, date_arrivee) VALUES ('Sea Camp - Sea Camp', TO_DATE('2022-12-31', 'YYYY-MM-DD'), TO_DATE('2022-12-31', 'YYYY-MM-DD'));
INSERT INTO P04_etape(nom_etape, date_depart, date_arrivee) VALUES ('Sea Camp - Sea Camp', TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2023-01-01', 'YYYY-MM-DD'));
INSERT INTO P04_etape(nom_etape, date_depart, date_arrivee) VALUES ('Sea Camp - Al-Ula', TO_DATE('2023-01-02', 'YYYY-MM-DD'), TO_DATE('2023-01-02', 'YYYY-MM-DD'));
INSERT INTO P04_etape(nom_etape, date_depart, date_arrivee) VALUES ('Al-Ula - Haïl', TO_DATE('2023-01-03', 'YYYY-MM-DD'), TO_DATE('2023-01-03', 'YYYY-MM-DD'));
INSERT INTO P04_etape(nom_etape, date_depart, date_arrivee) VALUES ('Haïl - Haïl', TO_DATE('2023-01-04', 'YYYY-MM-DD'), TO_DATE('2023-01-04', 'YYYY-MM-DD'));
INSERT INTO P04_etape(nom_etape, date_depart, date_arrivee) VALUES ('Haïl - Haïl', TO_DATE('2023-01-05', 'YYYY-MM-DD'), TO_DATE('2023-01-05', 'YYYY-MM-DD'));
INSERT INTO P04_etape(nom_etape, date_depart, date_arrivee) VALUES ('Haïl - Riyad', TO_DATE('2023-01-06', 'YYYY-MM-DD'), TO_DATE('2023-01-06', 'YYYY-MM-DD'));
INSERT INTO P04_etape(nom_etape, date_depart, date_arrivee) VALUES ('Riyad - Al-Duwadmi', TO_DATE('2023-01-07', 'YYYY-MM-DD'), TO_DATE('2023-01-07', 'YYYY-MM-DD'));
INSERT INTO P04_etape(nom_etape, date_depart, date_arrivee) VALUES ('Al-Duwadmi - Riyad', TO_DATE('2023-01-08', 'YYYY-MM-DD'), TO_DATE('2023-01-08', 'YYYY-MM-DD'));
INSERT INTO P04_etape(nom_etape, date_depart, date_arrivee) VALUES ('Riyad - Harad', TO_DATE('2023-01-10', 'YYYY-MM-DD'), TO_DATE('2023-01-10', 'YYYY-MM-DD'));
INSERT INTO P04_etape(nom_etape, date_depart, date_arrivee) VALUES ('Harad - Shayba', TO_DATE('2023-01-11', 'YYYY-MM-DD'), TO_DATE('2023-01-11', 'YYYY-MM-DD'));
INSERT INTO P04_etape(nom_etape, date_depart, date_arrivee) VALUES ('Shayba - Empty Quarter Marathon', TO_DATE('2023-01-12', 'YYYY-MM-DD'), TO_DATE('2023-01-12', 'YYYY-MM-DD'));
INSERT INTO P04_etape(nom_etape, date_depart, date_arrivee) VALUES ('Empty Quarter Marathon - Shayba', TO_DATE('2023-01-13', 'YYYY-MM-DD'), TO_DATE('2023-01-13', 'YYYY-MM-DD'));
INSERT INTO P04_etape(nom_etape, date_depart, date_arrivee) VALUES ('Shayba - Al-Hufuf', TO_DATE('2023-01-14', 'YYYY-MM-DD'), TO_DATE('2023-01-14', 'YYYY-MM-DD'));
INSERT INTO P04_etape(nom_etape, date_depart, date_arrivee) VALUES ('Al-Hufuf - Dammam', TO_DATE('2023-01-15', 'YYYY-MM-DD'), TO_DATE('2023-01-15', 'YYYY-MM-DD'));


-- alimentation de P04_speciale
INSERT INTO P04_speciale (nom_speciale, distance_speciale, id_etape) VALUES
    ('Sea Camp - Sea Camp', 11, (SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')));

INSERT INTO P04_speciale (nom_speciale, distance_speciale, id_etape) VALUES
    ('Sea Camp - Sea Camp', 603, (SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee =TO_DATE('2023-01-01', 'YYYY-MM-DD')));

INSERT INTO P04_speciale (nom_speciale, distance_speciale, id_etape) VALUES
    ('Sea Camp - Al-Ula', 589, (SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee =TO_DATE('2023-01-02', 'YYYY-MM-DD')));

INSERT INTO P04_speciale (nom_speciale, distance_speciale, id_etape) VALUES
    ('Al-Ula - Haïl', 669, (SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee =TO_DATE('2023-01-03', 'YYYY-MM-DD')));

INSERT INTO P04_speciale (nom_speciale, distance_speciale, id_etape) VALUES
    ('Haïl - Haïl', 574, (SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee =TO_DATE('2023-01-04', 'YYYY-MM-DD')));

INSERT INTO P04_speciale (nom_speciale, distance_speciale, id_etape) VALUES
    ('Haïl - Haïl', 645, (SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee =TO_DATE('2023-01-05', 'YYYY-MM-DD')));

INSERT INTO P04_speciale (nom_speciale, distance_speciale, id_etape) VALUES
    ('Haïl - Riyad', 918, (SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee =TO_DATE('2023-01-06', 'YYYY-MM-DD')));

INSERT INTO P04_speciale (nom_speciale, distance_speciale, id_etape) VALUES
    ('Riyad - Al-Duwadmi', 861, (SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee =TO_DATE('2023-01-07', 'YYYY-MM-DD')));

INSERT INTO P04_speciale (nom_speciale, distance_speciale, id_etape) VALUES
    ('Al-Duwadmi - Riyad', 823, (SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee =TO_DATE('2023-01-08', 'YYYY-MM-DD')));

INSERT INTO P04_speciale (nom_speciale, distance_speciale, id_etape) VALUES
    ('Riyad - Harad', 686, (SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee =TO_DATE('2023-01-10', 'YYYY-MM-DD')));

INSERT INTO P04_speciale (nom_speciale, distance_speciale, id_etape) VALUES
    ('Harad - Shayba', 624, (SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee =TO_DATE('2023-01-11', 'YYYY-MM-DD')));

INSERT INTO P04_speciale (nom_speciale, distance_speciale, id_etape) VALUES
    ('Shayba - Empty Quarter Marathon', 428, (SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee =TO_DATE('2023-01-12', 'YYYY-MM-DD')));

INSERT INTO P04_speciale (nom_speciale, distance_speciale, id_etape) VALUES
    ('Empty Quarter Marathon - Shayba', 375, (SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee =TO_DATE('2023-01-13', 'YYYY-MM-DD')));

INSERT INTO P04_speciale (nom_speciale, distance_speciale, id_etape) VALUES
    ('Shayba - Al-Hufuf', 676, (SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee =TO_DATE('2023-01-14', 'YYYY-MM-DD')));

INSERT INTO P04_speciale (nom_speciale, distance_speciale, id_etape) VALUES
    ('Al-Hufuf - Dammam', 417, (SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee =TO_DATE('2023-01-15', 'YYYY-MM-DD')));


-- alimentation de P04_resultat
INSERT ALL
    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE nom_participant = 'Sunderland' AND prenom_participant = 'Sam' AND nationalite_participant = 'GBR'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE nom_participant = 'Sunderland' AND prenom_participant = 'Sam' AND nationalite_participant = 'GBR'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE nom_participant = 'Sunderland' AND prenom_participant = 'Sam' AND nationalite_participant = 'GBR'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE nom_participant = 'Sunderland' AND prenom_participant = 'Sam' AND nationalite_participant = 'GBR'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE nom_participant = 'Sunderland' AND prenom_participant = 'Sam' AND nationalite_participant = 'GBR'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE nom_participant = 'Sunderland' AND prenom_participant = 'Sam' AND nationalite_participant = 'GBR'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE nom_participant = 'Sunderland' AND prenom_participant = 'Sam' AND nationalite_participant = 'GBR'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE nom_participant = 'Sunderland' AND prenom_participant = 'Sam' AND nationalite_participant = 'GBR'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE nom_participant = 'Sunderland' AND prenom_participant = 'Sam' AND nationalite_participant = 'GBR'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE nom_participant = 'Sunderland' AND prenom_participant = 'Sam' AND nationalite_participant = 'GBR'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE nom_participant = 'Sunderland' AND prenom_participant = 'Sam' AND nationalite_participant = 'GBR'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE nom_participant = 'Sunderland' AND prenom_participant = 'Sam' AND nationalite_participant = 'GBR'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE nom_participant = 'Sunderland' AND prenom_participant = 'Sam' AND nationalite_participant = 'GBR'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE nom_participant = 'Sunderland' AND prenom_participant = 'Sam' AND nationalite_participant = 'GBR'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE nom_participant = 'Sunderland' AND prenom_participant = 'Sam' AND nationalite_participant = 'GBR'))

    -- Ricky Barbec
     -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Ricky' AND nom_participant = 'Brabec' AND nationalite_participant = 'USA'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Ricky' AND nom_participant = 'Brabec' AND nationalite_participant = 'USA'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Ricky' AND nom_participant = 'Brabec' AND nationalite_participant = 'USA'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Ricky' AND nom_participant = 'Brabec' AND nationalite_participant = 'USA'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Ricky' AND nom_participant = 'Brabec' AND nationalite_participant = 'USA'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Ricky' AND nom_participant = 'Brabec' AND nationalite_participant = 'USA'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Ricky' AND nom_participant = 'Brabec' AND nationalite_participant = 'USA'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Ricky' AND nom_participant = 'Brabec' AND nationalite_participant = 'USA'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Ricky' AND nom_participant = 'Brabec' AND nationalite_participant = 'USA'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Ricky' AND nom_participant = 'Brabec' AND nationalite_participant = 'USA'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Ricky' AND nom_participant = 'Brabec' AND nationalite_participant = 'USA'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Ricky' AND nom_participant = 'Brabec' AND nationalite_participant = 'USA'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Ricky' AND nom_participant = 'Brabec' AND nationalite_participant = 'USA'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Ricky' AND nom_participant = 'Brabec' AND nationalite_participant = 'USA'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Ricky' AND nom_participant = 'Brabec' AND nationalite_participant = 'USA'))

    -- Joan Barreda Bort
     -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Joan' AND nom_participant = 'Barreda Bort' AND nationalite_participant = 'ESP'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Joan' AND nom_participant = 'Barreda Bort' AND nationalite_participant = 'ESP'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Joan' AND nom_participant = 'Barreda Bort' AND nationalite_participant = 'ESP'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Joan' AND nom_participant = 'Barreda Bort' AND nationalite_participant = 'ESP'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Joan' AND nom_participant = 'Barreda Bort' AND nationalite_participant = 'ESP'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Joan' AND nom_participant = 'Barreda Bort' AND nationalite_participant = 'ESP'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Joan' AND nom_participant = 'Barreda Bort' AND nationalite_participant = 'ESP'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Joan' AND nom_participant = 'Barreda Bort' AND nationalite_participant = 'ESP'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Joan' AND nom_participant = 'Barreda Bort' AND nationalite_participant = 'ESP'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Joan' AND nom_participant = 'Barreda Bort' AND nationalite_participant = 'ESP'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Joan' AND nom_participant = 'Barreda Bort' AND nationalite_participant = 'ESP'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Joan' AND nom_participant = 'Barreda Bort' AND nationalite_participant = 'ESP'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Joan' AND nom_participant = 'Barreda Bort' AND nationalite_participant = 'ESP'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Joan' AND nom_participant = 'Barreda Bort' AND nationalite_participant = 'ESP'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Joan' AND nom_participant = 'Barreda Bort' AND nationalite_participant = 'ESP'))

    -- Pablo Quintanilla
    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Pablo' AND nom_participant = 'Quintanilla' AND nationalite_participant = 'CHL'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Pablo' AND nom_participant = 'Quintanilla' AND nationalite_participant = 'CHL'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Pablo' AND nom_participant = 'Quintanilla' AND nationalite_participant = 'CHL'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Pablo' AND nom_participant = 'Quintanilla' AND nationalite_participant = 'CHL'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Pablo' AND nom_participant = 'Quintanilla' AND nationalite_participant = 'CHL'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Pablo' AND nom_participant = 'Quintanilla' AND nationalite_participant = 'CHL'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Pablo' AND nom_participant = 'Quintanilla' AND nationalite_participant = 'CHL'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Pablo' AND nom_participant = 'Quintanilla' AND nationalite_participant = 'CHL'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Pablo' AND nom_participant = 'Quintanilla' AND nationalite_participant = 'CHL'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Pablo' AND nom_participant = 'Quintanilla' AND nationalite_participant = 'CHL'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Pablo' AND nom_participant = 'Quintanilla' AND nationalite_participant = 'CHL'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Pablo' AND nom_participant = 'Quintanilla' AND nationalite_participant = 'CHL'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Pablo' AND nom_participant = 'Quintanilla' AND nationalite_participant = 'CHL'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Pablo' AND nom_participant = 'Quintanilla' AND nationalite_participant = 'CHL'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Pablo' AND nom_participant = 'Quintanilla' AND nationalite_participant = 'CHL'))

    -- Toby Price
    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Toby' AND nom_participant = 'Price' AND nationalite_participant = 'AUS'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Toby' AND nom_participant = 'Price' AND nationalite_participant = 'AUS'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Toby' AND nom_participant = 'Price' AND nationalite_participant = 'AUS'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Toby' AND nom_participant = 'Price' AND nationalite_participant = 'AUS'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Toby' AND nom_participant = 'Price' AND nationalite_participant = 'AUS'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Toby' AND nom_participant = 'Price' AND nationalite_participant = 'AUS'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Toby' AND nom_participant = 'Price' AND nationalite_participant = 'AUS'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Toby' AND nom_participant = 'Price' AND nationalite_participant = 'AUS'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Toby' AND nom_participant = 'Price' AND nationalite_participant = 'AUS'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Toby' AND nom_participant = 'Price' AND nationalite_participant = 'AUS'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Toby' AND nom_participant = 'Price' AND nationalite_participant = 'AUS'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Toby' AND nom_participant = 'Price' AND nationalite_participant = 'AUS'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Toby' AND nom_participant = 'Price' AND nationalite_participant = 'AUS'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Toby' AND nom_participant = 'Price' AND nationalite_participant = 'AUS'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Toby' AND nom_participant = 'Price' AND nationalite_participant = 'AUS'))

    -- Nasser Al-Attiya
     -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Nasser' AND nom_participant = 'Al-Attiyah' AND nationalite_participant = 'QAT'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Nasser' AND nom_participant = 'Al-Attiyah' AND nationalite_participant = 'QAT'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Nasser' AND nom_participant = 'Al-Attiyah' AND nationalite_participant = 'QAT'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Nasser' AND nom_participant = 'Al-Attiyah' AND nationalite_participant = 'QAT'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Nasser' AND nom_participant = 'Al-Attiyah' AND nationalite_participant = 'QAT'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Nasser' AND nom_participant = 'Al-Attiyah' AND nationalite_participant = 'QAT'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Nasser' AND nom_participant = 'Al-Attiyah' AND nationalite_participant = 'QAT'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Nasser' AND nom_participant = 'Al-Attiyah' AND nationalite_participant = 'QAT'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Nasser' AND nom_participant = 'Al-Attiyah' AND nationalite_participant = 'QAT'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Nasser' AND nom_participant = 'Al-Attiyah' AND nationalite_participant = 'QAT'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Nasser' AND nom_participant = 'Al-Attiyah' AND nationalite_participant = 'QAT'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Nasser' AND nom_participant = 'Al-Attiyah' AND nationalite_participant = 'QAT'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Nasser' AND nom_participant = 'Al-Attiyah' AND nationalite_participant = 'QAT'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Nasser' AND nom_participant = 'Al-Attiyah' AND nationalite_participant = 'QAT'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Nasser' AND nom_participant = 'Al-Attiyah' AND nationalite_participant = 'QAT'))

    -- Mathieu Baumel
    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Mathieu' AND nom_participant = 'Baumel' AND nationalite_participant = 'FRA'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Mathieu' AND nom_participant = 'Baumel' AND nationalite_participant = 'FRA'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Mathieu' AND nom_participant = 'Baumel' AND nationalite_participant = 'FRA'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Mathieu' AND nom_participant = 'Baumel' AND nationalite_participant = 'FRA'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Mathieu' AND nom_participant = 'Baumel' AND nationalite_participant = 'FRA'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Mathieu' AND nom_participant = 'Baumel' AND nationalite_participant = 'FRA'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Mathieu' AND nom_participant = 'Baumel' AND nationalite_participant = 'FRA'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Mathieu' AND nom_participant = 'Baumel' AND nationalite_participant = 'FRA'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Mathieu' AND nom_participant = 'Baumel' AND nationalite_participant = 'FRA'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Mathieu' AND nom_participant = 'Baumel' AND nationalite_participant = 'FRA'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Mathieu' AND nom_participant = 'Baumel' AND nationalite_participant = 'FRA'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Mathieu' AND nom_participant = 'Baumel' AND nationalite_participant = 'FRA'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Mathieu' AND nom_participant = 'Baumel' AND nationalite_participant = 'FRA'))
    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Mathieu' AND nom_participant = 'Baumel' AND nationalite_participant = 'FRA'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Mathieu' AND nom_participant = 'Baumel' AND nationalite_participant = 'FRA'))

    -- Sebastien Loeb
    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Sebastien' AND nom_participant = 'Loeb' AND nationalite_participant = 'FRA'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Sebastien' AND nom_participant = 'Loeb' AND nationalite_participant = 'FRA'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Sebastien' AND nom_participant = 'Loeb' AND nationalite_participant = 'FRA'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Sebastien' AND nom_participant = 'Loeb' AND nationalite_participant = 'FRA'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Sebastien' AND nom_participant = 'Loeb' AND nationalite_participant = 'FRA'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Sebastien' AND nom_participant = 'Loeb' AND nationalite_participant = 'FRA'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Sebastien' AND nom_participant = 'Loeb' AND nationalite_participant = 'FRA'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Sebastien' AND nom_participant = 'Loeb' AND nationalite_participant = 'FRA'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Sebastien' AND nom_participant = 'Loeb' AND nationalite_participant = 'FRA'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Sebastien' AND nom_participant = 'Loeb' AND nationalite_participant = 'FRA'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Sebastien' AND nom_participant = 'Loeb' AND nationalite_participant = 'FRA'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Sebastien' AND nom_participant = 'Loeb' AND nationalite_participant = 'FRA'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Sebastien' AND nom_participant = 'Loeb' AND nationalite_participant = 'FRA'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Sebastien' AND nom_participant = 'Loeb' AND nationalite_participant = 'FRA'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Sebastien' AND nom_participant = 'Loeb' AND nationalite_participant = 'FRA'))

    -- Fabian Lurquin
    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Fabian' AND nom_participant = 'Lurquin' AND nationalite_participant = 'BEL'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Fabian' AND nom_participant = 'Lurquin' AND nationalite_participant = 'BEL'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Fabian' AND nom_participant = 'Lurquin' AND nationalite_participant = 'BEL'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Fabian' AND nom_participant = 'Lurquin' AND nationalite_participant = 'BEL'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Fabian' AND nom_participant = 'Lurquin' AND nationalite_participant = 'BEL'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Fabian' AND nom_participant = 'Lurquin' AND nationalite_participant = 'BEL'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Fabian' AND nom_participant = 'Lurquin' AND nationalite_participant = 'BEL'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Fabian' AND nom_participant = 'Lurquin' AND nationalite_participant = 'BEL'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Fabian' AND nom_participant = 'Lurquin' AND nationalite_participant = 'BEL'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Fabian' AND nom_participant = 'Lurquin' AND nationalite_participant = 'BEL'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Fabian' AND nom_participant = 'Lurquin' AND nationalite_participant = 'BEL'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Fabian' AND nom_participant = 'Lurquin' AND nationalite_participant = 'BEL'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Fabian' AND nom_participant = 'Lurquin' AND nationalite_participant = 'BEL'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Fabian' AND nom_participant = 'Lurquin' AND nationalite_participant = 'BEL'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Fabian' AND nom_participant = 'Lurquin' AND nationalite_participant = 'BEL'))

    -- Yazeed Al Rajhi
    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Yazeed' AND nom_participant = 'Al Rajhi' AND nationalite_participant = 'SAU'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Yazeed' AND nom_participant = 'Al Rajhi' AND nationalite_participant = 'SAU'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Yazeed' AND nom_participant = 'Al Rajhi' AND nationalite_participant = 'SAU'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Yazeed' AND nom_participant = 'Al Rajhi' AND nationalite_participant = 'SAU'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Yazeed' AND nom_participant = 'Al Rajhi' AND nationalite_participant = 'SAU'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Yazeed' AND nom_participant = 'Al Rajhi' AND nationalite_participant = 'SAU'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Yazeed' AND nom_participant = 'Al Rajhi' AND nationalite_participant = 'SAU'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Yazeed' AND nom_participant = 'Al Rajhi' AND nationalite_participant = 'SAU'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Yazeed' AND nom_participant = 'Al Rajhi' AND nationalite_participant = 'SAU'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Yazeed' AND nom_participant = 'Al Rajhi' AND nationalite_participant = 'SAU'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Yazeed' AND nom_participant = 'Al Rajhi' AND nationalite_participant = 'SAU'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Yazeed' AND nom_participant = 'Al Rajhi' AND nationalite_participant = 'SAU'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Yazeed' AND nom_participant = 'Al Rajhi' AND nationalite_participant = 'SAU'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Yazeed' AND nom_participant = 'Al Rajhi' AND nationalite_participant = 'SAU'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Yazeed' AND nom_participant = 'Al Rajhi' AND nationalite_participant = 'SAU'))

    -- Michael Orr
    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Michael' AND nom_participant = 'Orr' AND nationalite_participant = 'GBR'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Michael' AND nom_participant = 'Orr' AND nationalite_participant = 'GBR'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Michael' AND nom_participant = 'Orr' AND nationalite_participant = 'GBR'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Michael' AND nom_participant = 'Orr' AND nationalite_participant = 'GBR'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Michael' AND nom_participant = 'Orr' AND nationalite_participant = 'GBR'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Michael' AND nom_participant = 'Orr' AND nationalite_participant = 'GBR'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Michael' AND nom_participant = 'Orr' AND nationalite_participant = 'GBR'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Michael' AND nom_participant = 'Orr' AND nationalite_participant = 'GBR'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Michael' AND nom_participant = 'Orr' AND nationalite_participant = 'GBR'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Michael' AND nom_participant = 'Orr' AND nationalite_participant = 'GBR'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Michael' AND nom_participant = 'Orr' AND nationalite_participant = 'GBR'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Michael' AND nom_participant = 'Orr' AND nationalite_participant = 'GBR'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Michael' AND nom_participant = 'Orr' AND nationalite_participant = 'GBR'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Michael' AND nom_participant = 'Orr' AND nationalite_participant = 'GBR'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Michael' AND nom_participant = 'Orr' AND nationalite_participant = 'GBR'))

    -- Jakub Przygonski
    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Jakub' AND nom_participant = 'Przygonski' AND nationalite_participant = 'POL'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Jakub' AND nom_participant = 'Przygonski' AND nationalite_participant = 'POL'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Jakub' AND nom_participant = 'Przygonski' AND nationalite_participant = 'POL'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Jakub' AND nom_participant = 'Przygonski' AND nationalite_participant = 'POL'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Jakub' AND nom_participant = 'Przygonski' AND nationalite_participant = 'POL'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Jakub' AND nom_participant = 'Przygonski' AND nationalite_participant = 'POL'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Jakub' AND nom_participant = 'Przygonski' AND nationalite_participant = 'POL'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Jakub' AND nom_participant = 'Przygonski' AND nationalite_participant = 'POL'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Jakub' AND nom_participant = 'Przygonski' AND nationalite_participant = 'POL'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Jakub' AND nom_participant = 'Przygonski' AND nationalite_participant = 'POL'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Jakub' AND nom_participant = 'Przygonski' AND nationalite_participant = 'POL'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Jakub' AND nom_participant = 'Przygonski' AND nationalite_participant = 'POL'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Jakub' AND nom_participant = 'Przygonski' AND nationalite_participant = 'POL'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Jakub' AND nom_participant = 'Przygonski' AND nationalite_participant = 'POL'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Jakub' AND nom_participant = 'Przygonski' AND nationalite_participant = 'POL'))

    -- Armand Monleon
    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Armand' AND nom_participant = 'Monleon' AND nationalite_participant = 'ESP'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Armand' AND nom_participant = 'Monleon' AND nationalite_participant = 'ESP'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Armand' AND nom_participant = 'Monleon' AND nationalite_participant = 'ESP'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Armand' AND nom_participant = 'Monleon' AND nationalite_participant = 'ESP'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Armand' AND nom_participant = 'Monleon' AND nationalite_participant = 'ESP'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Armand' AND nom_participant = 'Monleon' AND nationalite_participant = 'ESP'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Armand' AND nom_participant = 'Monleon' AND nationalite_participant = 'ESP'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Armand' AND nom_participant = 'Monleon' AND nationalite_participant = 'ESP'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Armand' AND nom_participant = 'Monleon' AND nationalite_participant = 'ESP'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Armand' AND nom_participant = 'Monleon' AND nationalite_participant = 'ESP'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Armand' AND nom_participant = 'Monleon' AND nationalite_participant = 'ESP'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Armand' AND nom_participant = 'Monleon' AND nationalite_participant = 'ESP'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Armand' AND nom_participant = 'Monleon' AND nationalite_participant = 'ESP'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Armand' AND nom_participant = 'Monleon' AND nationalite_participant = 'ESP'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Armand' AND nom_participant = 'Monleon' AND nationalite_participant = 'ESP'))

    -- Stephane Peterhansel
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Stéphane' AND nom_participant = 'Peterhansel' AND nationalite_participant = 'FRA'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Stéphane' AND nom_participant = 'Peterhansel' AND nationalite_participant = 'FRA'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Stéphane' AND nom_participant = 'Peterhansel' AND nationalite_participant = 'FRA'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Stéphane' AND nom_participant = 'Peterhansel' AND nationalite_participant = 'FRA'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Stéphane' AND nom_participant = 'Peterhansel' AND nationalite_participant = 'FRA'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Stéphane' AND nom_participant = 'Peterhansel' AND nationalite_participant = 'FRA'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Stéphane' AND nom_participant = 'Peterhansel' AND nationalite_participant = 'FRA'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Stéphane' AND nom_participant = 'Peterhansel' AND nationalite_participant = 'FRA'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Stéphane' AND nom_participant = 'Peterhansel' AND nationalite_participant = 'FRA'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Stéphane' AND nom_participant = 'Peterhansel' AND nationalite_participant = 'FRA'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Stéphane' AND nom_participant = 'Peterhansel' AND nationalite_participant = 'FRA'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Stéphane' AND nom_participant = 'Peterhansel' AND nationalite_participant = 'FRA'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Stéphane' AND nom_participant = 'Peterhansel' AND nationalite_participant = 'FRA'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Stéphane' AND nom_participant = 'Peterhansel' AND nationalite_participant = 'FRA'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Stéphane' AND nom_participant = 'Peterhansel' AND nationalite_participant = 'FRA'))

    -- Edouard Boulanger
    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Edouard' AND nom_participant = 'Boulanger' AND nationalite_participant = 'FRA'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Edouard' AND nom_participant = 'Boulanger' AND nationalite_participant = 'FRA'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Edouard' AND nom_participant = 'Boulanger' AND nationalite_participant = 'FRA'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Edouard' AND nom_participant = 'Boulanger' AND nationalite_participant = 'FRA'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Edouard' AND nom_participant = 'Boulanger' AND nationalite_participant = 'FRA'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Edouard' AND nom_participant = 'Boulanger' AND nationalite_participant = 'FRA'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Edouard' AND nom_participant = 'Boulanger' AND nationalite_participant = 'FRA'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Edouard' AND nom_participant = 'Boulanger' AND nationalite_participant = 'FRA'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Edouard' AND nom_participant = 'Boulanger' AND nationalite_participant = 'FRA'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Edouard' AND nom_participant = 'Boulanger' AND nationalite_participant = 'FRA'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Edouard' AND nom_participant = 'Boulanger' AND nationalite_participant = 'FRA'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Edouard' AND nom_participant = 'Boulanger' AND nationalite_participant = 'FRA'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Edouard' AND nom_participant = 'Boulanger' AND nationalite_participant = 'FRA'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Edouard' AND nom_participant = 'Boulanger' AND nationalite_participant = 'FRA'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Edouard' AND nom_participant = 'Boulanger' AND nationalite_participant = 'FRA'))

    -- Alexandre Giroud
    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Alexandre' AND nom_participant = 'Giroud' AND nationalite_participant = 'FRA'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Alexandre' AND nom_participant = 'Giroud' AND nationalite_participant = 'FRA'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Alexandre' AND nom_participant = 'Giroud' AND nationalite_participant = 'FRA'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Alexandre' AND nom_participant = 'Giroud' AND nationalite_participant = 'FRA'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Alexandre' AND nom_participant = 'Giroud' AND nationalite_participant = 'FRA'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Alexandre' AND nom_participant = 'Giroud' AND nationalite_participant = 'FRA'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Alexandre' AND nom_participant = 'Giroud' AND nationalite_participant = 'FRA'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Alexandre' AND nom_participant = 'Giroud' AND nationalite_participant = 'FRA'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Alexandre' AND nom_participant = 'Giroud' AND nationalite_participant = 'FRA'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Alexandre' AND nom_participant = 'Giroud' AND nationalite_participant = 'FRA'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Alexandre' AND nom_participant = 'Giroud' AND nationalite_participant = 'FRA'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Alexandre' AND nom_participant = 'Giroud' AND nationalite_participant = 'FRA'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Alexandre' AND nom_participant = 'Giroud' AND nationalite_participant = 'FRA'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Alexandre' AND nom_participant = 'Giroud' AND nationalite_participant = 'FRA'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Alexandre' AND nom_participant = 'Giroud' AND nationalite_participant = 'FRA'))

    -- Manuel Andujar
    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Manuel' AND nom_participant = 'Andujar' AND nationalite_participant = 'ARG'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Manuel' AND nom_participant = 'Andujar' AND nationalite_participant = 'ARG'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Manuel' AND nom_participant = 'Andujar' AND nationalite_participant = 'ARG'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Manuel' AND nom_participant = 'Andujar' AND nationalite_participant = 'ARG'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Manuel' AND nom_participant = 'Andujar' AND nationalite_participant = 'ARG'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Manuel' AND nom_participant = 'Andujar' AND nationalite_participant = 'ARG'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Manuel' AND nom_participant = 'Andujar' AND nationalite_participant = 'ARG'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Manuel' AND nom_participant = 'Andujar' AND nationalite_participant = 'ARG'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Manuel' AND nom_participant = 'Andujar' AND nationalite_participant = 'ARG'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Manuel' AND nom_participant = 'Andujar' AND nationalite_participant = 'ARG'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Manuel' AND nom_participant = 'Andujar' AND nationalite_participant = 'ARG'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Manuel' AND nom_participant = 'Andujar' AND nationalite_participant = 'ARG'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Manuel' AND nom_participant = 'Andujar' AND nationalite_participant = 'ARG'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Manuel' AND nom_participant = 'Andujar' AND nationalite_participant = 'ARG'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Manuel' AND nom_participant = 'Andujar' AND nationalite_participant = 'ARG'))

    -- Juraj Varga
    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Juraj' AND nom_participant = 'Varga' AND nationalite_participant = 'SVK'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Juraj' AND nom_participant = 'Varga' AND nationalite_participant = 'SVK'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Juraj' AND nom_participant = 'Varga' AND nationalite_participant = 'SVK'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Juraj' AND nom_participant = 'Varga' AND nationalite_participant = 'SVK'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Juraj' AND nom_participant = 'Varga' AND nationalite_participant = 'SVK'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Juraj' AND nom_participant = 'Varga' AND nationalite_participant = 'SVK'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Juraj' AND nom_participant = 'Varga' AND nationalite_participant = 'SVK'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Juraj' AND nom_participant = 'Varga' AND nationalite_participant = 'SVK'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Juraj' AND nom_participant = 'Varga' AND nationalite_participant = 'SVK'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Juraj' AND nom_participant = 'Varga' AND nationalite_participant = 'SVK'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Juraj' AND nom_participant = 'Varga' AND nationalite_participant = 'SVK'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Juraj' AND nom_participant = 'Varga' AND nationalite_participant = 'SVK'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Juraj' AND nom_participant = 'Varga' AND nationalite_participant = 'SVK'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Juraj' AND nom_participant = 'Varga' AND nationalite_participant = 'SVK'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Juraj' AND nom_participant = 'Varga' AND nationalite_participant = 'SVK'))

    -- Francisco Moreno Flores
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Francisco' AND nom_participant = 'Lopez Contardo' AND nationalite_participant = 'CHL'))

    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Francisco' AND nom_participant = 'Moreno Flores' AND nationalite_participant = 'ARG'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Francisco' AND nom_participant = 'Moreno Flores' AND nationalite_participant = 'ARG'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Francisco' AND nom_participant = 'Moreno Flores' AND nationalite_participant = 'ARG'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Francisco' AND nom_participant = 'Moreno Flores' AND nationalite_participant = 'ARG'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Francisco' AND nom_participant = 'Moreno Flores' AND nationalite_participant = 'ARG'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Francisco' AND nom_participant = 'Moreno Flores' AND nationalite_participant = 'ARG'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Francisco' AND nom_participant = 'Moreno Flores' AND nationalite_participant = 'ARG'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Francisco' AND nom_participant = 'Moreno Flores' AND nationalite_participant = 'ARG'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Francisco' AND nom_participant = 'Moreno Flores' AND nationalite_participant = 'ARG'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Francisco' AND nom_participant = 'Moreno Flores' AND nationalite_participant = 'ARG'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Francisco' AND nom_participant = 'Moreno Flores' AND nationalite_participant = 'ARG'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Francisco' AND nom_participant = 'Moreno Flores' AND nationalite_participant = 'ARG'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Francisco' AND nom_participant = 'Moreno Flores' AND nationalite_participant = 'ARG'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Francisco' AND nom_participant = 'Moreno Flores' AND nationalite_participant = 'ARG'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Francisco' AND nom_participant = 'Moreno Flores' AND nationalite_participant = 'ARG'))

    -- Kamil Wisniewski
    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kamil' AND nom_participant = 'Wisniewski' AND nationalite_participant = 'POL'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kamil' AND nom_participant = 'Wisniewski' AND nationalite_participant = 'POL'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kamil' AND nom_participant = 'Wisniewski' AND nationalite_participant = 'POL'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kamil' AND nom_participant = 'Wisniewski' AND nationalite_participant = 'POL'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kamil' AND nom_participant = 'Wisniewski' AND nationalite_participant = 'POL'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kamil' AND nom_participant = 'Wisniewski' AND nationalite_participant = 'POL'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kamil' AND nom_participant = 'Wisniewski' AND nationalite_participant = 'POL'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kamil' AND nom_participant = 'Wisniewski' AND nationalite_participant = 'POL'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kamil' AND nom_participant = 'Wisniewski' AND nationalite_participant = 'POL'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kamil' AND nom_participant = 'Wisniewski' AND nationalite_participant = 'POL'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kamil' AND nom_participant = 'Wisniewski' AND nationalite_participant = 'POL'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kamil' AND nom_participant = 'Wisniewski' AND nationalite_participant = 'POL'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kamil' AND nom_participant = 'Wisniewski' AND nationalite_participant = 'POL'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kamil' AND nom_participant = 'Wisniewski' AND nationalite_participant = 'POL'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kamil' AND nom_participant = 'Wisniewski' AND nationalite_participant = 'POL'))

    -- Kees Koolen
    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kees' AND nom_participant = 'Koolen' AND nationalite_participant = 'NLD'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kees' AND nom_participant = 'Koolen' AND nationalite_participant = 'NLD'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kees' AND nom_participant = 'Koolen' AND nationalite_participant = 'NLD'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kees' AND nom_participant = 'Koolen' AND nationalite_participant = 'NLD'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kees' AND nom_participant = 'Koolen' AND nationalite_participant = 'NLD'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kees' AND nom_participant = 'Koolen' AND nationalite_participant = 'NLD'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kees' AND nom_participant = 'Koolen' AND nationalite_participant = 'NLD'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kees' AND nom_participant = 'Koolen' AND nationalite_participant = 'NLD'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kees' AND nom_participant = 'Koolen' AND nationalite_participant = 'NLD'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kees' AND nom_participant = 'Koolen' AND nationalite_participant = 'NLD'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kees' AND nom_participant = 'Koolen' AND nationalite_participant = 'NLD'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kees' AND nom_participant = 'Koolen' AND nationalite_participant = 'NLD'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kees' AND nom_participant = 'Koolen' AND nationalite_participant = 'NLD'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kees' AND nom_participant = 'Koolen' AND nationalite_participant = 'NLD'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kees' AND nom_participant = 'Koolen' AND nationalite_participant = 'NLD'))

    -- Wooter de Graaf
    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Wouter' AND nom_participant = 'de Graaff' AND nationalite_participant = 'NLD'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Wouter' AND nom_participant = 'de Graaff' AND nationalite_participant = 'NLD'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Wouter' AND nom_participant = 'de Graaff' AND nationalite_participant = 'NLD'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Wouter' AND nom_participant = 'de Graaff' AND nationalite_participant = 'NLD'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Wouter' AND nom_participant = 'de Graaff' AND nationalite_participant = 'NLD'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Wouter' AND nom_participant = 'de Graaff' AND nationalite_participant = 'NLD'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Wouter' AND nom_participant = 'de Graaff' AND nationalite_participant = 'NLD'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Wouter' AND nom_participant = 'de Graaff' AND nationalite_participant = 'NLD'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Wouter' AND nom_participant = 'de Graaff' AND nationalite_participant = 'NLD'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Wouter' AND nom_participant = 'de Graaff' AND nationalite_participant = 'NLD'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Wouter' AND nom_participant = 'de Graaff' AND nationalite_participant = 'NLD'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Wouter' AND nom_participant = 'de Graaff' AND nationalite_participant = 'NLD'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Wouter' AND nom_participant = 'de Graaff' AND nationalite_participant = 'NLD'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Wouter' AND nom_participant = 'de Graaff' AND nationalite_participant = 'NLD'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Wouter' AND nom_participant = 'de Graaff' AND nationalite_participant = 'NLD'))

    -- Martin Macik
    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Martin' AND nom_participant = 'Macik' AND nationalite_participant = 'CZE'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Martin' AND nom_participant = 'Macik' AND nationalite_participant = 'CZE'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Martin' AND nom_participant = 'Macik' AND nationalite_participant = 'CZE'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Martin' AND nom_participant = 'Macik' AND nationalite_participant = 'CZE'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Martin' AND nom_participant = 'Macik' AND nationalite_participant = 'CZE'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Martin' AND nom_participant = 'Macik' AND nationalite_participant = 'CZE'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Martin' AND nom_participant = 'Macik' AND nationalite_participant = 'CZE'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Martin' AND nom_participant = 'Macik' AND nationalite_participant = 'CZE'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Martin' AND nom_participant = 'Macik' AND nationalite_participant = 'CZE'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Martin' AND nom_participant = 'Macik' AND nationalite_participant = 'CZE'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Martin' AND nom_participant = 'Macik' AND nationalite_participant = 'CZE'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Martin' AND nom_participant = 'Macik' AND nationalite_participant = 'CZE'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Martin' AND nom_participant = 'Macik' AND nationalite_participant = 'CZE'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Martin' AND nom_participant = 'Macik' AND nationalite_participant = 'CZE'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Martin' AND nom_participant = 'Macik' AND nationalite_participant = 'CZE'))

    -- Frantisek Tomasek
    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Frantisek' AND nom_participant = 'Tomasek' AND nationalite_participant = 'CZE'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Frantisek' AND nom_participant = 'Tomasek' AND nationalite_participant = 'CZE'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Frantisek' AND nom_participant = 'Tomasek' AND nationalite_participant = 'CZE'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Frantisek' AND nom_participant = 'Tomasek' AND nationalite_participant = 'CZE'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Frantisek' AND nom_participant = 'Tomasek' AND nationalite_participant = 'CZE'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Frantisek' AND nom_participant = 'Tomasek' AND nationalite_participant = 'CZE'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Frantisek' AND nom_participant = 'Tomasek' AND nationalite_participant = 'CZE'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Frantisek' AND nom_participant = 'Tomasek' AND nationalite_participant = 'CZE'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Frantisek' AND nom_participant = 'Tomasek' AND nationalite_participant = 'CZE'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Frantisek' AND nom_participant = 'Tomasek' AND nationalite_participant = 'CZE'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Frantisek' AND nom_participant = 'Tomasek' AND nationalite_participant = 'CZE'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Frantisek' AND nom_participant = 'Tomasek' AND nationalite_participant = 'CZE'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Frantisek' AND nom_participant = 'Tomasek' AND nationalite_participant = 'CZE'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Frantisek' AND nom_participant = 'Tomasek' AND nationalite_participant = 'CZE'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Frantisek' AND nom_participant = 'Tomasek' AND nationalite_participant = 'CZE'))

    -- Janus van Kasteren
    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Janus' AND nom_participant = 'van Kasteren' AND nationalite_participant = 'NLD'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Janus' AND nom_participant = 'van Kasteren' AND nationalite_participant = 'NLD'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Janus' AND nom_participant = 'van Kasteren' AND nationalite_participant = 'NLD'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Janus' AND nom_participant = 'van Kasteren' AND nationalite_participant = 'NLD'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Janus' AND nom_participant = 'van Kasteren' AND nationalite_participant = 'NLD'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Janus' AND nom_participant = 'van Kasteren' AND nationalite_participant = 'NLD'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Janus' AND nom_participant = 'van Kasteren' AND nationalite_participant = 'NLD'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Janus' AND nom_participant = 'van Kasteren' AND nationalite_participant = 'NLD'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Janus' AND nom_participant = 'van Kasteren' AND nationalite_participant = 'NLD'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Janus' AND nom_participant = 'van Kasteren' AND nationalite_participant = 'NLD'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Janus' AND nom_participant = 'van Kasteren' AND nationalite_participant = 'NLD'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Janus' AND nom_participant = 'van Kasteren' AND nationalite_participant = 'NLD'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Janus' AND nom_participant = 'van Kasteren' AND nationalite_participant = 'NLD'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Janus' AND nom_participant = 'van Kasteren' AND nationalite_participant = 'NLD'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Janus' AND nom_participant = 'van Kasteren' AND nationalite_participant = 'NLD'))

    -- Darek Rodewald
    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Darek' AND nom_participant = 'Rodewald' AND nationalite_participant = 'POL'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Darek' AND nom_participant = 'Rodewald' AND nationalite_participant = 'POL'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Darek' AND nom_participant = 'Rodewald' AND nationalite_participant = 'POL'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Darek' AND nom_participant = 'Rodewald' AND nationalite_participant = 'POL'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Darek' AND nom_participant = 'Rodewald' AND nationalite_participant = 'POL'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Darek' AND nom_participant = 'Rodewald' AND nationalite_participant = 'POL'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Darek' AND nom_participant = 'Rodewald' AND nationalite_participant = 'POL'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Darek' AND nom_participant = 'Rodewald' AND nationalite_participant = 'POL'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Darek' AND nom_participant = 'Rodewald' AND nationalite_participant = 'POL'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Darek' AND nom_participant = 'Rodewald' AND nationalite_participant = 'POL'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Darek' AND nom_participant = 'Rodewald' AND nationalite_participant = 'POL'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Darek' AND nom_participant = 'Rodewald' AND nationalite_participant = 'POL'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Darek' AND nom_participant = 'Rodewald' AND nationalite_participant = 'POL'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Darek' AND nom_participant = 'Rodewald' AND nationalite_participant = 'POL'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Darek' AND nom_participant = 'Rodewald' AND nationalite_participant = 'POL'))

    -- Martin Soltys
    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Martin' AND nom_participant = 'Soltys' AND nationalite_participant = 'CZE'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Martin' AND nom_participant = 'Soltys' AND nationalite_participant = 'CZE'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Martin' AND nom_participant = 'Soltys' AND nationalite_participant = 'CZE'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Martin' AND nom_participant = 'Soltys' AND nationalite_participant = 'CZE'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Martin' AND nom_participant = 'Soltys' AND nationalite_participant = 'CZE'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Martin' AND nom_participant = 'Soltys' AND nationalite_participant = 'CZE'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Martin' AND nom_participant = 'Soltys' AND nationalite_participant = 'CZE'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Martin' AND nom_participant = 'Soltys' AND nationalite_participant = 'CZE'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Martin' AND nom_participant = 'Soltys' AND nationalite_participant = 'CZE'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Martin' AND nom_participant = 'Soltys' AND nationalite_participant = 'CZE'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Martin' AND nom_participant = 'Soltys' AND nationalite_participant = 'CZE'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Martin' AND nom_participant = 'Soltys' AND nationalite_participant = 'CZE'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Martin' AND nom_participant = 'Soltys' AND nationalite_participant = 'CZE'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Martin' AND nom_participant = 'Soltys' AND nationalite_participant = 'CZE'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Martin' AND nom_participant = 'Soltys' AND nationalite_participant = 'CZE'))

    -- Roman Krejci
    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Roman' AND nom_participant = 'Krejci' AND nationalite_participant = 'CZE'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Roman' AND nom_participant = 'Krejci' AND nationalite_participant = 'CZE'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Roman' AND nom_participant = 'Krejci' AND nationalite_participant = 'CZE'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Roman' AND nom_participant = 'Krejci' AND nationalite_participant = 'CZE'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Roman' AND nom_participant = 'Krejci' AND nationalite_participant = 'CZE'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Roman' AND nom_participant = 'Krejci' AND nationalite_participant = 'CZE'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Roman' AND nom_participant = 'Krejci' AND nationalite_participant = 'CZE'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Roman' AND nom_participant = 'Krejci' AND nationalite_participant = 'CZE'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Roman' AND nom_participant = 'Krejci' AND nationalite_participant = 'CZE'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Roman' AND nom_participant = 'Krejci' AND nationalite_participant = 'CZE'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Roman' AND nom_participant = 'Krejci' AND nationalite_participant = 'CZE'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Roman' AND nom_participant = 'Krejci' AND nationalite_participant = 'CZE'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Roman' AND nom_participant = 'Krejci' AND nationalite_participant = 'CZE'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Roman' AND nom_participant = 'Krejci' AND nationalite_participant = 'CZE'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Roman' AND nom_participant = 'Krejci' AND nationalite_participant = 'CZE'))

    -- Victor Willem
    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Victor Willem' AND nom_participant = 'Versteijnen' AND nationalite_participant = 'NLD'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Victor Willem' AND nom_participant = 'Versteijnen' AND nationalite_participant = 'NLD'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Victor Willem' AND nom_participant = 'Versteijnen' AND nationalite_participant = 'NLD'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Victor Willem' AND nom_participant = 'Versteijnen' AND nationalite_participant = 'NLD'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Victor Willem' AND nom_participant = 'Versteijnen' AND nationalite_participant = 'NLD'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Victor Willem' AND nom_participant = 'Versteijnen' AND nationalite_participant = 'NLD'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Victor Willem' AND nom_participant = 'Versteijnen' AND nationalite_participant = 'NLD'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Victor Willem' AND nom_participant = 'Versteijnen' AND nationalite_participant = 'NLD'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Victor Willem' AND nom_participant = 'Versteijnen' AND nationalite_participant = 'NLD'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Victor Willem' AND nom_participant = 'Versteijnen' AND nationalite_participant = 'NLD'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Victor Willem' AND nom_participant = 'Versteijnen' AND nationalite_participant = 'NLD'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Victor Willem' AND nom_participant = 'Versteijnen' AND nationalite_participant = 'NLD'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Victor Willem' AND nom_participant = 'Versteijnen' AND nationalite_participant = 'NLD'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Victor Willem' AND nom_participant = 'Versteijnen' AND nationalite_participant = 'NLD'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Victor Willem' AND nom_participant = 'Versteijnen' AND nationalite_participant = 'NLD'))

    -- Andreas Wilhelm Michiel Marius
    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Andreas Wilhelm Michiel Marius' AND nom_participant = 'van der Sande' AND nationalite_participant = 'NLD'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Andreas Wilhelm Michiel Marius' AND nom_participant = 'van der Sande' AND nationalite_participant = 'NLD'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Andreas Wilhelm Michiel Marius' AND nom_participant = 'van der Sande' AND nationalite_participant = 'NLD'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Andreas Wilhelm Michiel Marius' AND nom_participant = 'van der Sande' AND nationalite_participant = 'NLD'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Andreas Wilhelm Michiel Marius' AND nom_participant = 'van der Sande' AND nationalite_participant = 'NLD'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Andreas Wilhelm Michiel Marius' AND nom_participant = 'van der Sande' AND nationalite_participant = 'NLD'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Andreas Wilhelm Michiel Marius' AND nom_participant = 'van der Sande' AND nationalite_participant = 'NLD'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Andreas Wilhelm Michiel Marius' AND nom_participant = 'van der Sande' AND nationalite_participant = 'NLD'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Andreas Wilhelm Michiel Marius' AND nom_participant = 'van der Sande' AND nationalite_participant = 'NLD'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Andreas Wilhelm Michiel Marius' AND nom_participant = 'van der Sande' AND nationalite_participant = 'NLD'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Andreas Wilhelm Michiel Marius' AND nom_participant = 'van der Sande' AND nationalite_participant = 'NLD'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Andreas Wilhelm Michiel Marius' AND nom_participant = 'van der Sande' AND nationalite_participant = 'NLD'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Andreas Wilhelm Michiel Marius' AND nom_participant = 'van der Sande' AND nationalite_participant = 'NLD'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Andreas Wilhelm Michiel Marius' AND nom_participant = 'van der Sande' AND nationalite_participant = 'NLD'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Andreas Wilhelm Michiel Marius' AND nom_participant = 'van der Sande' AND nationalite_participant = 'NLD'))

    -- Francisco
    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Francisco' AND nom_participant = 'Lopez Contardo' AND nationalite_participant = 'CHL'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Francisco' AND nom_participant = 'Lopez Contardo' AND nationalite_participant = 'CHL'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Francisco' AND nom_participant = 'Lopez Contardo' AND nationalite_participant = 'CHL'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Francisco' AND nom_participant = 'Lopez Contardo' AND nationalite_participant = 'CHL'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Francisco' AND nom_participant = 'Lopez Contardo' AND nationalite_participant = 'CHL'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Francisco' AND nom_participant = 'Lopez Contardo' AND nationalite_participant = 'CHL'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Francisco' AND nom_participant = 'Lopez Contardo' AND nationalite_participant = 'CHL'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Francisco' AND nom_participant = 'Lopez Contardo' AND nationalite_participant = 'CHL'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Francisco' AND nom_participant = 'Lopez Contardo' AND nationalite_participant = 'CHL'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Francisco' AND nom_participant = 'Lopez Contardo' AND nationalite_participant = 'CHL'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Francisco' AND nom_participant = 'Lopez Contardo' AND nationalite_participant = 'CHL'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Francisco' AND nom_participant = 'Lopez Contardo' AND nationalite_participant = 'CHL'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Francisco' AND nom_participant = 'Lopez Contardo' AND nationalite_participant = 'CHL'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Francisco' AND nom_participant = 'Lopez Contardo' AND nationalite_participant = 'CHL'))

    -- Juan Pablo Latrach Vinagre
    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Juan Pablo' AND nom_participant = 'Latrach Vinagre' AND nationalite_participant = 'CHL'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Juan Pablo' AND nom_participant = 'Latrach Vinagre' AND nationalite_participant = 'CHL'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Juan Pablo' AND nom_participant = 'Latrach Vinagre' AND nationalite_participant = 'CHL'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Juan Pablo' AND nom_participant = 'Latrach Vinagre' AND nationalite_participant = 'CHL'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Juan Pablo' AND nom_participant = 'Latrach Vinagre' AND nationalite_participant = 'CHL'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Juan Pablo' AND nom_participant = 'Latrach Vinagre' AND nationalite_participant = 'CHL'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Juan Pablo' AND nom_participant = 'Latrach Vinagre' AND nationalite_participant = 'CHL'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Juan Pablo' AND nom_participant = 'Latrach Vinagre' AND nationalite_participant = 'CHL'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Juan Pablo' AND nom_participant = 'Latrach Vinagre' AND nationalite_participant = 'CHL'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Juan Pablo' AND nom_participant = 'Latrach Vinagre' AND nationalite_participant = 'CHL'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Juan Pablo' AND nom_participant = 'Latrach Vinagre' AND nationalite_participant = 'CHL'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Juan Pablo' AND nom_participant = 'Latrach Vinagre' AND nationalite_participant = 'CHL'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Juan Pablo' AND nom_participant = 'Latrach Vinagre' AND nationalite_participant = 'CHL'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Juan Pablo' AND nom_participant = 'Latrach Vinagre' AND nationalite_participant = 'CHL'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Juan Pablo' AND nom_participant = 'Latrach Vinagre' AND nationalite_participant = 'CHL'))

    -- Seth quintero
    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Seth' AND nom_participant = 'Quintero' AND nationalite_participant = 'USA'))
    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Seth' AND nom_participant = 'Quintero' AND nationalite_participant = 'USA'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Seth' AND nom_participant = 'Quintero' AND nationalite_participant = 'USA'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Seth' AND nom_participant = 'Quintero' AND nationalite_participant = 'USA'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Seth' AND nom_participant = 'Quintero' AND nationalite_participant = 'USA'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Seth' AND nom_participant = 'Quintero' AND nationalite_participant = 'USA'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Seth' AND nom_participant = 'Quintero' AND nationalite_participant = 'USA'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Seth' AND nom_participant = 'Quintero' AND nationalite_participant = 'USA'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Seth' AND nom_participant = 'Quintero' AND nationalite_participant = 'USA'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Seth' AND nom_participant = 'Quintero' AND nationalite_participant = 'USA'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Seth' AND nom_participant = 'Quintero' AND nationalite_participant = 'USA'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Seth' AND nom_participant = 'Quintero' AND nationalite_participant = 'USA'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Seth' AND nom_participant = 'Quintero' AND nationalite_participant = 'USA'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Seth' AND nom_participant = 'Quintero' AND nationalite_participant = 'USA'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Seth' AND nom_participant = 'Quintero' AND nationalite_participant = 'USA'))

    -- Dennis Zenz
    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Dennis' AND nom_participant = 'Zenz' AND nationalite_participant = 'DEU'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Dennis' AND nom_participant = 'Zenz' AND nationalite_participant = 'DEU'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Dennis' AND nom_participant = 'Zenz' AND nationalite_participant = 'DEU'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Dennis' AND nom_participant = 'Zenz' AND nationalite_participant = 'DEU'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Dennis' AND nom_participant = 'Zenz' AND nationalite_participant = 'DEU'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Dennis' AND nom_participant = 'Zenz' AND nationalite_participant = 'DEU'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Dennis' AND nom_participant = 'Zenz' AND nationalite_participant = 'DEU'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Dennis' AND nom_participant = 'Zenz' AND nationalite_participant = 'DEU'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Dennis' AND nom_participant = 'Zenz' AND nationalite_participant = 'DEU'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Dennis' AND nom_participant = 'Zenz' AND nationalite_participant = 'DEU'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Dennis' AND nom_participant = 'Zenz' AND nationalite_participant = 'DEU'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Dennis' AND nom_participant = 'Zenz' AND nationalite_participant = 'DEU'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Dennis' AND nom_participant = 'Zenz' AND nationalite_participant = 'DEU'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Dennis' AND nom_participant = 'Zenz' AND nationalite_participant = 'DEU'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Dennis' AND nom_participant = 'Zenz' AND nationalite_participant = 'DEU'))

    -- Cristina Gutierrez Herrero
    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Cristina' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Cristina' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Cristina' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Cristina' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Cristina' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Cristina' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Cristina' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Cristina' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Cristina' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Cristina' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Cristina' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Cristina' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Cristina' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Cristina' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Cristina' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))

    -- Pablo Moreno Huete Gutierrez Herrero
    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Pablo Moreno Huete' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Pablo Moreno Huete' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Pablo Moreno Huete' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Pablo Moreno Huete' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Pablo Moreno Huete' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Pablo Moreno Huete' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Pablo Moreno Huete' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Pablo Moreno Huete' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Pablo Moreno Huete' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Pablo Moreno Huete' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Pablo Moreno Huete' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Pablo Moreno Huete' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Pablo Moreno Huete' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Pablo Moreno Huete' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Pablo Moreno Huete' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))

    -- Austin Jones
    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Austin' AND nom_participant = 'Jones' AND nationalite_participant = 'USA'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Austin' AND nom_participant = 'Jones' AND nationalite_participant = 'USA'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Austin' AND nom_participant = 'Jones' AND nationalite_participant = 'USA'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Austin' AND nom_participant = 'Jones' AND nationalite_participant = 'USA'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Austin' AND nom_participant = 'Jones' AND nationalite_participant = 'USA'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Austin' AND nom_participant = 'Jones' AND nationalite_participant = 'USA'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Austin' AND nom_participant = 'Jones' AND nationalite_participant = 'USA'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Austin' AND nom_participant = 'Jones' AND nationalite_participant = 'USA'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Austin' AND nom_participant = 'Jones' AND nationalite_participant = 'USA'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Austin' AND nom_participant = 'Jones' AND nationalite_participant = 'USA'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Austin' AND nom_participant = 'Jones' AND nationalite_participant = 'USA'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Austin' AND nom_participant = 'Jones' AND nationalite_participant = 'USA'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Austin' AND nom_participant = 'Jones' AND nationalite_participant = 'USA'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Austin' AND nom_participant = 'Jones' AND nationalite_participant = 'USA'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Austin' AND nom_participant = 'Jones' AND nationalite_participant = 'USA'))

    -- Gustavo Guglelmin
    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Gustavo' AND nom_participant = 'Guglelmin' AND nationalite_participant = 'BRA'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Gustavo' AND nom_participant = 'Guglelmin' AND nationalite_participant = 'BRA'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Gustavo' AND nom_participant = 'Guglelmin' AND nationalite_participant = 'BRA'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Gustavo' AND nom_participant = 'Guglelmin' AND nationalite_participant = 'BRA'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Gustavo' AND nom_participant = 'Guglelmin' AND nationalite_participant = 'BRA'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Gustavo' AND nom_participant = 'Guglelmin' AND nationalite_participant = 'BRA'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Gustavo' AND nom_participant = 'Guglelmin' AND nationalite_participant = 'BRA'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Gustavo' AND nom_participant = 'Guglelmin' AND nationalite_participant = 'BRA'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Gustavo' AND nom_participant = 'Guglelmin' AND nationalite_participant = 'BRA'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Gustavo' AND nom_participant = 'Guglelmin' AND nationalite_participant = 'BRA'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Gustavo' AND nom_participant = 'Guglelmin' AND nationalite_participant = 'BRA'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Gustavo' AND nom_participant = 'Guglelmin' AND nationalite_participant = 'BRA'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Gustavo' AND nom_participant = 'Guglelmin' AND nationalite_participant = 'BRA'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Gustavo' AND nom_participant = 'Guglelmin' AND nationalite_participant = 'BRA'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Gustavo' AND nom_participant = 'Guglelmin' AND nationalite_participant = 'BRA'))

    -- Guillaume de Mevius
    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Guillaume' AND nom_participant = 'De Mevius' AND nationalite_participant = 'BEL'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Guillaume' AND nom_participant = 'De Mevius' AND nationalite_participant = 'BEL'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Guillaume' AND nom_participant = 'De Mevius' AND nationalite_participant = 'BEL'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Guillaume' AND nom_participant = 'De Mevius' AND nationalite_participant = 'BEL'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Guillaume' AND nom_participant = 'De Mevius' AND nationalite_participant = 'BEL'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Guillaume' AND nom_participant = 'De Mevius' AND nationalite_participant = 'BEL'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Guillaume' AND nom_participant = 'De Mevius' AND nationalite_participant = 'BEL'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Guillaume' AND nom_participant = 'De Mevius' AND nationalite_participant = 'BEL'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Guillaume' AND nom_participant = 'De Mevius' AND nationalite_participant = 'BEL'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Guillaume' AND nom_participant = 'De Mevius' AND nationalite_participant = 'BEL'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Guillaume' AND nom_participant = 'De Mevius' AND nationalite_participant = 'BEL'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Guillaume' AND nom_participant = 'De Mevius' AND nationalite_participant = 'BEL'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Guillaume' AND nom_participant = 'De Mevius' AND nationalite_participant = 'BEL'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Guillaume' AND nom_participant = 'De Mevius' AND nationalite_participant = 'BEL'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Guillaume' AND nom_participant = 'De Mevius' AND nationalite_participant = 'BEL'))

    -- Francois Cazelet
    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Francois' AND nom_participant = 'Cazalet' AND nationalite_participant = 'FRA'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Francois' AND nom_participant = 'Cazalet' AND nationalite_participant = 'FRA'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Francois' AND nom_participant = 'Cazalet' AND nationalite_participant = 'FRA'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Francois' AND nom_participant = 'Cazalet' AND nationalite_participant = 'FRA'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Francois' AND nom_participant = 'Cazalet' AND nationalite_participant = 'FRA'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Francois' AND nom_participant = 'Cazalet' AND nationalite_participant = 'FRA'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Francois' AND nom_participant = 'Cazalet' AND nationalite_participant = 'FRA'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Francois' AND nom_participant = 'Cazalet' AND nationalite_participant = 'FRA'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Francois' AND nom_participant = 'Cazalet' AND nationalite_participant = 'FRA'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Francois' AND nom_participant = 'Cazalet' AND nationalite_participant = 'FRA'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Francois' AND nom_participant = 'Cazalet' AND nationalite_participant = 'FRA'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Francois' AND nom_participant = 'Cazalet' AND nationalite_participant = 'FRA'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Francois' AND nom_participant = 'Cazalet' AND nationalite_participant = 'FRA'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Francois' AND nom_participant = 'Cazalet' AND nationalite_participant = 'FRA'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Francois' AND nom_participant = 'Cazalet' AND nationalite_participant = 'FRA'))

    -- Rokas Baciuska
    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Rokas' AND nom_participant = 'Baciuska' AND nationalite_participant = 'LTU'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Rokas' AND nom_participant = 'Baciuska' AND nationalite_participant = 'LTU'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Rokas' AND nom_participant = 'Baciuska' AND nationalite_participant = 'LTU'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Rokas' AND nom_participant = 'Baciuska' AND nationalite_participant = 'LTU'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Rokas' AND nom_participant = 'Baciuska' AND nationalite_participant = 'LTU'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Rokas' AND nom_participant = 'Baciuska' AND nationalite_participant = 'LTU'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Rokas' AND nom_participant = 'Baciuska' AND nationalite_participant = 'LTU'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Rokas' AND nom_participant = 'Baciuska' AND nationalite_participant = 'LTU'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Rokas' AND nom_participant = 'Baciuska' AND nationalite_participant = 'LTU'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Rokas' AND nom_participant = 'Baciuska' AND nationalite_participant = 'LTU'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Rokas' AND nom_participant = 'Baciuska' AND nationalite_participant = 'LTU'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Rokas' AND nom_participant = 'Baciuska' AND nationalite_participant = 'LTU'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Rokas' AND nom_participant = 'Baciuska' AND nationalite_participant = 'LTU'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Rokas' AND nom_participant = 'Baciuska' AND nationalite_participant = 'LTU'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Rokas' AND nom_participant = 'Baciuska' AND nationalite_participant = 'LTU'))

    -- Vidal Montijano
    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Oriol' AND nom_participant = 'Vidal Montijano' AND nationalite_participant = 'ESP'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Oriol' AND nom_participant = 'Vidal Montijano' AND nationalite_participant = 'ESP'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Oriol' AND nom_participant = 'Vidal Montijano' AND nationalite_participant = 'ESP'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Oriol' AND nom_participant = 'Vidal Montijano' AND nationalite_participant = 'ESP'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Oriol' AND nom_participant = 'Vidal Montijano' AND nationalite_participant = 'ESP'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Oriol' AND nom_participant = 'Vidal Montijano' AND nationalite_participant = 'ESP'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Oriol' AND nom_participant = 'Vidal Montijano' AND nationalite_participant = 'ESP'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Oriol' AND nom_participant = 'Vidal Montijano' AND nationalite_participant = 'ESP'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Oriol' AND nom_participant = 'Vidal Montijano' AND nationalite_participant = 'ESP'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Oriol' AND nom_participant = 'Vidal Montijano' AND nationalite_participant = 'ESP'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Oriol' AND nom_participant = 'Vidal Montijano' AND nationalite_participant = 'ESP'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Oriol' AND nom_participant = 'Vidal Montijano' AND nationalite_participant = 'ESP'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Oriol' AND nom_participant = 'Vidal Montijano' AND nationalite_participant = 'ESP'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Oriol' AND nom_participant = 'Vidal Montijano' AND nationalite_participant = 'ESP'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Oriol' AND nom_participant = 'Vidal Montijano' AND nationalite_participant = 'ESP'))

    -- Morek Coczal
    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Marek' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Marek' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Marek' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Marek' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Marek' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Marek' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Marek' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Marek' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Marek' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Marek' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Marek' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Marek' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Marek' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Marek' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Marek' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))

    -- Maciej Marton
    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Maciej' AND nom_participant = 'Marton' AND nationalite_participant = 'POL'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Maciej' AND nom_participant = 'Marton' AND nationalite_participant = 'POL'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Maciej' AND nom_participant = 'Marton' AND nationalite_participant = 'POL'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Maciej' AND nom_participant = 'Marton' AND nationalite_participant = 'POL'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Maciej' AND nom_participant = 'Marton' AND nationalite_participant = 'POL'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Maciej' AND nom_participant = 'Marton' AND nationalite_participant = 'POL'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Maciej' AND nom_participant = 'Marton' AND nationalite_participant = 'POL'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Maciej' AND nom_participant = 'Marton' AND nationalite_participant = 'POL'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Maciej' AND nom_participant = 'Marton' AND nationalite_participant = 'POL'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Maciej' AND nom_participant = 'Marton' AND nationalite_participant = 'POL'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Maciej' AND nom_participant = 'Marton' AND nationalite_participant = 'POL'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Maciej' AND nom_participant = 'Marton' AND nationalite_participant = 'POL'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Maciej' AND nom_participant = 'Marton' AND nationalite_participant = 'POL'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Maciej' AND nom_participant = 'Marton' AND nationalite_participant = 'POL'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Maciej' AND nom_participant = 'Marton' AND nationalite_participant = 'POL'))

    -- Gerard Farres Gil
       -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Gerard' AND nom_participant = 'Farres Guell' AND nationalite_participant = 'ESP'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Gerard' AND nom_participant = 'Farres Guell' AND nationalite_participant = 'ESP'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Gerard' AND nom_participant = 'Farres Guell' AND nationalite_participant = 'ESP'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Gerard' AND nom_participant = 'Farres Guell' AND nationalite_participant = 'ESP'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Gerard' AND nom_participant = 'Farres Guell' AND nationalite_participant = 'ESP'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Gerard' AND nom_participant = 'Farres Guell' AND nationalite_participant = 'ESP'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Gerard' AND nom_participant = 'Farres Guell' AND nationalite_participant = 'ESP'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Gerard' AND nom_participant = 'Farres Guell' AND nationalite_participant = 'ESP'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Gerard' AND nom_participant = 'Farres Guell' AND nationalite_participant = 'ESP'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Gerard' AND nom_participant = 'Farres Guell' AND nationalite_participant = 'ESP'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Gerard' AND nom_participant = 'Farres Guell' AND nationalite_participant = 'ESP'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Gerard' AND nom_participant = 'Farres Guell' AND nationalite_participant = 'ESP'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Gerard' AND nom_participant = 'Farres Guell' AND nationalite_participant = 'ESP'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Gerard' AND nom_participant = 'Farres Guell' AND nationalite_participant = 'ESP'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Gerard' AND nom_participant = 'Farres Guell' AND nationalite_participant = 'ESP'))

    -- Diego Ortege Gil
    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Diego' AND nom_participant = 'Ortega Gil' AND nationalite_participant = 'ESP'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Diego' AND nom_participant = 'Ortega Gil' AND nationalite_participant = 'ESP'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Diego' AND nom_participant = 'Ortega Gil' AND nationalite_participant = 'ESP'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Diego' AND nom_participant = 'Ortega Gil' AND nationalite_participant = 'ESP'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Diego' AND nom_participant = 'Ortega Gil' AND nationalite_participant = 'ESP'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Diego' AND nom_participant = 'Ortega Gil' AND nationalite_participant = 'ESP'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Diego' AND nom_participant = 'Ortega Gil' AND nationalite_participant = 'ESP'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Diego' AND nom_participant = 'Ortega Gil' AND nationalite_participant = 'ESP'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Diego' AND nom_participant = 'Ortega Gil' AND nationalite_participant = 'ESP'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Diego' AND nom_participant = 'Ortega Gil' AND nationalite_participant = 'ESP'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Diego' AND nom_participant = 'Ortega Gil' AND nationalite_participant = 'ESP'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Diego' AND nom_participant = 'Ortega Gil' AND nationalite_participant = 'ESP'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Diego' AND nom_participant = 'Ortega Gil' AND nationalite_participant = 'ESP'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Diego' AND nom_participant = 'Ortega Gil' AND nationalite_participant = 'ESP'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Diego' AND nom_participant = 'Ortega Gil' AND nationalite_participant = 'ESP'))

    -- Michal Goczal
    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Michal' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Michal' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Michal' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Michal' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Michal' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Michal' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Michal' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Michal' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Michal' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Michal' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Michal' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Michal' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Michal' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Michal' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Michal' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))

    -- Szymon Gospodarczy
    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Szymon' AND nom_participant = 'Gospodarczy' AND nationalite_participant = 'POL'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Szymon' AND nom_participant = 'Gospodarczy' AND nationalite_participant = 'POL'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Szymon' AND nom_participant = 'Gospodarczy' AND nationalite_participant = 'POL'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Szymon' AND nom_participant = 'Gospodarczy' AND nationalite_participant = 'POL'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Szymon' AND nom_participant = 'Gospodarczy' AND nationalite_participant = 'POL'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Szymon' AND nom_participant = 'Gospodarczy' AND nationalite_participant = 'POL'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Szymon' AND nom_participant = 'Gospodarczy' AND nationalite_participant = 'POL'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Szymon' AND nom_participant = 'Gospodarczy' AND nationalite_participant = 'POL'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Szymon' AND nom_participant = 'Gospodarczy' AND nationalite_participant = 'POL'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Szymon' AND nom_participant = 'Gospodarczy' AND nationalite_participant = 'POL'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Szymon' AND nom_participant = 'Gospodarczy' AND nationalite_participant = 'POL'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Szymon' AND nom_participant = 'Gospodarczy' AND nationalite_participant = 'POL'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Szymon' AND nom_participant = 'Gospodarczy' AND nationalite_participant = 'POL'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Szymon' AND nom_participant = 'Gospodarczy' AND nationalite_participant = 'POL'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Szymon' AND nom_participant = 'Gospodarczy' AND nationalite_participant = 'POL'))

    -- Rodrigo Luppi De Oliveira
    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Rodrigo' AND nom_participant = 'Luppi De Oliveira' AND nationalite_participant = 'BRA'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Rodrigo' AND nom_participant = 'Luppi De Oliveira' AND nationalite_participant = 'BRA'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Rodrigo' AND nom_participant = 'Luppi De Oliveira' AND nationalite_participant = 'BRA'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Rodrigo' AND nom_participant = 'Luppi De Oliveira' AND nationalite_participant = 'BRA'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Rodrigo' AND nom_participant = 'Luppi De Oliveira' AND nationalite_participant = 'BRA'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Rodrigo' AND nom_participant = 'Luppi De Oliveira' AND nationalite_participant = 'BRA'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Rodrigo' AND nom_participant = 'Luppi De Oliveira' AND nationalite_participant = 'BRA'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Rodrigo' AND nom_participant = 'Luppi De Oliveira' AND nationalite_participant = 'BRA'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Rodrigo' AND nom_participant = 'Luppi De Oliveira' AND nationalite_participant = 'BRA'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Rodrigo' AND nom_participant = 'Luppi De Oliveira' AND nationalite_participant = 'BRA'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Rodrigo' AND nom_participant = 'Luppi De Oliveira' AND nationalite_participant = 'BRA'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Rodrigo' AND nom_participant = 'Luppi De Oliveira' AND nationalite_participant = 'BRA'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Rodrigo' AND nom_participant = 'Luppi De Oliveira' AND nationalite_participant = 'BRA'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Rodrigo' AND nom_participant = 'Luppi De Oliveira' AND nationalite_participant = 'BRA'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Rodrigo' AND nom_participant = 'Luppi De Oliveira' AND nationalite_participant = 'BRA'))

    -- Maykel Justo
    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Maykel' AND nom_participant = 'Justo' AND nationalite_participant = 'BRA'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Maykel' AND nom_participant = 'Justo' AND nationalite_participant = 'BRA'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Maykel' AND nom_participant = 'Justo' AND nationalite_participant = 'BRA'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Maykel' AND nom_participant = 'Justo' AND nationalite_participant = 'BRA'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Maykel' AND nom_participant = 'Justo' AND nationalite_participant = 'BRA'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Maykel' AND nom_participant = 'Justo' AND nationalite_participant = 'BRA'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Maykel' AND nom_participant = 'Justo' AND nationalite_participant = 'BRA'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Maykel' AND nom_participant = 'Justo' AND nationalite_participant = 'BRA'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Maykel' AND nom_participant = 'Justo' AND nationalite_participant = 'BRA'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Maykel' AND nom_participant = 'Justo' AND nationalite_participant = 'BRA'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Maykel' AND nom_participant = 'Justo' AND nationalite_participant = 'BRA'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Maykel' AND nom_participant = 'Justo' AND nationalite_participant = 'BRA'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Maykel' AND nom_participant = 'Justo' AND nationalite_participant = 'BRA'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Maykel' AND nom_participant = 'Justo' AND nationalite_participant = 'BRA'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Maykel' AND nom_participant = 'Justo' AND nationalite_participant = 'BRA'))

    -- Serge Mogno
    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Serge' AND nom_participant = 'Mogno' AND nationalite_participant = 'FRA'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Serge' AND nom_participant = 'Mogno' AND nationalite_participant = 'FRA'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Serge' AND nom_participant = 'Mogno' AND nationalite_participant = 'FRA'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Serge' AND nom_participant = 'Mogno' AND nationalite_participant = 'FRA'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Serge' AND nom_participant = 'Mogno' AND nationalite_participant = 'FRA'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Serge' AND nom_participant = 'Mogno' AND nationalite_participant = 'FRA'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Serge' AND nom_participant = 'Mogno' AND nationalite_participant = 'FRA'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Serge' AND nom_participant = 'Mogno' AND nationalite_participant = 'FRA'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Serge' AND nom_participant = 'Mogno' AND nationalite_participant = 'FRA'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Serge' AND nom_participant = 'Mogno' AND nationalite_participant = 'FRA'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Serge' AND nom_participant = 'Mogno' AND nationalite_participant = 'FRA'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Serge' AND nom_participant = 'Mogno' AND nationalite_participant = 'FRA'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Serge' AND nom_participant = 'Mogno' AND nationalite_participant = 'FRA'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Serge' AND nom_participant = 'Mogno' AND nationalite_participant = 'FRA'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Serge' AND nom_participant = 'Mogno' AND nationalite_participant = 'FRA'))

    -- Florent Drulhon
    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Florent' AND nom_participant = 'Drulhon' AND nationalite_participant = 'FRA'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Florent' AND nom_participant = 'Drulhon' AND nationalite_participant = 'FRA'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Florent' AND nom_participant = 'Drulhon' AND nationalite_participant = 'FRA'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Florent' AND nom_participant = 'Drulhon' AND nationalite_participant = 'FRA'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Florent' AND nom_participant = 'Drulhon' AND nationalite_participant = 'FRA'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Florent' AND nom_participant = 'Drulhon' AND nationalite_participant = 'FRA'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Florent' AND nom_participant = 'Drulhon' AND nationalite_participant = 'FRA'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Florent' AND nom_participant = 'Drulhon' AND nationalite_participant = 'FRA'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Florent' AND nom_participant = 'Drulhon' AND nationalite_participant = 'FRA'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Florent' AND nom_participant = 'Drulhon' AND nationalite_participant = 'FRA'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Florent' AND nom_participant = 'Drulhon' AND nationalite_participant = 'FRA'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Florent' AND nom_participant = 'Drulhon' AND nationalite_participant = 'FRA'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Florent' AND nom_participant = 'Drulhon' AND nationalite_participant = 'FRA'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Florent' AND nom_participant = 'Drulhon' AND nationalite_participant = 'FRA'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Florent' AND nom_participant = 'Drulhon' AND nationalite_participant = 'FRA'))

    -- Jerome Galpin
    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Jerome' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Jerome' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Jerome' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Jerome' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Jerome' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Jerome' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Jerome' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Jerome' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Jerome' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Jerome' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Jerome' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Jerome' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Jerome' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Jerome' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Jerome' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))

    -- Anne Galpin
    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Anne' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Anne' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Anne' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Anne' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Anne' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Anne' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Anne' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Anne' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Anne' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Anne' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Anne' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Anne' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Anne' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Anne' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Anne' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))

    -- Kilian Revuelta
    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kilian' AND nom_participant = 'Revuelta' AND nationalite_participant = 'ESP'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kilian' AND nom_participant = 'Revuelta' AND nationalite_participant = 'ESP'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kilian' AND nom_participant = 'Revuelta' AND nationalite_participant = 'ESP'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kilian' AND nom_participant = 'Revuelta' AND nationalite_participant = 'ESP'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kilian' AND nom_participant = 'Revuelta' AND nationalite_participant = 'ESP'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kilian' AND nom_participant = 'Revuelta' AND nationalite_participant = 'ESP'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kilian' AND nom_participant = 'Revuelta' AND nationalite_participant = 'ESP'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kilian' AND nom_participant = 'Revuelta' AND nationalite_participant = 'ESP'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kilian' AND nom_participant = 'Revuelta' AND nationalite_participant = 'ESP'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kilian' AND nom_participant = 'Revuelta' AND nationalite_participant = 'ESP'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kilian' AND nom_participant = 'Revuelta' AND nationalite_participant = 'ESP'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kilian' AND nom_participant = 'Revuelta' AND nationalite_participant = 'ESP'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kilian' AND nom_participant = 'Revuelta' AND nationalite_participant = 'ESP'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kilian' AND nom_participant = 'Revuelta' AND nationalite_participant = 'ESP'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kilian' AND nom_participant = 'Revuelta' AND nationalite_participant = 'ESP'))

    -- Montamarta Mercedes
    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Montamarta' AND nom_participant = 'Mercedes' AND nationalite_participant = 'ESP'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Montamarta' AND nom_participant = 'Mercedes' AND nationalite_participant = 'ESP'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Montamarta' AND nom_participant = 'Mercedes' AND nationalite_participant = 'ESP'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Montamarta' AND nom_participant = 'Mercedes' AND nationalite_participant = 'ESP'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Montamarta' AND nom_participant = 'Mercedes' AND nationalite_participant = 'ESP'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Montamarta' AND nom_participant = 'Mercedes' AND nationalite_participant = 'ESP'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Montamarta' AND nom_participant = 'Mercedes' AND nationalite_participant = 'ESP'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Montamarta' AND nom_participant = 'Mercedes' AND nationalite_participant = 'ESP'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Montamarta' AND nom_participant = 'Mercedes' AND nationalite_participant = 'ESP'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Montamarta' AND nom_participant = 'Mercedes' AND nationalite_participant = 'ESP'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Montamarta' AND nom_participant = 'Mercedes' AND nationalite_participant = 'ESP'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Montamarta' AND nom_participant = 'Mercedes' AND nationalite_participant = 'ESP'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Montamarta' AND nom_participant = 'Mercedes' AND nationalite_participant = 'ESP'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Montamarta' AND nom_participant = 'Mercedes' AND nationalite_participant = 'ESP'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Montamarta' AND nom_participant = 'Mercedes' AND nationalite_participant = 'ESP'))

    -- Carlos Santaolalla
    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Carlos' AND nom_participant = 'Santaolalla' AND nationalite_participant = 'ESP'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Carlos' AND nom_participant = 'Santaolalla' AND nationalite_participant = 'ESP'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Carlos' AND nom_participant = 'Santaolalla' AND nationalite_participant = 'ESP'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Carlos' AND nom_participant = 'Santaolalla' AND nationalite_participant = 'ESP'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Carlos' AND nom_participant = 'Santaolalla' AND nationalite_participant = 'ESP'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Carlos' AND nom_participant = 'Santaolalla' AND nationalite_participant = 'ESP'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Carlos' AND nom_participant = 'Santaolalla' AND nationalite_participant = 'ESP'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Carlos' AND nom_participant = 'Santaolalla' AND nationalite_participant = 'ESP'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Carlos' AND nom_participant = 'Santaolalla' AND nationalite_participant = 'ESP'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Carlos' AND nom_participant = 'Santaolalla' AND nationalite_participant = 'ESP'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Carlos' AND nom_participant = 'Santaolalla' AND nationalite_participant = 'ESP'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Carlos' AND nom_participant = 'Santaolalla' AND nationalite_participant = 'ESP'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Carlos' AND nom_participant = 'Santaolalla' AND nationalite_participant = 'ESP'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Carlos' AND nom_participant = 'Santaolalla' AND nationalite_participant = 'ESP'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Carlos' AND nom_participant = 'Santaolalla' AND nationalite_participant = 'ESP'))

    -- Sol I Juanola Aran
    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Sol I Juanola' AND nom_participant = 'Aran' AND nationalite_participant = 'ESP'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Sol I Juanola' AND nom_participant = 'Aran' AND nationalite_participant = 'ESP'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Sol I Juanola' AND nom_participant = 'Aran' AND nationalite_participant = 'ESP'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Sol I Juanola' AND nom_participant = 'Aran' AND nationalite_participant = 'ESP'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Sol I Juanola' AND nom_participant = 'Aran' AND nationalite_participant = 'ESP'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Sol I Juanola' AND nom_participant = 'Aran' AND nationalite_participant = 'ESP'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Sol I Juanola' AND nom_participant = 'Aran' AND nationalite_participant = 'ESP'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Sol I Juanola' AND nom_participant = 'Aran' AND nationalite_participant = 'ESP'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Sol I Juanola' AND nom_participant = 'Aran' AND nationalite_participant = 'ESP'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Sol I Juanola' AND nom_participant = 'Aran' AND nationalite_participant = 'ESP'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Sol I Juanola' AND nom_participant = 'Aran' AND nationalite_participant = 'ESP'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Sol I Juanola' AND nom_participant = 'Aran' AND nationalite_participant = 'ESP'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Sol I Juanola' AND nom_participant = 'Aran' AND nationalite_participant = 'ESP'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Sol I Juanola' AND nom_participant = 'Aran' AND nationalite_participant = 'ESP'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Sol I Juanola' AND nom_participant = 'Aran' AND nationalite_participant = 'ESP'))

    -- Nicola Feryn
    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Nicola' AND nom_participant = 'Feryn' AND nationalite_participant = 'BEL'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Nicola' AND nom_participant = 'Feryn' AND nationalite_participant = 'BEL'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Nicola' AND nom_participant = 'Feryn' AND nationalite_participant = 'BEL'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Nicola' AND nom_participant = 'Feryn' AND nationalite_participant = 'BEL'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Nicola' AND nom_participant = 'Feryn' AND nationalite_participant = 'BEL'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Nicola' AND nom_participant = 'Feryn' AND nationalite_participant = 'BEL'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Nicola' AND nom_participant = 'Feryn' AND nationalite_participant = 'BEL'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Nicola' AND nom_participant = 'Feryn' AND nationalite_participant = 'BEL'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Nicola' AND nom_participant = 'Feryn' AND nationalite_participant = 'BEL'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Nicola' AND nom_participant = 'Feryn' AND nationalite_participant = 'BEL'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Nicola' AND nom_participant = 'Feryn' AND nationalite_participant = 'BEL'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Nicola' AND nom_participant = 'Feryn' AND nationalite_participant = 'BEL'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Nicola' AND nom_participant = 'Feryn' AND nationalite_participant = 'BEL'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Nicola' AND nom_participant = 'Feryn' AND nationalite_participant = 'BEL'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Nicola' AND nom_participant = 'Feryn' AND nationalite_participant = 'BEL'))

    -- Kurt Keysers
    -- Sea Camp - Sea Camp
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 11),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kurt' AND nom_participant = 'Keysers' AND nationalite_participant = 'BEL'))

    -- Sea Camp - Sea Camp (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Sea Camp' AND distance_speciale = 603),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kurt' AND nom_participant = 'Keysers' AND nationalite_participant = 'BEL'))

    -- Sea Camp - Al-Ula
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Sea Camp - Al-Ula' AND distance_speciale = 589),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kurt' AND nom_participant = 'Keysers' AND nationalite_participant = 'BEL'))

    -- Al-Ula - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Ula - Haïl' AND distance_speciale = 669),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kurt' AND nom_participant = 'Keysers' AND nationalite_participant = 'BEL'))

    -- Haïl - Haïl
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 574),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kurt' AND nom_participant = 'Keysers' AND nationalite_participant = 'BEL'))

    -- Haïl - Haïl (autre enregistrement d'étape)
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Haïl' AND distance_speciale = 645),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kurt' AND nom_participant = 'Keysers' AND nationalite_participant = 'BEL'))

    -- Haïl - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Haïl - Riyad' AND distance_speciale = 918),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kurt' AND nom_participant = 'Keysers' AND nationalite_participant = 'BEL'))

    -- Riyad - Al-Duwadmi
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Al-Duwadmi' AND distance_speciale = 861),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kurt' AND nom_participant = 'Keysers' AND nationalite_participant = 'BEL'))

    -- Al-Duwadmi - Riyad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Duwadmi - Riyad' AND distance_speciale = 823),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kurt' AND nom_participant = 'Keysers' AND nationalite_participant = 'BEL'))

    -- Riyad - Harad
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Riyad - Harad' AND distance_speciale = 686),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kurt' AND nom_participant = 'Keysers' AND nationalite_participant = 'BEL'))

    -- Harad - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Harad - Shayba' AND distance_speciale = 624),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kurt' AND nom_participant = 'Keysers' AND nationalite_participant = 'BEL'))

    -- Shayba - Empty Quarter Marathon
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Empty Quarter Marathon' AND distance_speciale = 428),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kurt' AND nom_participant = 'Keysers' AND nationalite_participant = 'BEL'))

    -- Empty Quarter Marathon - Shayba
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Empty Quarter Marathon - Shayba' AND distance_speciale = 375),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kurt' AND nom_participant = 'Keysers' AND nationalite_participant = 'BEL'))

    -- Shayba - Al-Hufuf
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Shayba - Al-Hufuf' AND distance_speciale = 676),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kurt' AND nom_participant = 'Keysers' AND nationalite_participant = 'BEL'))

    -- Al-Hufuf - Dammam
    INTO P04_resultat VALUES
    (NULL,
     (SELECT id_speciale FROM P04_speciale
      WHERE nom_speciale = 'Al-Hufuf - Dammam' AND distance_speciale = 417),
    (SELECT id_participant FROM P04_participant
     WHERE prenom_participant = 'Kurt' AND nom_participant = 'Keysers' AND nationalite_participant = 'BEL'))
SELECT * FROM DUAL;





-------------

-- alimentation de P04_participe
INSERT ALL

    --moto
    -- Sam Sunderland
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Sam' AND nom_participant = 'Sunderland' AND nationalite_participant = 'GBR'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Sam' AND nom_participant = 'Sunderland' AND nationalite_participant = 'GBR'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Sam' AND nom_participant = 'Sunderland' AND nationalite_participant = 'GBR'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Sam' AND nom_participant = 'Sunderland' AND nationalite_participant = 'GBR'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Sam' AND nom_participant = 'Sunderland' AND nationalite_participant = 'GBR'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Sam' AND nom_participant = 'Sunderland' AND nationalite_participant = 'GBR'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Sam' AND nom_participant = 'Sunderland' AND nationalite_participant = 'GBR'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Sam' AND nom_participant = 'Sunderland' AND nationalite_participant = 'GBR'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Sam' AND nom_participant = 'Sunderland' AND nationalite_participant = 'GBR'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Sam' AND nom_participant = 'Sunderland' AND nationalite_participant = 'GBR'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Sam' AND nom_participant = 'Sunderland' AND nationalite_participant = 'GBR'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Sam' AND nom_participant = 'Sunderland' AND nationalite_participant = 'GBR'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Sam' AND nom_participant = 'Sunderland' AND nationalite_participant = 'GBR'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Sam' AND nom_participant = 'Sunderland' AND nationalite_participant = 'GBR'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Sam' AND nom_participant = 'Sunderland' AND nationalite_participant = 'GBR'))



INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Ricky' AND nom_participant = 'Brabec' AND nationalite_participant = 'USA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Ricky' AND nom_participant = 'Brabec' AND nationalite_participant = 'USA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Ricky' AND nom_participant = 'Brabec' AND nationalite_participant = 'USA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Ricky' AND nom_participant = 'Brabec' AND nationalite_participant = 'USA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Ricky' AND nom_participant = 'Brabec' AND nationalite_participant = 'USA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Ricky' AND nom_participant = 'Brabec' AND nationalite_participant = 'USA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Ricky' AND nom_participant = 'Brabec' AND nationalite_participant = 'USA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Ricky' AND nom_participant = 'Brabec' AND nationalite_participant = 'USA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Ricky' AND nom_participant = 'Brabec' AND nationalite_participant = 'USA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Ricky' AND nom_participant = 'Brabec' AND nationalite_participant = 'USA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Ricky' AND nom_participant = 'Brabec' AND nationalite_participant = 'USA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Ricky' AND nom_participant = 'Brabec' AND nationalite_participant = 'USA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Ricky' AND nom_participant = 'Brabec' AND nationalite_participant = 'USA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Ricky' AND nom_participant = 'Brabec' AND nationalite_participant = 'USA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Ricky' AND nom_participant = 'Brabec' AND nationalite_participant = 'USA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Joan' AND nom_participant = 'Barreda Bort' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Joan' AND nom_participant = 'Barreda Bort' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Joan' AND nom_participant = 'Barreda Bort' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Joan' AND nom_participant = 'Barreda Bort' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Joan' AND nom_participant = 'Barreda Bort' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Joan' AND nom_participant = 'Barreda Bort' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Joan' AND nom_participant = 'Barreda Bort' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Joan' AND nom_participant = 'Barreda Bort' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Joan' AND nom_participant = 'Barreda Bort' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Joan' AND nom_participant = 'Barreda Bort' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Joan' AND nom_participant = 'Barreda Bort' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Joan' AND nom_participant = 'Barreda Bort' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Joan' AND nom_participant = 'Barreda Bort' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Joan' AND nom_participant = 'Barreda Bort' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Joan' AND nom_participant = 'Barreda Bort' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Pablo' AND nom_participant = 'Quintanilla' AND nationalite_participant = 'CHL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Pablo' AND nom_participant = 'Quintanilla' AND nationalite_participant = 'CHL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Pablo' AND nom_participant = 'Quintanilla' AND nationalite_participant = 'CHL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Pablo' AND nom_participant = 'Quintanilla' AND nationalite_participant = 'CHL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Pablo' AND nom_participant = 'Quintanilla' AND nationalite_participant = 'CHL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Pablo' AND nom_participant = 'Quintanilla' AND nationalite_participant = 'CHL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Pablo' AND nom_participant = 'Quintanilla' AND nationalite_participant = 'CHL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Pablo' AND nom_participant = 'Quintanilla' AND nationalite_participant = 'CHL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Pablo' AND nom_participant = 'Quintanilla' AND nationalite_participant = 'CHL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Pablo' AND nom_participant = 'Quintanilla' AND nationalite_participant = 'CHL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Pablo' AND nom_participant = 'Quintanilla' AND nationalite_participant = 'CHL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Pablo' AND nom_participant = 'Quintanilla' AND nationalite_participant = 'CHL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Pablo' AND nom_participant = 'Quintanilla' AND nationalite_participant = 'CHL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Pablo' AND nom_participant = 'Quintanilla' AND nationalite_participant = 'CHL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Pablo' AND nom_participant = 'Quintanilla' AND nationalite_participant = 'CHL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Toby' AND nom_participant = 'Price' AND nationalite_participant = 'AUS'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Toby' AND nom_participant = 'Price' AND nationalite_participant = 'AUS'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Toby' AND nom_participant = 'Price' AND nationalite_participant = 'AUS'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Toby' AND nom_participant = 'Price' AND nationalite_participant = 'AUS'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Toby' AND nom_participant = 'Price' AND nationalite_participant = 'AUS'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Toby' AND nom_participant = 'Price' AND nationalite_participant = 'AUS'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Toby' AND nom_participant = 'Price' AND nationalite_participant = 'AUS'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Toby' AND nom_participant = 'Price' AND nationalite_participant = 'AUS'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Toby' AND nom_participant = 'Price' AND nationalite_participant = 'AUS'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Toby' AND nom_participant = 'Price' AND nationalite_participant = 'AUS'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Toby' AND nom_participant = 'Price' AND nationalite_participant = 'AUS'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Toby' AND nom_participant = 'Price' AND nationalite_participant = 'AUS'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Toby' AND nom_participant = 'Price' AND nationalite_participant = 'AUS'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Toby' AND nom_participant = 'Price' AND nationalite_participant = 'AUS'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Toby' AND nom_participant = 'Price' AND nationalite_participant = 'AUS'))



-- auto

INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Nasser' AND nom_participant = 'Al-Attiyah' AND nationalite_participant = 'QAT'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Nasser' AND nom_participant = 'Al-Attiyah' AND nationalite_participant = 'QAT'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Nasser' AND nom_participant = 'Al-Attiyah' AND nationalite_participant = 'QAT'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Nasser' AND nom_participant = 'Al-Attiyah' AND nationalite_participant = 'QAT'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Nasser' AND nom_participant = 'Al-Attiyah' AND nationalite_participant = 'QAT'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Nasser' AND nom_participant = 'Al-Attiyah' AND nationalite_participant = 'QAT'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Nasser' AND nom_participant = 'Al-Attiyah' AND nationalite_participant = 'QAT'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Nasser' AND nom_participant = 'Al-Attiyah' AND nationalite_participant = 'QAT'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Nasser' AND nom_participant = 'Al-Attiyah' AND nationalite_participant = 'QAT'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Nasser' AND nom_participant = 'Al-Attiyah' AND nationalite_participant = 'QAT'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Nasser' AND nom_participant = 'Al-Attiyah' AND nationalite_participant = 'QAT'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Nasser' AND nom_participant = 'Al-Attiyah' AND nationalite_participant = 'QAT'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Nasser' AND nom_participant = 'Al-Attiyah' AND nationalite_participant = 'QAT'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Nasser' AND nom_participant = 'Al-Attiyah' AND nationalite_participant = 'QAT'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Nasser' AND nom_participant = 'Al-Attiyah' AND nationalite_participant = 'QAT'))

INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Mathieu' AND nom_participant = 'Baumel' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Mathieu' AND nom_participant = 'Baumel' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Mathieu' AND nom_participant = 'Baumel' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Mathieu' AND nom_participant = 'Baumel' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Mathieu' AND nom_participant = 'Baumel' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Mathieu' AND nom_participant = 'Baumel' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Mathieu' AND nom_participant = 'Baumel' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Mathieu' AND nom_participant = 'Baumel' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Mathieu' AND nom_participant = 'Baumel' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Mathieu' AND nom_participant = 'Baumel' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Mathieu' AND nom_participant = 'Baumel' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Mathieu' AND nom_participant = 'Baumel' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Mathieu' AND nom_participant = 'Baumel' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Mathieu' AND nom_participant = 'Baumel' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Mathieu' AND nom_participant = 'Baumel' AND nationalite_participant = 'FRA'))

INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Sebastien' AND nom_participant = 'Loeb' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Sebastien' AND nom_participant = 'Loeb' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Sebastien' AND nom_participant = 'Loeb' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Sebastien' AND nom_participant = 'Loeb' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Sebastien' AND nom_participant = 'Loeb' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Sebastien' AND nom_participant = 'Loeb' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Sebastien' AND nom_participant = 'Loeb' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Sebastien' AND nom_participant = 'Loeb' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Sebastien' AND nom_participant = 'Loeb' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Sebastien' AND nom_participant = 'Loeb' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Sebastien' AND nom_participant = 'Loeb' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Sebastien' AND nom_participant = 'Loeb' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Sebastien' AND nom_participant = 'Loeb' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Sebastien' AND nom_participant = 'Loeb' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Sebastien' AND nom_participant = 'Loeb' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Fabian' AND nom_participant = 'Lurquin' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Fabian' AND nom_participant = 'Lurquin' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Fabian' AND nom_participant = 'Lurquin' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Fabian' AND nom_participant = 'Lurquin' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Fabian' AND nom_participant = 'Lurquin' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Fabian' AND nom_participant = 'Lurquin' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Fabian' AND nom_participant = 'Lurquin' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Fabian' AND nom_participant = 'Lurquin' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Fabian' AND nom_participant = 'Lurquin' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Fabian' AND nom_participant = 'Lurquin' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Fabian' AND nom_participant = 'Lurquin' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Fabian' AND nom_participant = 'Lurquin' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Fabian' AND nom_participant = 'Lurquin' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Fabian' AND nom_participant = 'Lurquin' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Fabian' AND nom_participant = 'Lurquin' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Yazeed' AND nom_participant = 'Al Rajhi' AND nationalite_participant = 'SAU'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Yazeed' AND nom_participant = 'Al Rajhi' AND nationalite_participant = 'SAU'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Yazeed' AND nom_participant = 'Al Rajhi' AND nationalite_participant = 'SAU'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Yazeed' AND nom_participant = 'Al Rajhi' AND nationalite_participant = 'SAU'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Yazeed' AND nom_participant = 'Al Rajhi' AND nationalite_participant = 'SAU'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Yazeed' AND nom_participant = 'Al Rajhi' AND nationalite_participant = 'SAU'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Yazeed' AND nom_participant = 'Al Rajhi' AND nationalite_participant = 'SAU'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Yazeed' AND nom_participant = 'Al Rajhi' AND nationalite_participant = 'SAU'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Yazeed' AND nom_participant = 'Al Rajhi' AND nationalite_participant = 'SAU'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Yazeed' AND nom_participant = 'Al Rajhi' AND nationalite_participant = 'SAU'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Yazeed' AND nom_participant = 'Al Rajhi' AND nationalite_participant = 'SAU'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Yazeed' AND nom_participant = 'Al Rajhi' AND nationalite_participant = 'SAU'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Yazeed' AND nom_participant = 'Al Rajhi' AND nationalite_participant = 'SAU'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Yazeed' AND nom_participant = 'Al Rajhi' AND nationalite_participant = 'SAU'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Yazeed' AND nom_participant = 'Al Rajhi' AND nationalite_participant = 'SAU'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Michael' AND nom_participant = 'Orr' AND nationalite_participant = 'GBR'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Michael' AND nom_participant = 'Orr' AND nationalite_participant = 'GBR'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Michael' AND nom_participant = 'Orr' AND nationalite_participant = 'GBR'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Michael' AND nom_participant = 'Orr' AND nationalite_participant = 'GBR'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Michael' AND nom_participant = 'Orr' AND nationalite_participant = 'GBR'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Michael' AND nom_participant = 'Orr' AND nationalite_participant = 'GBR'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Michael' AND nom_participant = 'Orr' AND nationalite_participant = 'GBR'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Michael' AND nom_participant = 'Orr' AND nationalite_participant = 'GBR'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Michael' AND nom_participant = 'Orr' AND nationalite_participant = 'GBR'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Michael' AND nom_participant = 'Orr' AND nationalite_participant = 'GBR'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Michael' AND nom_participant = 'Orr' AND nationalite_participant = 'GBR'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Michael' AND nom_participant = 'Orr' AND nationalite_participant = 'GBR'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Michael' AND nom_participant = 'Orr' AND nationalite_participant = 'GBR'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Michael' AND nom_participant = 'Orr' AND nationalite_participant = 'GBR'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Michael' AND nom_participant = 'Orr' AND nationalite_participant = 'GBR'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Jakub' AND nom_participant = 'Przygonski' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Jakub' AND nom_participant = 'Przygonski' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Jakub' AND nom_participant = 'Przygonski' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Jakub' AND nom_participant = 'Przygonski' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Jakub' AND nom_participant = 'Przygonski' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Jakub' AND nom_participant = 'Przygonski' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Jakub' AND nom_participant = 'Przygonski' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Jakub' AND nom_participant = 'Przygonski' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Jakub' AND nom_participant = 'Przygonski' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Jakub' AND nom_participant = 'Przygonski' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Jakub' AND nom_participant = 'Przygonski' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Jakub' AND nom_participant = 'Przygonski' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Jakub' AND nom_participant = 'Przygonski' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Jakub' AND nom_participant = 'Przygonski' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Jakub' AND nom_participant = 'Przygonski' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Armand' AND nom_participant = 'Monleon' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Armand' AND nom_participant = 'Monleon' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Armand' AND nom_participant = 'Monleon' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Armand' AND nom_participant = 'Monleon' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Armand' AND nom_participant = 'Monleon' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Armand' AND nom_participant = 'Monleon' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Armand' AND nom_participant = 'Monleon' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Armand' AND nom_participant = 'Monleon' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Armand' AND nom_participant = 'Monleon' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Armand' AND nom_participant = 'Monleon' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Armand' AND nom_participant = 'Monleon' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Armand' AND nom_participant = 'Monleon' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Armand' AND nom_participant = 'Monleon' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Armand' AND nom_participant = 'Monleon' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Armand' AND nom_participant = 'Monleon' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Stéphane' AND nom_participant = 'Peterhansel' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Stéphane' AND nom_participant = 'Peterhansel' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Stéphane' AND nom_participant = 'Peterhansel' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Stéphane' AND nom_participant = 'Peterhansel' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Stéphane' AND nom_participant = 'Peterhansel' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Stéphane' AND nom_participant = 'Peterhansel' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Stéphane' AND nom_participant = 'Peterhansel' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Stéphane' AND nom_participant = 'Peterhansel' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Stéphane' AND nom_participant = 'Peterhansel' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Stéphane' AND nom_participant = 'Peterhansel' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Stéphane' AND nom_participant = 'Peterhansel' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Stéphane' AND nom_participant = 'Peterhansel' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Stéphane' AND nom_participant = 'Peterhansel' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Stéphane' AND nom_participant = 'Peterhansel' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Stéphane' AND nom_participant = 'Peterhansel' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Edouard' AND nom_participant = 'Boulanger' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Edouard' AND nom_participant = 'Boulanger' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Edouard' AND nom_participant = 'Boulanger' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Edouard' AND nom_participant = 'Boulanger' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Edouard' AND nom_participant = 'Boulanger' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Edouard' AND nom_participant = 'Boulanger' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Edouard' AND nom_participant = 'Boulanger' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Edouard' AND nom_participant = 'Boulanger' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Edouard' AND nom_participant = 'Boulanger' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Edouard' AND nom_participant = 'Boulanger' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Edouard' AND nom_participant = 'Boulanger' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Edouard' AND nom_participant = 'Boulanger' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Edouard' AND nom_participant = 'Boulanger' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Edouard' AND nom_participant = 'Boulanger' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Edouard' AND nom_participant = 'Boulanger' AND nationalite_participant = 'FRA'))




--quad



INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Alexandre' AND nom_participant = 'Giroud' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Alexandre' AND nom_participant = 'Giroud' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Alexandre' AND nom_participant = 'Giroud' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Alexandre' AND nom_participant = 'Giroud' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Alexandre' AND nom_participant = 'Giroud' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Alexandre' AND nom_participant = 'Giroud' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Alexandre' AND nom_participant = 'Giroud' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Alexandre' AND nom_participant = 'Giroud' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Alexandre' AND nom_participant = 'Giroud' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Alexandre' AND nom_participant = 'Giroud' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Alexandre' AND nom_participant = 'Giroud' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Alexandre' AND nom_participant = 'Giroud' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Alexandre' AND nom_participant = 'Giroud' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Alexandre' AND nom_participant = 'Giroud' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Alexandre' AND nom_participant = 'Giroud' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Manuel' AND nom_participant = 'Andujar' AND nationalite_participant = 'ARG'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Manuel' AND nom_participant = 'Andujar' AND nationalite_participant = 'ARG'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Manuel' AND nom_participant = 'Andujar' AND nationalite_participant = 'ARG'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Manuel' AND nom_participant = 'Andujar' AND nationalite_participant = 'ARG'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Manuel' AND nom_participant = 'Andujar' AND nationalite_participant = 'ARG'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Manuel' AND nom_participant = 'Andujar' AND nationalite_participant = 'ARG'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Manuel' AND nom_participant = 'Andujar' AND nationalite_participant = 'ARG'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Manuel' AND nom_participant = 'Andujar' AND nationalite_participant = 'ARG'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Manuel' AND nom_participant = 'Andujar' AND nationalite_participant = 'ARG'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Manuel' AND nom_participant = 'Andujar' AND nationalite_participant = 'ARG'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Manuel' AND nom_participant = 'Andujar' AND nationalite_participant = 'ARG'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Manuel' AND nom_participant = 'Andujar' AND nationalite_participant = 'ARG'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Manuel' AND nom_participant = 'Andujar' AND nationalite_participant = 'ARG'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Manuel' AND nom_participant = 'Andujar' AND nationalite_participant = 'ARG'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Manuel' AND nom_participant = 'Andujar' AND nationalite_participant = 'ARG'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Juraj' AND nom_participant = 'Varga' AND nationalite_participant = 'SVK'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Juraj' AND nom_participant = 'Varga' AND nationalite_participant = 'SVK'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Juraj' AND nom_participant = 'Varga' AND nationalite_participant = 'SVK'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Juraj' AND nom_participant = 'Varga' AND nationalite_participant = 'SVK'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Juraj' AND nom_participant = 'Varga' AND nationalite_participant = 'SVK'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Juraj' AND nom_participant = 'Varga' AND nationalite_participant = 'SVK'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Juraj' AND nom_participant = 'Varga' AND nationalite_participant = 'SVK'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Juraj' AND nom_participant = 'Varga' AND nationalite_participant = 'SVK'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Juraj' AND nom_participant = 'Varga' AND nationalite_participant = 'SVK'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Juraj' AND nom_participant = 'Varga' AND nationalite_participant = 'SVK'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Juraj' AND nom_participant = 'Varga' AND nationalite_participant = 'SVK'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Juraj' AND nom_participant = 'Varga' AND nationalite_participant = 'SVK'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Juraj' AND nom_participant = 'Varga' AND nationalite_participant = 'SVK'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Juraj' AND nom_participant = 'Varga' AND nationalite_participant = 'SVK'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Juraj' AND nom_participant = 'Varga' AND nationalite_participant = 'SVK'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Francisco' AND nom_participant = 'Moreno Flores' AND nationalite_participant = 'ARG'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Francisco' AND nom_participant = 'Moreno Flores' AND nationalite_participant = 'ARG'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Francisco' AND nom_participant = 'Moreno Flores' AND nationalite_participant = 'ARG'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Francisco' AND nom_participant = 'Moreno Flores' AND nationalite_participant = 'ARG'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Francisco' AND nom_participant = 'Moreno Flores' AND nationalite_participant = 'ARG'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Francisco' AND nom_participant = 'Moreno Flores' AND nationalite_participant = 'ARG'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Francisco' AND nom_participant = 'Moreno Flores' AND nationalite_participant = 'ARG'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Francisco' AND nom_participant = 'Moreno Flores' AND nationalite_participant = 'ARG'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Francisco' AND nom_participant = 'Moreno Flores' AND nationalite_participant = 'ARG'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Francisco' AND nom_participant = 'Moreno Flores' AND nationalite_participant = 'ARG'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Francisco' AND nom_participant = 'Moreno Flores' AND nationalite_participant = 'ARG'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Francisco' AND nom_participant = 'Moreno Flores' AND nationalite_participant = 'ARG'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Francisco' AND nom_participant = 'Moreno Flores' AND nationalite_participant = 'ARG'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Francisco' AND nom_participant = 'Moreno Flores' AND nationalite_participant = 'ARG'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Francisco' AND nom_participant = 'Moreno Flores' AND nationalite_participant = 'ARG'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kamil' AND nom_participant = 'Wisniewski' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kamil' AND nom_participant = 'Wisniewski' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kamil' AND nom_participant = 'Wisniewski' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kamil' AND nom_participant = 'Wisniewski' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kamil' AND nom_participant = 'Wisniewski' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kamil' AND nom_participant = 'Wisniewski' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kamil' AND nom_participant = 'Wisniewski' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kamil' AND nom_participant = 'Wisniewski' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kamil' AND nom_participant = 'Wisniewski' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kamil' AND nom_participant = 'Wisniewski' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kamil' AND nom_participant = 'Wisniewski' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kamil' AND nom_participant = 'Wisniewski' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kamil' AND nom_participant = 'Wisniewski' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kamil' AND nom_participant = 'Wisniewski' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kamil' AND nom_participant = 'Wisniewski' AND nationalite_participant = 'POL'))


--camion
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kees' AND nom_participant = 'Koolen' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kees' AND nom_participant = 'Koolen' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kees' AND nom_participant = 'Koolen' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kees' AND nom_participant = 'Koolen' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kees' AND nom_participant = 'Koolen' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kees' AND nom_participant = 'Koolen' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kees' AND nom_participant = 'Koolen' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kees' AND nom_participant = 'Koolen' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kees' AND nom_participant = 'Koolen' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kees' AND nom_participant = 'Koolen' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kees' AND nom_participant = 'Koolen' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kees' AND nom_participant = 'Koolen' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kees' AND nom_participant = 'Koolen' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kees' AND nom_participant = 'Koolen' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kees' AND nom_participant = 'Koolen' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Wouter' AND nom_participant = 'de Graaff' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Wouter' AND nom_participant = 'de Graaff' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Wouter' AND nom_participant = 'de Graaff' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Wouter' AND nom_participant = 'de Graaff' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Wouter' AND nom_participant = 'de Graaff' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Wouter' AND nom_participant = 'de Graaff' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Wouter' AND nom_participant = 'de Graaff' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Wouter' AND nom_participant = 'de Graaff' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Wouter' AND nom_participant = 'de Graaff' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Wouter' AND nom_participant = 'de Graaff' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Wouter' AND nom_participant = 'de Graaff' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Wouter' AND nom_participant = 'de Graaff' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Wouter' AND nom_participant = 'de Graaff' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Wouter' AND nom_participant = 'de Graaff' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Wouter' AND nom_participant = 'de Graaff' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Martin' AND nom_participant = 'Macik' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Martin' AND nom_participant = 'Macik' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Martin' AND nom_participant = 'Macik' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Martin' AND nom_participant = 'Macik' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Martin' AND nom_participant = 'Macik' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Martin' AND nom_participant = 'Macik' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Martin' AND nom_participant = 'Macik' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Martin' AND nom_participant = 'Macik' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Martin' AND nom_participant = 'Macik' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Martin' AND nom_participant = 'Macik' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Martin' AND nom_participant = 'Macik' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Martin' AND nom_participant = 'Macik' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Martin' AND nom_participant = 'Macik' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Martin' AND nom_participant = 'Macik' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Martin' AND nom_participant = 'Macik' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Frantisek' AND nom_participant = 'Tomasek' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Frantisek' AND nom_participant = 'Tomasek' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Frantisek' AND nom_participant = 'Tomasek' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Frantisek' AND nom_participant = 'Tomasek' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Frantisek' AND nom_participant = 'Tomasek' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Frantisek' AND nom_participant = 'Tomasek' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Frantisek' AND nom_participant = 'Tomasek' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Frantisek' AND nom_participant = 'Tomasek' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Frantisek' AND nom_participant = 'Tomasek' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Frantisek' AND nom_participant = 'Tomasek' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Frantisek' AND nom_participant = 'Tomasek' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Frantisek' AND nom_participant = 'Tomasek' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Frantisek' AND nom_participant = 'Tomasek' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Frantisek' AND nom_participant = 'Tomasek' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Frantisek' AND nom_participant = 'Tomasek' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Janus' AND nom_participant = 'van Kasteren' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Janus' AND nom_participant = 'van Kasteren' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Janus' AND nom_participant = 'van Kasteren' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Janus' AND nom_participant = 'van Kasteren' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Janus' AND nom_participant = 'van Kasteren' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Janus' AND nom_participant = 'van Kasteren' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Janus' AND nom_participant = 'van Kasteren' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Janus' AND nom_participant = 'van Kasteren' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Janus' AND nom_participant = 'van Kasteren' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Janus' AND nom_participant = 'van Kasteren' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Janus' AND nom_participant = 'van Kasteren' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Janus' AND nom_participant = 'van Kasteren' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Janus' AND nom_participant = 'van Kasteren' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Janus' AND nom_participant = 'van Kasteren' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Janus' AND nom_participant = 'van Kasteren' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Darek' AND nom_participant = 'Rodewald' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Darek' AND nom_participant = 'Rodewald' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Darek' AND nom_participant = 'Rodewald' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Darek' AND nom_participant = 'Rodewald' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Darek' AND nom_participant = 'Rodewald' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Darek' AND nom_participant = 'Rodewald' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Darek' AND nom_participant = 'Rodewald' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Darek' AND nom_participant = 'Rodewald' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Darek' AND nom_participant = 'Rodewald' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Darek' AND nom_participant = 'Rodewald' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Darek' AND nom_participant = 'Rodewald' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Darek' AND nom_participant = 'Rodewald' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Darek' AND nom_participant = 'Rodewald' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Darek' AND nom_participant = 'Rodewald' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Darek' AND nom_participant = 'Rodewald' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Martin' AND nom_participant = 'Soltys' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Martin' AND nom_participant = 'Soltys' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Martin' AND nom_participant = 'Soltys' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Martin' AND nom_participant = 'Soltys' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Martin' AND nom_participant = 'Soltys' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Martin' AND nom_participant = 'Soltys' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Martin' AND nom_participant = 'Soltys' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Martin' AND nom_participant = 'Soltys' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Martin' AND nom_participant = 'Soltys' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Martin' AND nom_participant = 'Soltys' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Martin' AND nom_participant = 'Soltys' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Martin' AND nom_participant = 'Soltys' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Martin' AND nom_participant = 'Soltys' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Martin' AND nom_participant = 'Soltys' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Martin' AND nom_participant = 'Soltys' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Roman' AND nom_participant = 'Krejci' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Roman' AND nom_participant = 'Krejci' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Roman' AND nom_participant = 'Krejci' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Roman' AND nom_participant = 'Krejci' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Roman' AND nom_participant = 'Krejci' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Roman' AND nom_participant = 'Krejci' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Roman' AND nom_participant = 'Krejci' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Roman' AND nom_participant = 'Krejci' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Roman' AND nom_participant = 'Krejci' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Roman' AND nom_participant = 'Krejci' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Roman' AND nom_participant = 'Krejci' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Roman' AND nom_participant = 'Krejci' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Roman' AND nom_participant = 'Krejci' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Roman' AND nom_participant = 'Krejci' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Roman' AND nom_participant = 'Krejci' AND nationalite_participant = 'CZE'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Victor Willem' AND nom_participant = 'Versteijnen' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Victor Willem' AND nom_participant = 'Versteijnen' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Victor Willem' AND nom_participant = 'Versteijnen' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Victor Willem' AND nom_participant = 'Versteijnen' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Victor Willem' AND nom_participant = 'Versteijnen' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Victor Willem' AND nom_participant = 'Versteijnen' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Victor Willem' AND nom_participant = 'Versteijnen' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Victor Willem' AND nom_participant = 'Versteijnen' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Victor Willem' AND nom_participant = 'Versteijnen' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Victor Willem' AND nom_participant = 'Versteijnen' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Victor Willem' AND nom_participant = 'Versteijnen' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Victor Willem' AND nom_participant = 'Versteijnen' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Victor Willem' AND nom_participant = 'Versteijnen' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Victor Willem' AND nom_participant = 'Versteijnen' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Victor Willem' AND nom_participant = 'Versteijnen' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Andreas Wilhelm Michiel Marius' AND nom_participant = 'van der Sande' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Andreas Wilhelm Michiel Marius' AND nom_participant = 'van der Sande' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Andreas Wilhelm Michiel Marius' AND nom_participant = 'van der Sande' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Andreas Wilhelm Michiel Marius' AND nom_participant = 'van der Sande' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Andreas Wilhelm Michiel Marius' AND nom_participant = 'van der Sande' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Andreas Wilhelm Michiel Marius' AND nom_participant = 'van der Sande' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Andreas Wilhelm Michiel Marius' AND nom_participant = 'van der Sande' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Andreas Wilhelm Michiel Marius' AND nom_participant = 'van der Sande' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Andreas Wilhelm Michiel Marius' AND nom_participant = 'van der Sande' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Andreas Wilhelm Michiel Marius' AND nom_participant = 'van der Sande' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Andreas Wilhelm Michiel Marius' AND nom_participant = 'van der Sande' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Andreas Wilhelm Michiel Marius' AND nom_participant = 'van der Sande' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Andreas Wilhelm Michiel Marius' AND nom_participant = 'van der Sande' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Andreas Wilhelm Michiel Marius' AND nom_participant = 'van der Sande' AND nationalite_participant = 'NLD'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Andreas Wilhelm Michiel Marius' AND nom_participant = 'van der Sande' AND nationalite_participant = 'NLD'))


                   --proto leger

INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Francisco' AND nom_participant = 'Lopez Contardo' AND nationalite_participant = 'CHL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Francisco' AND nom_participant = 'Lopez Contardo' AND nationalite_participant = 'CHL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Francisco' AND nom_participant = 'Lopez Contardo' AND nationalite_participant = 'CHL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Francisco' AND nom_participant = 'Lopez Contardo' AND nationalite_participant = 'CHL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Francisco' AND nom_participant = 'Lopez Contardo' AND nationalite_participant = 'CHL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Francisco' AND nom_participant = 'Lopez Contardo' AND nationalite_participant = 'CHL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Francisco' AND nom_participant = 'Lopez Contardo' AND nationalite_participant = 'CHL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Francisco' AND nom_participant = 'Lopez Contardo' AND nationalite_participant = 'CHL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Francisco' AND nom_participant = 'Lopez Contardo' AND nationalite_participant = 'CHL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Francisco' AND nom_participant = 'Lopez Contardo' AND nationalite_participant = 'CHL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Francisco' AND nom_participant = 'Lopez Contardo' AND nationalite_participant = 'CHL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Francisco' AND nom_participant = 'Lopez Contardo' AND nationalite_participant = 'CHL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Francisco' AND nom_participant = 'Lopez Contardo' AND nationalite_participant = 'CHL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Francisco' AND nom_participant = 'Lopez Contardo' AND nationalite_participant = 'CHL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Francisco' AND nom_participant = 'Lopez Contardo' AND nationalite_participant = 'CHL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Juan Pablo' AND nom_participant = 'Latrach Vinagre' AND nationalite_participant = 'CHL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Juan Pablo' AND nom_participant = 'Latrach Vinagre' AND nationalite_participant = 'CHL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Juan Pablo' AND nom_participant = 'Latrach Vinagre' AND nationalite_participant = 'CHL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Juan Pablo' AND nom_participant = 'Latrach Vinagre' AND nationalite_participant = 'CHL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Juan Pablo' AND nom_participant = 'Latrach Vinagre' AND nationalite_participant = 'CHL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Juan Pablo' AND nom_participant = 'Latrach Vinagre' AND nationalite_participant = 'CHL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Juan Pablo' AND nom_participant = 'Latrach Vinagre' AND nationalite_participant = 'CHL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Juan Pablo' AND nom_participant = 'Latrach Vinagre' AND nationalite_participant = 'CHL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Juan Pablo' AND nom_participant = 'Latrach Vinagre' AND nationalite_participant = 'CHL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Juan Pablo' AND nom_participant = 'Latrach Vinagre' AND nationalite_participant = 'CHL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Juan Pablo' AND nom_participant = 'Latrach Vinagre' AND nationalite_participant = 'CHL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Juan Pablo' AND nom_participant = 'Latrach Vinagre' AND nationalite_participant = 'CHL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Juan Pablo' AND nom_participant = 'Latrach Vinagre' AND nationalite_participant = 'CHL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Juan Pablo' AND nom_participant = 'Latrach Vinagre' AND nationalite_participant = 'CHL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Juan Pablo' AND nom_participant = 'Latrach Vinagre' AND nationalite_participant = 'CHL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Seth' AND nom_participant = 'Quintero' AND nationalite_participant = 'USA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Seth' AND nom_participant = 'Quintero' AND nationalite_participant = 'USA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Seth' AND nom_participant = 'Quintero' AND nationalite_participant = 'USA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Seth' AND nom_participant = 'Quintero' AND nationalite_participant = 'USA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Seth' AND nom_participant = 'Quintero' AND nationalite_participant = 'USA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Seth' AND nom_participant = 'Quintero' AND nationalite_participant = 'USA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Seth' AND nom_participant = 'Quintero' AND nationalite_participant = 'USA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Seth' AND nom_participant = 'Quintero' AND nationalite_participant = 'USA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Seth' AND nom_participant = 'Quintero' AND nationalite_participant = 'USA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Seth' AND nom_participant = 'Quintero' AND nationalite_participant = 'USA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Seth' AND nom_participant = 'Quintero' AND nationalite_participant = 'USA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Seth' AND nom_participant = 'Quintero' AND nationalite_participant = 'USA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Seth' AND nom_participant = 'Quintero' AND nationalite_participant = 'USA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Seth' AND nom_participant = 'Quintero' AND nationalite_participant = 'USA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Seth' AND nom_participant = 'Quintero' AND nationalite_participant = 'USA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Dennis' AND nom_participant = 'Zenz' AND nationalite_participant = 'DEU'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Dennis' AND nom_participant = 'Zenz' AND nationalite_participant = 'DEU'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Dennis' AND nom_participant = 'Zenz' AND nationalite_participant = 'DEU'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Dennis' AND nom_participant = 'Zenz' AND nationalite_participant = 'DEU'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Dennis' AND nom_participant = 'Zenz' AND nationalite_participant = 'DEU'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Dennis' AND nom_participant = 'Zenz' AND nationalite_participant = 'DEU'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Dennis' AND nom_participant = 'Zenz' AND nationalite_participant = 'DEU'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Dennis' AND nom_participant = 'Zenz' AND nationalite_participant = 'DEU'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Dennis' AND nom_participant = 'Zenz' AND nationalite_participant = 'DEU'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Dennis' AND nom_participant = 'Zenz' AND nationalite_participant = 'DEU'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Dennis' AND nom_participant = 'Zenz' AND nationalite_participant = 'DEU'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Dennis' AND nom_participant = 'Zenz' AND nationalite_participant = 'DEU'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Dennis' AND nom_participant = 'Zenz' AND nationalite_participant = 'DEU'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Dennis' AND nom_participant = 'Zenz' AND nationalite_participant = 'DEU'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Dennis' AND nom_participant = 'Zenz' AND nationalite_participant = 'DEU'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Cristina' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Cristina' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Cristina' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Cristina' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Cristina' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Cristina' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Cristina' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Cristina' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Cristina' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Cristina' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Cristina' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Cristina' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Cristina' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Cristina' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Cristina' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Pablo Moreno Huete' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Pablo Moreno Huete' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Pablo Moreno Huete' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Pablo Moreno Huete' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Pablo Moreno Huete' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Pablo Moreno Huete' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Pablo Moreno Huete' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Pablo Moreno Huete' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Pablo Moreno Huete' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Pablo Moreno Huete' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Pablo Moreno Huete' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Pablo Moreno Huete' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Pablo Moreno Huete' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Pablo Moreno Huete' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Pablo Moreno Huete' AND nom_participant = 'Gutierrez Herrero' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Austin' AND nom_participant = 'Jones' AND nationalite_participant = 'USA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Austin' AND nom_participant = 'Jones' AND nationalite_participant = 'USA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Austin' AND nom_participant = 'Jones' AND nationalite_participant = 'USA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Austin' AND nom_participant = 'Jones' AND nationalite_participant = 'USA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Austin' AND nom_participant = 'Jones' AND nationalite_participant = 'USA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Austin' AND nom_participant = 'Jones' AND nationalite_participant = 'USA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Austin' AND nom_participant = 'Jones' AND nationalite_participant = 'USA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Austin' AND nom_participant = 'Jones' AND nationalite_participant = 'USA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Austin' AND nom_participant = 'Jones' AND nationalite_participant = 'USA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Austin' AND nom_participant = 'Jones' AND nationalite_participant = 'USA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Austin' AND nom_participant = 'Jones' AND nationalite_participant = 'USA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Austin' AND nom_participant = 'Jones' AND nationalite_participant = 'USA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Austin' AND nom_participant = 'Jones' AND nationalite_participant = 'USA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Austin' AND nom_participant = 'Jones' AND nationalite_participant = 'USA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Austin' AND nom_participant = 'Jones' AND nationalite_participant = 'USA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Gustavo' AND nom_participant = 'Guglelmin' AND nationalite_participant = 'BRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Gustavo' AND nom_participant = 'Guglelmin' AND nationalite_participant = 'BRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Gustavo' AND nom_participant = 'Guglelmin' AND nationalite_participant = 'BRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Gustavo' AND nom_participant = 'Guglelmin' AND nationalite_participant = 'BRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Gustavo' AND nom_participant = 'Guglelmin' AND nationalite_participant = 'BRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Gustavo' AND nom_participant = 'Guglelmin' AND nationalite_participant = 'BRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Gustavo' AND nom_participant = 'Guglelmin' AND nationalite_participant = 'BRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Gustavo' AND nom_participant = 'Guglelmin' AND nationalite_participant = 'BRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Gustavo' AND nom_participant = 'Guglelmin' AND nationalite_participant = 'BRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Gustavo' AND nom_participant = 'Guglelmin' AND nationalite_participant = 'BRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Gustavo' AND nom_participant = 'Guglelmin' AND nationalite_participant = 'BRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Gustavo' AND nom_participant = 'Guglelmin' AND nationalite_participant = 'BRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Gustavo' AND nom_participant = 'Guglelmin' AND nationalite_participant = 'BRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Gustavo' AND nom_participant = 'Guglelmin' AND nationalite_participant = 'BRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Gustavo' AND nom_participant = 'Guglelmin' AND nationalite_participant = 'BRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Guillaume' AND nom_participant = 'De Mevius' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Guillaume' AND nom_participant = 'De Mevius' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Guillaume' AND nom_participant = 'De Mevius' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Guillaume' AND nom_participant = 'De Mevius' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Guillaume' AND nom_participant = 'De Mevius' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Guillaume' AND nom_participant = 'De Mevius' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Guillaume' AND nom_participant = 'De Mevius' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Guillaume' AND nom_participant = 'De Mevius' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Guillaume' AND nom_participant = 'De Mevius' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Guillaume' AND nom_participant = 'De Mevius' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Guillaume' AND nom_participant = 'De Mevius' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Guillaume' AND nom_participant = 'De Mevius' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Guillaume' AND nom_participant = 'De Mevius' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Guillaume' AND nom_participant = 'De Mevius' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Guillaume' AND nom_participant = 'De Mevius' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Francois' AND nom_participant = 'Cazalet' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Francois' AND nom_participant = 'Cazalet' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Francois' AND nom_participant = 'Cazalet' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Francois' AND nom_participant = 'Cazalet' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Francois' AND nom_participant = 'Cazalet' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Francois' AND nom_participant = 'Cazalet' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Francois' AND nom_participant = 'Cazalet' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Francois' AND nom_participant = 'Cazalet' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Francois' AND nom_participant = 'Cazalet' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Francois' AND nom_participant = 'Cazalet' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Francois' AND nom_participant = 'Cazalet' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Francois' AND nom_participant = 'Cazalet' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Francois' AND nom_participant = 'Cazalet' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Francois' AND nom_participant = 'Cazalet' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Francois' AND nom_participant = 'Cazalet' AND nationalite_participant = 'FRA'))


--SSV

INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Rokas' AND nom_participant = 'Baciuska' AND nationalite_participant = 'LTU'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Rokas' AND nom_participant = 'Baciuska' AND nationalite_participant = 'LTU'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Rokas' AND nom_participant = 'Baciuska' AND nationalite_participant = 'LTU'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Rokas' AND nom_participant = 'Baciuska' AND nationalite_participant = 'LTU'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Rokas' AND nom_participant = 'Baciuska' AND nationalite_participant = 'LTU'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Rokas' AND nom_participant = 'Baciuska' AND nationalite_participant = 'LTU'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Rokas' AND nom_participant = 'Baciuska' AND nationalite_participant = 'LTU'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Rokas' AND nom_participant = 'Baciuska' AND nationalite_participant = 'LTU'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Rokas' AND nom_participant = 'Baciuska' AND nationalite_participant = 'LTU'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Rokas' AND nom_participant = 'Baciuska' AND nationalite_participant = 'LTU'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Rokas' AND nom_participant = 'Baciuska' AND nationalite_participant = 'LTU'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Rokas' AND nom_participant = 'Baciuska' AND nationalite_participant = 'LTU'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Rokas' AND nom_participant = 'Baciuska' AND nationalite_participant = 'LTU'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Rokas' AND nom_participant = 'Baciuska' AND nationalite_participant = 'LTU'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Rokas' AND nom_participant = 'Baciuska' AND nationalite_participant = 'LTU'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Oriol' AND nom_participant = 'Vidal Montijano' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Oriol' AND nom_participant = 'Vidal Montijano' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Oriol' AND nom_participant = 'Vidal Montijano' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Oriol' AND nom_participant = 'Vidal Montijano' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Oriol' AND nom_participant = 'Vidal Montijano' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Oriol' AND nom_participant = 'Vidal Montijano' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Oriol' AND nom_participant = 'Vidal Montijano' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Oriol' AND nom_participant = 'Vidal Montijano' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Oriol' AND nom_participant = 'Vidal Montijano' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Oriol' AND nom_participant = 'Vidal Montijano' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Oriol' AND nom_participant = 'Vidal Montijano' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Oriol' AND nom_participant = 'Vidal Montijano' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Oriol' AND nom_participant = 'Vidal Montijano' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Oriol' AND nom_participant = 'Vidal Montijano' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Oriol' AND nom_participant = 'Vidal Montijano' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Marek' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Marek' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Marek' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Marek' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Marek' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Marek' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Marek' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Marek' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Marek' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Marek' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Marek' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Marek' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Marek' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Marek' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Marek' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Maciej' AND nom_participant = 'Marton' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Maciej' AND nom_participant = 'Marton' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Maciej' AND nom_participant = 'Marton' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Maciej' AND nom_participant = 'Marton' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Maciej' AND nom_participant = 'Marton' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Maciej' AND nom_participant = 'Marton' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Maciej' AND nom_participant = 'Marton' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Maciej' AND nom_participant = 'Marton' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Maciej' AND nom_participant = 'Marton' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Maciej' AND nom_participant = 'Marton' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Maciej' AND nom_participant = 'Marton' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Maciej' AND nom_participant = 'Marton' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Maciej' AND nom_participant = 'Marton' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Maciej' AND nom_participant = 'Marton' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Maciej' AND nom_participant = 'Marton' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Gerard' AND nom_participant = 'Farres Guell' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Gerard' AND nom_participant = 'Farres Guell' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Gerard' AND nom_participant = 'Farres Guell' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Gerard' AND nom_participant = 'Farres Guell' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Gerard' AND nom_participant = 'Farres Guell' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Gerard' AND nom_participant = 'Farres Guell' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Gerard' AND nom_participant = 'Farres Guell' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Gerard' AND nom_participant = 'Farres Guell' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Gerard' AND nom_participant = 'Farres Guell' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Gerard' AND nom_participant = 'Farres Guell' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Gerard' AND nom_participant = 'Farres Guell' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Gerard' AND nom_participant = 'Farres Guell' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Gerard' AND nom_participant = 'Farres Guell' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Gerard' AND nom_participant = 'Farres Guell' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Gerard' AND nom_participant = 'Farres Guell' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Diego' AND nom_participant = 'Ortega Gil' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Diego' AND nom_participant = 'Ortega Gil' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Diego' AND nom_participant = 'Ortega Gil' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Diego' AND nom_participant = 'Ortega Gil' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Diego' AND nom_participant = 'Ortega Gil' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Diego' AND nom_participant = 'Ortega Gil' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Diego' AND nom_participant = 'Ortega Gil' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Diego' AND nom_participant = 'Ortega Gil' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Diego' AND nom_participant = 'Ortega Gil' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Diego' AND nom_participant = 'Ortega Gil' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Diego' AND nom_participant = 'Ortega Gil' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Diego' AND nom_participant = 'Ortega Gil' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Diego' AND nom_participant = 'Ortega Gil' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Diego' AND nom_participant = 'Ortega Gil' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Diego' AND nom_participant = 'Ortega Gil' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Michal' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Michal' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Michal' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Michal' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Michal' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Michal' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Michal' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Michal' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Michal' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Michal' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Michal' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Michal' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Michal' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Michal' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Michal' AND nom_participant = 'Goczal' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Szymon' AND nom_participant = 'Gospodarczy' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Szymon' AND nom_participant = 'Gospodarczy' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Szymon' AND nom_participant = 'Gospodarczy' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Szymon' AND nom_participant = 'Gospodarczy' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Szymon' AND nom_participant = 'Gospodarczy' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Szymon' AND nom_participant = 'Gospodarczy' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Szymon' AND nom_participant = 'Gospodarczy' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Szymon' AND nom_participant = 'Gospodarczy' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Szymon' AND nom_participant = 'Gospodarczy' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Szymon' AND nom_participant = 'Gospodarczy' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Szymon' AND nom_participant = 'Gospodarczy' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Szymon' AND nom_participant = 'Gospodarczy' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Szymon' AND nom_participant = 'Gospodarczy' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Szymon' AND nom_participant = 'Gospodarczy' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Szymon' AND nom_participant = 'Gospodarczy' AND nationalite_participant = 'POL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Rodrigo' AND nom_participant = 'Luppi De Oliveira' AND nationalite_participant = 'BRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Rodrigo' AND nom_participant = 'Luppi De Oliveira' AND nationalite_participant = 'BRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Rodrigo' AND nom_participant = 'Luppi De Oliveira' AND nationalite_participant = 'BRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Rodrigo' AND nom_participant = 'Luppi De Oliveira' AND nationalite_participant = 'BRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Rodrigo' AND nom_participant = 'Luppi De Oliveira' AND nationalite_participant = 'BRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Rodrigo' AND nom_participant = 'Luppi De Oliveira' AND nationalite_participant = 'BRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Rodrigo' AND nom_participant = 'Luppi De Oliveira' AND nationalite_participant = 'BRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Rodrigo' AND nom_participant = 'Luppi De Oliveira' AND nationalite_participant = 'BRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Rodrigo' AND nom_participant = 'Luppi De Oliveira' AND nationalite_participant = 'BRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Rodrigo' AND nom_participant = 'Luppi De Oliveira' AND nationalite_participant = 'BRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Rodrigo' AND nom_participant = 'Luppi De Oliveira' AND nationalite_participant = 'BRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Rodrigo' AND nom_participant = 'Luppi De Oliveira' AND nationalite_participant = 'BRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Rodrigo' AND nom_participant = 'Luppi De Oliveira' AND nationalite_participant = 'BRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Rodrigo' AND nom_participant = 'Luppi De Oliveira' AND nationalite_participant = 'BRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Rodrigo' AND nom_participant = 'Luppi De Oliveira' AND nationalite_participant = 'BRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Maykel' AND nom_participant = 'Justo' AND nationalite_participant = 'BRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Maykel' AND nom_participant = 'Justo' AND nationalite_participant = 'BRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Maykel' AND nom_participant = 'Justo' AND nationalite_participant = 'BRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Maykel' AND nom_participant = 'Justo' AND nationalite_participant = 'BRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Maykel' AND nom_participant = 'Justo' AND nationalite_participant = 'BRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Maykel' AND nom_participant = 'Justo' AND nationalite_participant = 'BRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Maykel' AND nom_participant = 'Justo' AND nationalite_participant = 'BRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Maykel' AND nom_participant = 'Justo' AND nationalite_participant = 'BRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Maykel' AND nom_participant = 'Justo' AND nationalite_participant = 'BRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Maykel' AND nom_participant = 'Justo' AND nationalite_participant = 'BRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Maykel' AND nom_participant = 'Justo' AND nationalite_participant = 'BRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Maykel' AND nom_participant = 'Justo' AND nationalite_participant = 'BRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Maykel' AND nom_participant = 'Justo' AND nationalite_participant = 'BRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Maykel' AND nom_participant = 'Justo' AND nationalite_participant = 'BRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Maykel' AND nom_participant = 'Justo' AND nationalite_participant = 'BRA'))

--Classic

INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Serge' AND nom_participant = 'Mogno' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Serge' AND nom_participant = 'Mogno' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Serge' AND nom_participant = 'Mogno' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Serge' AND nom_participant = 'Mogno' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Serge' AND nom_participant = 'Mogno' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Serge' AND nom_participant = 'Mogno' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Serge' AND nom_participant = 'Mogno' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Serge' AND nom_participant = 'Mogno' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Serge' AND nom_participant = 'Mogno' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Serge' AND nom_participant = 'Mogno' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Serge' AND nom_participant = 'Mogno' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Serge' AND nom_participant = 'Mogno' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Serge' AND nom_participant = 'Mogno' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Serge' AND nom_participant = 'Mogno' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Serge' AND nom_participant = 'Mogno' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Florent' AND nom_participant = 'Drulhon' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Florent' AND nom_participant = 'Drulhon' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Florent' AND nom_participant = 'Drulhon' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Florent' AND nom_participant = 'Drulhon' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Florent' AND nom_participant = 'Drulhon' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Florent' AND nom_participant = 'Drulhon' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Florent' AND nom_participant = 'Drulhon' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Florent' AND nom_participant = 'Drulhon' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Florent' AND nom_participant = 'Drulhon' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Florent' AND nom_participant = 'Drulhon' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Florent' AND nom_participant = 'Drulhon' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Florent' AND nom_participant = 'Drulhon' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Florent' AND nom_participant = 'Drulhon' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Florent' AND nom_participant = 'Drulhon' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Florent' AND nom_participant = 'Drulhon' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Jerome' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Jerome' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Jerome' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Jerome' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Jerome' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Jerome' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Jerome' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Jerome' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Jerome' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Jerome' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Jerome' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Jerome' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Jerome' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Jerome' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Jerome' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Anne' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Anne' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Anne' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Anne' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Anne' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Anne' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Anne' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Anne' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Anne' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Anne' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Anne' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Anne' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Anne' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Anne' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Anne' AND nom_participant = 'Galpin' AND nationalite_participant = 'FRA'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kilian' AND nom_participant = 'Revuelta' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kilian' AND nom_participant = 'Revuelta' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kilian' AND nom_participant = 'Revuelta' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kilian' AND nom_participant = 'Revuelta' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kilian' AND nom_participant = 'Revuelta' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kilian' AND nom_participant = 'Revuelta' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kilian' AND nom_participant = 'Revuelta' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kilian' AND nom_participant = 'Revuelta' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kilian' AND nom_participant = 'Revuelta' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kilian' AND nom_participant = 'Revuelta' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kilian' AND nom_participant = 'Revuelta' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kilian' AND nom_participant = 'Revuelta' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kilian' AND nom_participant = 'Revuelta' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kilian' AND nom_participant = 'Revuelta' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kilian' AND nom_participant = 'Revuelta' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Montamarta' AND nom_participant = 'Mercedes' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Montamarta' AND nom_participant = 'Mercedes' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Montamarta' AND nom_participant = 'Mercedes' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Montamarta' AND nom_participant = 'Mercedes' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Montamarta' AND nom_participant = 'Mercedes' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Montamarta' AND nom_participant = 'Mercedes' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Montamarta' AND nom_participant = 'Mercedes' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Montamarta' AND nom_participant = 'Mercedes' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Montamarta' AND nom_participant = 'Mercedes' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Montamarta' AND nom_participant = 'Mercedes' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Montamarta' AND nom_participant = 'Mercedes' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Montamarta' AND nom_participant = 'Mercedes' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Montamarta' AND nom_participant = 'Mercedes' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Montamarta' AND nom_participant = 'Mercedes' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Montamarta' AND nom_participant = 'Mercedes' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Carlos' AND nom_participant = 'Santaolalla' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Carlos' AND nom_participant = 'Santaolalla' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Carlos' AND nom_participant = 'Santaolalla' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Carlos' AND nom_participant = 'Santaolalla' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Carlos' AND nom_participant = 'Santaolalla' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Carlos' AND nom_participant = 'Santaolalla' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Carlos' AND nom_participant = 'Santaolalla' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Carlos' AND nom_participant = 'Santaolalla' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Carlos' AND nom_participant = 'Santaolalla' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Carlos' AND nom_participant = 'Santaolalla' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Carlos' AND nom_participant = 'Santaolalla' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Carlos' AND nom_participant = 'Santaolalla' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Carlos' AND nom_participant = 'Santaolalla' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Carlos' AND nom_participant = 'Santaolalla' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Carlos' AND nom_participant = 'Santaolalla' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Sol I Juanola' AND nom_participant = 'Aran' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Sol I Juanola' AND nom_participant = 'Aran' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Sol I Juanola' AND nom_participant = 'Aran' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Sol I Juanola' AND nom_participant = 'Aran' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Sol I Juanola' AND nom_participant = 'Aran' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Sol I Juanola' AND nom_participant = 'Aran' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Sol I Juanola' AND nom_participant = 'Aran' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Sol I Juanola' AND nom_participant = 'Aran' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Sol I Juanola' AND nom_participant = 'Aran' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Sol I Juanola' AND nom_participant = 'Aran' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Sol I Juanola' AND nom_participant = 'Aran' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Sol I Juanola' AND nom_participant = 'Aran' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Sol I Juanola' AND nom_participant = 'Aran' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Sol I Juanola' AND nom_participant = 'Aran' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Sol I Juanola' AND nom_participant = 'Aran' AND nationalite_participant = 'ESP'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Nicola' AND nom_participant = 'Feryn' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Nicola' AND nom_participant = 'Feryn' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Nicola' AND nom_participant = 'Feryn' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Nicola' AND nom_participant = 'Feryn' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Nicola' AND nom_participant = 'Feryn' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Nicola' AND nom_participant = 'Feryn' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Nicola' AND nom_participant = 'Feryn' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Nicola' AND nom_participant = 'Feryn' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Nicola' AND nom_participant = 'Feryn' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Nicola' AND nom_participant = 'Feryn' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Nicola' AND nom_participant = 'Feryn' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Nicola' AND nom_participant = 'Feryn' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Nicola' AND nom_participant = 'Feryn' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Nicola' AND nom_participant = 'Feryn' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Nicola' AND nom_participant = 'Feryn' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2022-12-31', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2022-12-31', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kurt' AND nom_participant = 'Keysers' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Sea Camp' AND date_depart = TO_DATE('2023-01-01', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-01', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kurt' AND nom_participant = 'Keysers' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Sea Camp - Al-Ula' AND date_depart = TO_DATE('2023-01-02', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-02', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kurt' AND nom_participant = 'Keysers' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Ula - Haïl' AND date_depart = TO_DATE('2023-01-03', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-03', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kurt' AND nom_participant = 'Keysers' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-04', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-04', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kurt' AND nom_participant = 'Keysers' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Haïl' AND date_depart = TO_DATE('2023-01-05', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-05', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kurt' AND nom_participant = 'Keysers' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Haïl - Riyad' AND date_depart = TO_DATE('2023-01-06', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-06', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kurt' AND nom_participant = 'Keysers' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Al-Duwadmi' AND date_depart = TO_DATE('2023-01-07', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-07', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kurt' AND nom_participant = 'Keysers' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Duwadmi - Riyad' AND date_depart = TO_DATE('2023-01-08', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-08', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kurt' AND nom_participant = 'Keysers' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Riyad - Harad' AND date_depart = TO_DATE('2023-01-10', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-10', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kurt' AND nom_participant = 'Keysers' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Harad - Shayba' AND date_depart = TO_DATE('2023-01-11', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-11', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kurt' AND nom_participant = 'Keysers' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Empty Quarter Marathon' AND date_depart = TO_DATE('2023-01-12', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-12', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kurt' AND nom_participant = 'Keysers' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Empty Quarter Marathon - Shayba' AND date_depart = TO_DATE('2023-01-13', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-13', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kurt' AND nom_participant = 'Keysers' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Shayba - Al-Hufuf' AND date_depart = TO_DATE('2023-01-14', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-14', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kurt' AND nom_participant = 'Keysers' AND nationalite_participant = 'BEL'))
INTO P04_participe VALUES
((SELECT id_etape FROM P04_etape WHERE nom_etape = 'Al-Hufuf - Dammam' AND date_depart = TO_DATE('2023-01-15', 'YYYY-MM-DD') AND date_arrivee = TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(SELECT id_participant FROM P04_participant WHERE prenom_participant = 'Kurt' AND nom_participant = 'Keysers' AND nationalite_participant = 'BEL'))
SELECT * FROM DUAL;


-- Mise à jour de la table P04_participant afin d'attribuer les âges(age_participant) de manières aléatoires
UPDATE P04_participant
SET age_participant = FLOOR(DBMS_RANDOM.VALUE * (55 - 20 + 1)) + 20
WHERE age_participant IS NULL;

 -- modification pour l'etape 1
UPDATE P04_resultat
SET position = 32
WHERE id_participant = 1 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 7
WHERE id_participant = 2 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 14
WHERE id_participant = 3 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 15
WHERE id_participant = 4 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 17
WHERE id_participant = 5 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 10
WHERE id_participant = 6 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 10
WHERE id_participant = 7 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 30
WHERE id_participant = 8 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 30
WHERE id_participant = 9 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 29
WHERE id_participant = 10 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 29
WHERE id_participant = 11 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 23
WHERE id_participant = 12 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 23
WHERE id_participant = 13 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 27
WHERE id_participant = 14 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 27
WHERE id_participant = 15 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 11
WHERE id_participant = 16 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 34
WHERE id_participant = 17 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 33
WHERE id_participant = 18 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 20
WHERE id_participant = 19 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 35
WHERE id_participant = 20 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 2
WHERE id_participant = 21 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 2
WHERE id_participant = 22 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 21
WHERE id_participant = 23 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 21
WHERE id_participant = 24 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 19
WHERE id_participant = 25 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 19
WHERE id_participant = 26 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 13
WHERE id_participant = 27 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 13
WHERE id_participant = 28 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 24
WHERE id_participant = 29 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 24
WHERE id_participant = 30 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 8
WHERE id_participant = 31 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 8
WHERE id_participant = 32 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 28
WHERE id_participant = 33 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 28
WHERE id_participant = 34 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 16
WHERE id_participant = 35 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 16
WHERE id_participant = 36 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 6
WHERE id_participant = 37 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 6
WHERE id_participant = 38 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 31
WHERE id_participant = 39 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 31
WHERE id_participant = 40 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 25
WHERE id_participant = 41 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 25
WHERE id_participant = 42 AND id_speciale = 1;


UPDATE P04_resultat
SET position = 18
WHERE id_participant = 43 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 18
WHERE id_participant = 44 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 1
WHERE id_participant = 45 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 1
WHERE id_participant = 46 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 3
WHERE id_participant = 47 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 3
WHERE id_participant = 48 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 22
WHERE id_participant = 49 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 22
WHERE id_participant = 50 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 26
WHERE id_participant = 51 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 26
WHERE id_participant = 52 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 4
WHERE id_participant = 53 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 4
WHERE id_participant = 54 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 12
WHERE id_participant = 55 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 12
WHERE id_participant = 56 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 9
WHERE id_participant = 57 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 9
WHERE id_participant = 58 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 5
WHERE id_participant = 59 AND id_speciale = 1;

UPDATE P04_resultat
SET position = 5
WHERE id_participant = 60 AND id_speciale = 1;




 -- modification pour l'etape 2

UPDATE P04_resultat
SET position = 12
WHERE id_participant = 1 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 33
WHERE id_participant = 2 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 13
WHERE id_participant = 3 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 5
WHERE id_participant = 4 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 27
WHERE id_participant = 5 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 1
WHERE id_participant = 6 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 1
WHERE id_participant = 7 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 3
WHERE id_participant = 8 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 3
WHERE id_participant = 9 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 20
WHERE id_participant = 10 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 20
WHERE id_participant = 11 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 10
WHERE id_participant = 12 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 10
WHERE id_participant = 13 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 18
WHERE id_participant = 14 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 18
WHERE id_participant = 15 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 29
WHERE id_participant = 16 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 28
WHERE id_participant = 17 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 7
WHERE id_participant = 18 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 31
WHERE id_participant = 19 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 4
WHERE id_participant = 20 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 22
WHERE id_participant = 21 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 22
WHERE id_participant = 22 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 11
WHERE id_participant = 23 AND id_speciale = 2;


UPDATE P04_resultat
SET position = 11
WHERE id_participant = 24 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 2
WHERE id_participant = 25 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 2
WHERE id_participant = 26 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 35
WHERE id_participant = 27 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 35
WHERE id_participant = 28 AND id_speciale = 2;


UPDATE P04_resultat
SET position = 17
WHERE id_participant = 29 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 17
WHERE id_participant = 30 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 8
WHERE id_participant = 31 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 8
WHERE id_participant = 32 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 32
WHERE id_participant = 33 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 32
WHERE id_participant = 34 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 23
WHERE id_participant = 35 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 23
WHERE id_participant = 36 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 24
WHERE id_participant = 37 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 24
WHERE id_participant = 38 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 19
WHERE id_participant = 39 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 19
WHERE id_participant = 40 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 6
WHERE id_participant = 41 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 6
WHERE id_participant = 42 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 14
WHERE id_participant = 43 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 14
WHERE id_participant = 44 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 34
WHERE id_participant = 45 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 34
WHERE id_participant = 46 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 15
WHERE id_participant = 47 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 15
WHERE id_participant = 48 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 16
WHERE id_participant = 49 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 16
WHERE id_participant = 50 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 9
WHERE id_participant = 51 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 9
WHERE id_participant = 52 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 30
WHERE id_participant = 53 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 30
WHERE id_participant = 54 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 21
WHERE id_participant = 55 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 21
WHERE id_participant = 56 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 26
WHERE id_participant = 57 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 26
WHERE id_participant = 58 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 25
WHERE id_participant = 59 AND id_speciale = 2;

UPDATE P04_resultat
SET position = 25
WHERE id_participant = 60 AND id_speciale = 2;


-- modification pour l'etape 3

-- on reprend ici


UPDATE P04_resultat
SET position = 15
WHERE id_participant = 1 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 3
WHERE id_participant = 2 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 33
WHERE id_participant = 3 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 20
WHERE id_participant = 4 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 31
WHERE id_participant = 5 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 8
WHERE id_participant = 6 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 8
WHERE id_participant = 7 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 11
WHERE id_participant = 8 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 11
WHERE id_participant = 9 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 26
WHERE id_participant = 10 AND id_speciale = 3;


UPDATE P04_resultat
SET position = 26
WHERE id_participant = 11 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 5
WHERE id_participant = 12 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 5
WHERE id_participant = 13 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 13
WHERE id_participant = 14 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 13
WHERE id_participant = 15 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 34
WHERE id_participant = 16 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 7
WHERE id_participant = 17 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 22
WHERE id_participant = 18 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 35
WHERE id_participant = 19 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 12
WHERE id_participant = 20 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 18
WHERE id_participant = 21 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 18
WHERE id_participant = 22 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 28
WHERE id_participant = 23 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 28
WHERE id_participant = 24 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 9
WHERE id_participant = 25 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 9
WHERE id_participant = 26 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 27
WHERE id_participant = 27 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 27
WHERE id_participant = 28 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 1
WHERE id_participant = 29 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 1
WHERE id_participant = 30 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 19
WHERE id_participant = 31 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 19
WHERE id_participant = 32 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 25
WHERE id_participant = 33 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 25
WHERE id_participant = 34 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 21
WHERE id_participant = 35 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 21
WHERE id_participant = 36 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 24
WHERE id_participant = 37 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 24
WHERE id_participant = 38 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 17
WHERE id_participant = 39 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 17
WHERE id_participant = 40 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 29
WHERE id_participant = 41 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 29
WHERE id_participant = 42 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 32
WHERE id_participant = 43 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 32
WHERE id_participant = 44 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 30
WHERE id_participant = 45 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 30
WHERE id_participant = 46 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 6
WHERE id_participant = 47 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 6
WHERE id_participant = 48 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 4
WHERE id_participant = 49 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 4
WHERE id_participant = 50 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 2
WHERE id_participant = 51 AND id_speciale = 3;


UPDATE P04_resultat
SET position = 2
WHERE id_participant = 52 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 23
WHERE id_participant = 53 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 23
WHERE id_participant = 54 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 16
WHERE id_participant = 55 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 16
WHERE id_participant = 56 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 10
WHERE id_participant = 57 AND id_speciale = 3;
UPDATE P04_resultat
SET position = 10
WHERE id_participant = 58 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 14
WHERE id_participant = 59 AND id_speciale = 3;

UPDATE P04_resultat
SET position = 14
WHERE id_participant = 60 AND id_speciale = 3;


 -- modification pour l'etape 4


UPDATE P04_resultat
SET position = 33
WHERE id_participant = 1 AND id_speciale = 4;

UPDATE P04_resultat
SET position = 20
WHERE id_participant = 2 AND id_speciale = 4;

UPDATE P04_resultat
SET position = 22
WHERE id_participant = 3 AND id_speciale = 4;

UPDATE P04_resultat
SET position = 17
WHERE id_participant = 4 AND id_speciale = 4;

UPDATE P04_resultat
SET position = 1
WHERE id_participant = 5 AND id_speciale = 4;

UPDATE P04_resultat
SET position = 6
WHERE id_participant = 6 AND id_speciale = 4;

UPDATE P04_resultat
SET position = 12
WHERE id_participant = 8 AND id_speciale = 4;

UPDATE P04_resultat
SET position = 24
WHERE id_participant = 10 AND id_speciale = 4;

UPDATE P04_resultat
SET position = 30
WHERE id_participant = 12 AND id_speciale = 4;

UPDATE P04_resultat
SET position = 35
WHERE id_participant = 14 AND id_speciale = 4;

UPDATE P04_resultat
SET position = 7
WHERE id_participant = 16 AND id_speciale = 4;

UPDATE P04_resultat
SET position = 2
WHERE id_participant = 17 AND id_speciale = 4;

UPDATE P04_resultat
SET position = 29
WHERE id_participant = 18 AND id_speciale = 4;

UPDATE P04_resultat
SET position = 21
WHERE id_participant = 19 AND id_speciale = 4;

UPDATE P04_resultat
SET position = 28
WHERE id_participant = 20 AND id_speciale = 4;

UPDATE P04_resultat
SET position = 13
WHERE id_participant = 21 AND id_speciale = 4;

UPDATE P04_resultat
SET position = 3
WHERE id_participant = 23 AND id_speciale = 4;

UPDATE P04_resultat
SET position = 9
WHERE id_participant = 25 AND id_speciale = 4;

UPDATE P04_resultat
SET position = 31
WHERE id_participant = 27 AND id_speciale = 4;

UPDATE P04_resultat
SET position = 15
WHERE id_participant = 29 AND id_speciale = 4;

UPDATE P04_resultat
SET position = 23
WHERE id_participant = 31 AND id_speciale = 4;

UPDATE P04_resultat
SET position = 8
WHERE id_participant = 33 AND id_speciale = 4;

UPDATE P04_resultat
SET position = 27
WHERE id_participant = 35 AND id_speciale = 4;

UPDATE P04_resultat
SET position = 26
WHERE id_participant = 37 AND id_speciale = 4;

UPDATE P04_resultat
SET position = 19
WHERE id_participant = 39 AND id_speciale = 4;

UPDATE P04_resultat
SET position = 32
WHERE id_participant = 41 AND id_speciale = 4;

UPDATE P04_resultat
SET position = 14
WHERE id_participant = 43 AND id_speciale = 4;

UPDATE P04_resultat
SET position = 5
WHERE id_participant = 45 AND id_speciale = 4;

UPDATE P04_resultat
SET position = 16
WHERE id_participant = 47 AND id_speciale = 4;

UPDATE P04_resultat
SET position = 18
WHERE id_participant = 49 AND id_speciale = 4;

UPDATE P04_resultat
SET position = 34
WHERE id_participant = 51 AND id_speciale = 4;

UPDATE P04_resultat
SET position = 25
WHERE id_participant = 53 AND id_speciale = 4;

UPDATE P04_resultat
SET position = 11
WHERE id_participant = 55 AND id_speciale = 4;

UPDATE P04_resultat
SET position = 10
WHERE id_participant = 57 AND id_speciale = 4;

UPDATE P04_resultat
SET position = 4
WHERE id_participant = 59 AND id_speciale = 4;





UPDATE P04_resultat SET position = 6 WHERE id_participant = 7 AND id_speciale = 4;
UPDATE P04_resultat SET position = 12 WHERE id_participant = 9 AND id_speciale = 4;
UPDATE P04_resultat SET position = 24 WHERE id_participant = 11 AND id_speciale = 4;
UPDATE P04_resultat SET position = 30 WHERE id_participant = 13 AND id_speciale = 4;
UPDATE P04_resultat SET position = 35 WHERE id_participant = 15 AND id_speciale = 4;
UPDATE P04_resultat SET position = 13 WHERE id_participant = 22 AND id_speciale = 4;
UPDATE P04_resultat SET position = 3 WHERE id_participant = 24 AND id_speciale = 4;
UPDATE P04_resultat SET position = 9 WHERE id_participant = 26 AND id_speciale = 4;
UPDATE P04_resultat SET position = 31 WHERE id_participant = 28 AND id_speciale = 4;
UPDATE P04_resultat SET position = 15 WHERE id_participant = 30 AND id_speciale = 4;
UPDATE P04_resultat SET position = 23 WHERE id_participant = 32 AND id_speciale = 4;
UPDATE P04_resultat SET position = 8 WHERE id_participant = 34 AND id_speciale = 4;
UPDATE P04_resultat SET position = 27 WHERE id_participant = 36 AND id_speciale = 4;
UPDATE P04_resultat SET position = 26 WHERE id_participant = 38 AND id_speciale = 4;
UPDATE P04_resultat SET position = 19 WHERE id_participant = 40 AND id_speciale = 4;
UPDATE P04_resultat SET position = 32 WHERE id_participant = 42 AND id_speciale = 4;
UPDATE P04_resultat SET position = 14 WHERE id_participant = 44 AND id_speciale = 4;
UPDATE P04_resultat SET position = 5 WHERE id_participant = 46 AND id_speciale = 4;
UPDATE P04_resultat SET position = 16 WHERE id_participant = 48 AND id_speciale = 4;
UPDATE P04_resultat SET position = 18 WHERE id_participant = 50 AND id_speciale = 4;
UPDATE P04_resultat SET position = 34 WHERE id_participant = 52 AND id_speciale = 4;
UPDATE P04_resultat SET position = 25 WHERE id_participant = 54 AND id_speciale = 4;
UPDATE P04_resultat SET position = 11 WHERE id_participant = 56 AND id_speciale = 4;
UPDATE P04_resultat SET position = 10 WHERE id_participant = 58 AND id_speciale = 4;
UPDATE P04_resultat SET position = 4 WHERE id_participant = 60 AND id_speciale = 4;

 -- modification pour l'etape 5


UPDATE P04_resultat
SET position = 15
WHERE id_participant = 1 AND id_speciale = 5;

UPDATE P04_resultat
SET position = 33
WHERE id_participant = 2 AND id_speciale = 5;

UPDATE P04_resultat
SET position = 12
WHERE id_participant = 3 AND id_speciale = 5;

UPDATE P04_resultat
SET position = 30
WHERE id_participant = 4 AND id_speciale = 5;

UPDATE P04_resultat
SET position = 16
WHERE id_participant = 5 AND id_speciale = 5;

UPDATE P04_resultat
SET position = 17
WHERE id_participant = 6 AND id_speciale = 5;

UPDATE P04_resultat
SET position = 9
WHERE id_participant = 8 AND id_speciale = 5;

UPDATE P04_resultat
SET position = 26
WHERE id_participant = 10 AND id_speciale = 5;

UPDATE P04_resultat
SET position = 28
WHERE id_participant = 12 AND id_speciale = 5;

UPDATE P04_resultat
SET position = 5
WHERE id_participant = 14 AND id_speciale = 5;

UPDATE P04_resultat
SET position = 27
WHERE id_participant = 16 AND id_speciale = 5;

UPDATE P04_resultat
SET position = 19
WHERE id_participant = 17 AND id_speciale = 5;

UPDATE P04_resultat
SET position = 2
WHERE id_participant = 18 AND id_speciale = 5;

UPDATE P04_resultat
SET position = 14
WHERE id_participant = 19 AND id_speciale = 5;

UPDATE P04_resultat
SET position = 25
WHERE id_participant = 20 AND id_speciale = 5;

UPDATE P04_resultat
SET position = 34
WHERE id_participant = 21 AND id_speciale = 5;

UPDATE P04_resultat
SET position = 24
WHERE id_participant = 23 AND id_speciale = 5;

UPDATE P04_resultat
SET position = 29
WHERE id_participant = 25 AND id_speciale = 5;

UPDATE P04_resultat
SET position = 3
WHERE id_participant = 27 AND id_speciale = 5;

UPDATE P04_resultat
SET position = 6
WHERE id_participant = 29 AND id_speciale = 5;

UPDATE P04_resultat
SET position = 10
WHERE id_participant = 31 AND id_speciale = 5;

UPDATE P04_resultat
SET position = 18
WHERE id_participant = 33 AND id_speciale = 5;

UPDATE P04_resultat
SET position = 22
WHERE id_participant = 35 AND id_speciale = 5;

UPDATE P04_resultat
SET position = 35
WHERE id_participant = 37 AND id_speciale = 5;

UPDATE P04_resultat
SET position = 13
WHERE id_participant = 39 AND id_speciale = 5;

UPDATE P04_resultat
SET position = 23
WHERE id_participant = 41 AND id_speciale = 5;

UPDATE P04_resultat
SET position = 21
WHERE id_participant = 43 AND id_speciale = 5;

UPDATE P04_resultat
SET position = 11
WHERE id_participant = 45 AND id_speciale = 5;

UPDATE P04_resultat
SET position = 31
WHERE id_participant = 47 AND id_speciale = 5;

UPDATE P04_resultat
SET position = 20
WHERE id_participant = 49 AND id_speciale = 5;

UPDATE P04_resultat
SET position = 8
WHERE id_participant = 51 AND id_speciale = 5;

UPDATE P04_resultat
SET position = 4
WHERE id_participant = 53 AND id_speciale = 5;

UPDATE P04_resultat
SET position = 1
WHERE id_participant = 55 AND id_speciale = 5;

UPDATE P04_resultat
SET position = 7
WHERE id_participant = 57 AND id_speciale = 5;

UPDATE P04_resultat
SET position = 32
WHERE id_participant = 59 AND id_speciale = 5;



UPDATE P04_resultat SET position = 17 WHERE id_participant = 7 AND id_speciale = 5;
UPDATE P04_resultat SET position = 9 WHERE id_participant = 9 AND id_speciale = 5;
UPDATE P04_resultat SET position = 26 WHERE id_participant = 11 AND id_speciale = 5;
UPDATE P04_resultat SET position = 28 WHERE id_participant = 13 AND id_speciale = 5;
UPDATE P04_resultat SET position = 5 WHERE id_participant = 15 AND id_speciale = 5;
UPDATE P04_resultat SET position = 34 WHERE id_participant = 22 AND id_speciale = 5;
UPDATE P04_resultat SET position = 24 WHERE id_participant = 24 AND id_speciale = 5;
UPDATE P04_resultat SET position = 29 WHERE id_participant = 26 AND id_speciale = 5;
UPDATE P04_resultat SET position = 3 WHERE id_participant = 28 AND id_speciale = 5;
UPDATE P04_resultat SET position = 6 WHERE id_participant = 30 AND id_speciale = 5;
UPDATE P04_resultat SET position = 10 WHERE id_participant = 32 AND id_speciale = 5;
UPDATE P04_resultat SET position = 18 WHERE id_participant = 34 AND id_speciale = 5;
UPDATE P04_resultat SET position = 22 WHERE id_participant = 36 AND id_speciale = 5;
UPDATE P04_resultat SET position = 35 WHERE id_participant = 38 AND id_speciale = 5;
UPDATE P04_resultat SET position = 13 WHERE id_participant = 40 AND id_speciale = 5;
UPDATE P04_resultat SET position = 23 WHERE id_participant = 42 AND id_speciale = 5;
UPDATE P04_resultat SET position = 21 WHERE id_participant = 44 AND id_speciale = 5;
UPDATE P04_resultat SET position = 11 WHERE id_participant = 46 AND id_speciale = 5;
UPDATE P04_resultat SET position = 31 WHERE id_participant = 48 AND id_speciale = 5;
UPDATE P04_resultat SET position = 20 WHERE id_participant = 50 AND id_speciale = 5;
UPDATE P04_resultat SET position = 8 WHERE id_participant = 52 AND id_speciale = 5;
UPDATE P04_resultat SET position = 4 WHERE id_participant = 54 AND id_speciale = 5;
UPDATE P04_resultat SET position = 1 WHERE id_participant = 56 AND id_speciale = 5;
UPDATE P04_resultat SET position = 7 WHERE id_participant = 58 AND id_speciale = 5;
UPDATE P04_resultat SET position = 32 WHERE id_participant = 60 AND id_speciale = 5;




 -- modification pour l'etape 6


UPDATE P04_resultat
SET position = 33
WHERE id_participant = 1 AND id_speciale = 6;

UPDATE P04_resultat
SET position = 26
WHERE id_participant = 2 AND id_speciale = 6;

UPDATE P04_resultat
SET position = 32
WHERE id_participant = 3 AND id_speciale = 6;

UPDATE P04_resultat
SET position = 28
WHERE id_participant = 4 AND id_speciale = 6;

UPDATE P04_resultat
SET position = 8
WHERE id_participant = 5 AND id_speciale = 6;

UPDATE P04_resultat
SET position = 34
WHERE id_participant = 6 AND id_speciale = 6;

UPDATE P04_resultat
SET position = 18
WHERE id_participant = 8 AND id_speciale = 6;

UPDATE P04_resultat
SET position = 2
WHERE id_participant = 10 AND id_speciale = 6;

UPDATE P04_resultat
SET position = 27
WHERE id_participant = 12 AND id_speciale = 6;

UPDATE P04_resultat
SET position = 31
WHERE id_participant = 14 AND id_speciale = 6;

UPDATE P04_resultat
SET position = 35
WHERE id_participant = 16 AND id_speciale = 6;

UPDATE P04_resultat
SET position = 24
WHERE id_participant = 17 AND id_speciale = 6;

UPDATE P04_resultat
SET position = 9
WHERE id_participant = 18 AND id_speciale = 6;

UPDATE P04_resultat
SET position = 1
WHERE id_participant = 19 AND id_speciale = 6;

UPDATE P04_resultat
SET position = 5
WHERE id_participant = 20 AND id_speciale = 6;

UPDATE P04_resultat
SET position = 22
WHERE id_participant = 21 AND id_speciale = 6;

UPDATE P04_resultat
SET position = 19
WHERE id_participant = 23 AND id_speciale = 6;

UPDATE P04_resultat
SET position = 25
WHERE id_participant = 25 AND id_speciale = 6;

UPDATE P04_resultat
SET position = 20
WHERE id_participant = 27 AND id_speciale = 6;

UPDATE P04_resultat
SET position = 15
WHERE id_participant = 29 AND id_speciale = 6;

UPDATE P04_resultat
SET position = 11
WHERE id_participant = 31 AND id_speciale = 6;

UPDATE P04_resultat
SET position = 30
WHERE id_participant = 33 AND id_speciale = 6;

UPDATE P04_resultat
SET position = 14
WHERE id_participant = 35 AND id_speciale = 6;

UPDATE P04_resultat
SET position = 16
WHERE id_participant = 37 AND id_speciale = 6;

UPDATE P04_resultat
SET position = 12
WHERE id_participant = 39 AND id_speciale = 6;

UPDATE P04_resultat
SET position = 6
WHERE id_participant = 41 AND id_speciale = 6;

UPDATE P04_resultat
SET position = 13
WHERE id_participant = 43 AND id_speciale = 6;

UPDATE P04_resultat
SET position = 7
WHERE id_participant = 45 AND id_speciale = 6;

UPDATE P04_resultat
SET position = 21
WHERE id_participant = 47 AND id_speciale = 6;

UPDATE P04_resultat
SET position = 10
WHERE id_participant = 49 AND id_speciale = 6;

UPDATE P04_resultat
SET position = 23
WHERE id_participant = 51 AND id_speciale = 6;

UPDATE P04_resultat
SET position = 4
WHERE id_participant = 53 AND id_speciale = 6;

UPDATE P04_resultat
SET position = 17
WHERE id_participant = 55 AND id_speciale = 6;

UPDATE P04_resultat
SET position = 3
WHERE id_participant = 57 AND id_speciale = 6;

UPDATE P04_resultat
SET position = 29
WHERE id_participant = 59 AND id_speciale = 6;


UPDATE P04_resultat SET position = 34 WHERE id_participant = 7 AND id_speciale = 6;
UPDATE P04_resultat SET position = 18 WHERE id_participant = 9 AND id_speciale = 6;
UPDATE P04_resultat SET position = 2 WHERE id_participant = 11 AND id_speciale = 6;
UPDATE P04_resultat SET position = 27 WHERE id_participant = 13 AND id_speciale = 6;
UPDATE P04_resultat SET position = 31 WHERE id_participant = 15 AND id_speciale = 6;
UPDATE P04_resultat SET position = 22 WHERE id_participant = 22 AND id_speciale = 6;
UPDATE P04_resultat SET position = 19 WHERE id_participant = 24 AND id_speciale = 6;
UPDATE P04_resultat SET position = 25 WHERE id_participant = 26 AND id_speciale = 6;
UPDATE P04_resultat SET position = 20 WHERE id_participant = 28 AND id_speciale = 6;
UPDATE P04_resultat SET position = 15 WHERE id_participant = 30 AND id_speciale = 6;
UPDATE P04_resultat SET position = 11 WHERE id_participant = 32 AND id_speciale = 6;
UPDATE P04_resultat SET position = 30 WHERE id_participant = 34 AND id_speciale = 6;
UPDATE P04_resultat SET position = 14 WHERE id_participant = 36 AND id_speciale = 6;
UPDATE P04_resultat SET position = 16 WHERE id_participant = 38 AND id_speciale = 6;
UPDATE P04_resultat SET position = 12 WHERE id_participant = 40 AND id_speciale = 6;
UPDATE P04_resultat SET position = 6 WHERE id_participant = 42 AND id_speciale = 6;
UPDATE P04_resultat SET position = 13 WHERE id_participant = 44 AND id_speciale = 6;
UPDATE P04_resultat SET position = 7 WHERE id_participant = 46 AND id_speciale = 6;
UPDATE P04_resultat SET position = 21 WHERE id_participant = 48 AND id_speciale = 6;
UPDATE P04_resultat SET position = 10 WHERE id_participant = 50 AND id_speciale = 6;
UPDATE P04_resultat SET position = 23 WHERE id_participant = 52 AND id_speciale = 6;
UPDATE P04_resultat SET position = 4 WHERE id_participant = 54 AND id_speciale = 6;
UPDATE P04_resultat SET position = 17 WHERE id_participant = 56 AND id_speciale = 6;
UPDATE P04_resultat SET position = 3 WHERE id_participant = 58 AND id_speciale = 6;
UPDATE P04_resultat SET position = 29 WHERE id_participant = 60 AND id_speciale = 6;



 -- modification pour l'etape 7


UPDATE P04_resultat
SET position = 27
WHERE id_participant = 1 AND id_speciale = 7;

UPDATE P04_resultat
SET position = 21
WHERE id_participant = 2 AND id_speciale = 7;

UPDATE P04_resultat
SET position = 33
WHERE id_participant = 3 AND id_speciale = 7;

UPDATE P04_resultat
SET position = 22
WHERE id_participant = 4 AND id_speciale = 7;

UPDATE P04_resultat
SET position = 34
WHERE id_participant = 5 AND id_speciale = 7;

UPDATE P04_resultat
SET position = 1
WHERE id_participant = 6 AND id_speciale = 7;

UPDATE P04_resultat
SET position = 10
WHERE id_participant = 8 AND id_speciale = 7;

UPDATE P04_resultat
SET position = 29
WHERE id_participant = 10 AND id_speciale = 7;

UPDATE P04_resultat
SET position = 13
WHERE id_participant = 12 AND id_speciale = 7;

UPDATE P04_resultat
SET position = 19
WHERE id_participant = 14 AND id_speciale = 7;

UPDATE P04_resultat
SET position = 2
WHERE id_participant = 16 AND id_speciale = 7;

UPDATE P04_resultat
SET position = 28
WHERE id_participant = 17 AND id_speciale = 7;

UPDATE P04_resultat
SET position = 20
WHERE id_participant = 18 AND id_speciale = 7;

UPDATE P04_resultat
SET position = 25
WHERE id_participant = 19 AND id_speciale = 7;

UPDATE P04_resultat
SET position = 32
WHERE id_participant = 20 AND id_speciale = 7;

UPDATE P04_resultat
SET position = 26
WHERE id_participant = 21 AND id_speciale = 7;

UPDATE P04_resultat
SET position = 8
WHERE id_participant = 23 AND id_speciale = 7;

UPDATE P04_resultat
SET position = 3
WHERE id_participant = 25 AND id_speciale = 7;

UPDATE P04_resultat
SET position = 24
WHERE id_participant = 27 AND id_speciale = 7;

UPDATE P04_resultat
SET position = 4
WHERE id_participant = 29 AND id_speciale = 7;

UPDATE P04_resultat
SET position = 14
WHERE id_participant = 31 AND id_speciale = 7;

UPDATE P04_resultat
SET position = 6
WHERE id_participant = 33 AND id_speciale = 7;

UPDATE P04_resultat
SET position = 7
WHERE id_participant = 35 AND id_speciale = 7;

UPDATE P04_resultat
SET position = 30
WHERE id_participant = 37 AND id_speciale = 7;

UPDATE P04_resultat
SET position = 23
WHERE id_participant = 39 AND id_speciale = 7;

UPDATE P04_resultat
SET position = 18
WHERE id_participant = 41 AND id_speciale = 7;

UPDATE P04_resultat
SET position = 11
WHERE id_participant = 43 AND id_speciale = 7;

UPDATE P04_resultat
SET position = 16
WHERE id_participant = 45 AND id_speciale = 7;

UPDATE P04_resultat
SET position = 9
WHERE id_participant = 47 AND id_speciale = 7;

UPDATE P04_resultat
SET position = 17
WHERE id_participant = 49 AND id_speciale = 7;

UPDATE P04_resultat
SET position = 31
WHERE id_participant = 51 AND id_speciale = 7;

UPDATE P04_resultat
SET position = 5
WHERE id_participant = 53 AND id_speciale = 7;

UPDATE P04_resultat
SET position = 12
WHERE id_participant = 55 AND id_speciale = 7;

UPDATE P04_resultat
SET position = 35
WHERE id_participant = 57 AND id_speciale = 7;

UPDATE P04_resultat
SET position = 15
WHERE id_participant = 59 AND id_speciale = 7;




UPDATE P04_resultat SET position = 1 WHERE id_participant = 7 AND id_speciale = 7;
UPDATE P04_resultat SET position = 10 WHERE id_participant = 9 AND id_speciale = 7;
UPDATE P04_resultat SET position = 29 WHERE id_participant = 11 AND id_speciale = 7;
UPDATE P04_resultat SET position = 13 WHERE id_participant = 13 AND id_speciale = 7;
UPDATE P04_resultat SET position = 19 WHERE id_participant = 15 AND id_speciale = 7;
UPDATE P04_resultat SET position = 26 WHERE id_participant = 22 AND id_speciale = 7;
UPDATE P04_resultat SET position = 8 WHERE id_participant = 24 AND id_speciale = 7;
UPDATE P04_resultat SET position = 3 WHERE id_participant = 26 AND id_speciale = 7;
UPDATE P04_resultat SET position = 24 WHERE id_participant = 28 AND id_speciale = 7;
UPDATE P04_resultat SET position = 4 WHERE id_participant = 30 AND id_speciale = 7;
UPDATE P04_resultat SET position = 14 WHERE id_participant = 32 AND id_speciale = 7;
UPDATE P04_resultat SET position = 6 WHERE id_participant = 34 AND id_speciale = 7;
UPDATE P04_resultat SET position = 7 WHERE id_participant = 36 AND id_speciale = 7;
UPDATE P04_resultat SET position = 30 WHERE id_participant = 38 AND id_speciale = 7;
UPDATE P04_resultat SET position = 23 WHERE id_participant = 40 AND id_speciale = 7;
UPDATE P04_resultat SET position = 18 WHERE id_participant = 42 AND id_speciale = 7;
UPDATE P04_resultat SET position = 11 WHERE id_participant = 44 AND id_speciale = 7;
UPDATE P04_resultat SET position = 16 WHERE id_participant = 46 AND id_speciale = 7;
UPDATE P04_resultat SET position = 9 WHERE id_participant = 48 AND id_speciale = 7;
UPDATE P04_resultat SET position = 17 WHERE id_participant = 50 AND id_speciale = 7;
UPDATE P04_resultat SET position = 31 WHERE id_participant = 52 AND id_speciale = 7;
UPDATE P04_resultat SET position = 5 WHERE id_participant = 54 AND id_speciale = 7;
UPDATE P04_resultat SET position = 12 WHERE id_participant = 56 AND id_speciale = 7;
UPDATE P04_resultat SET position = 35 WHERE id_participant = 58 AND id_speciale = 7;
UPDATE P04_resultat SET position = 15 WHERE id_participant = 60 AND id_speciale = 7;


 -- modification pour l'etape 8


UPDATE P04_resultat
SET position = 14
WHERE id_participant = 1 AND id_speciale = 8;

UPDATE P04_resultat
SET position = 3
WHERE id_participant = 2 AND id_speciale = 8;

UPDATE P04_resultat
SET position = 17
WHERE id_participant = 3 AND id_speciale = 8;

UPDATE P04_resultat
SET position = 34
WHERE id_participant = 4 AND id_speciale = 8;

UPDATE P04_resultat
SET position = 12
WHERE id_participant = 5 AND id_speciale = 8;

UPDATE P04_resultat
SET position = 7
WHERE id_participant = 6 AND id_speciale = 8;

UPDATE P04_resultat
SET position = 32
WHERE id_participant = 8 AND id_speciale = 8;

UPDATE P04_resultat
SET position = 26
WHERE id_participant = 10 AND id_speciale = 8;

UPDATE P04_resultat
SET position = 18
WHERE id_participant = 12 AND id_speciale = 8;

UPDATE P04_resultat
SET position = 27
WHERE id_participant = 14 AND id_speciale = 8;

UPDATE P04_resultat
SET position = 8
WHERE id_participant = 16 AND id_speciale = 8;

UPDATE P04_resultat
SET position = 20
WHERE id_participant = 17 AND id_speciale = 8;

UPDATE P04_resultat
SET position = 28
WHERE id_participant = 18 AND id_speciale = 8;

UPDATE P04_resultat
SET position = 33
WHERE id_participant = 19 AND id_speciale = 8;

UPDATE P04_resultat
SET position = 10
WHERE id_participant = 20 AND id_speciale = 8;

UPDATE P04_resultat
SET position = 9
WHERE id_participant = 21 AND id_speciale = 8;

UPDATE P04_resultat
SET position = 5
WHERE id_participant = 23 AND id_speciale = 8;

UPDATE P04_resultat
SET position = 4
WHERE id_participant = 25 AND id_speciale = 8;

UPDATE P04_resultat
SET position = 30
WHERE id_participant = 27 AND id_speciale = 8;

UPDATE P04_resultat
SET position = 24
WHERE id_participant = 29 AND id_speciale = 8;

UPDATE P04_resultat
SET position = 11
WHERE id_participant = 31 AND id_speciale = 8;

UPDATE P04_resultat
SET position = 35
WHERE id_participant = 33 AND id_speciale = 8;

UPDATE P04_resultat
SET position = 21
WHERE id_participant = 35 AND id_speciale = 8;

UPDATE P04_resultat
SET position = 22
WHERE id_participant = 37 AND id_speciale = 8;

UPDATE P04_resultat
SET position = 16
WHERE id_participant = 39 AND id_speciale = 8;

UPDATE P04_resultat
SET position = 19
WHERE id_participant = 41 AND id_speciale = 8;

UPDATE P04_resultat
SET position = 23
WHERE id_participant = 43 AND id_speciale = 8;

UPDATE P04_resultat
SET position = 29
WHERE id_participant = 45 AND id_speciale = 8;

UPDATE P04_resultat
SET position = 25
WHERE id_participant = 47 AND id_speciale = 8;

UPDATE P04_resultat
SET position = 13
WHERE id_participant = 49 AND id_speciale = 8;

UPDATE P04_resultat
SET position = 1
WHERE id_participant = 51 AND id_speciale = 8;

UPDATE P04_resultat
SET position = 15
WHERE id_participant = 53 AND id_speciale = 8;

UPDATE P04_resultat
SET position = 31
WHERE id_participant = 55 AND id_speciale = 8;

UPDATE P04_resultat
SET position = 2
WHERE id_participant = 57 AND id_speciale = 8;

UPDATE P04_resultat
SET position = 6
WHERE id_participant = 59 AND id_speciale = 8;





UPDATE P04_resultat SET position = 7 WHERE id_participant = 7 AND id_speciale = 8;
UPDATE P04_resultat SET position = 32 WHERE id_participant = 9 AND id_speciale = 8;
UPDATE P04_resultat SET position = 26 WHERE id_participant = 11 AND id_speciale = 8;
UPDATE P04_resultat SET position = 18 WHERE id_participant = 13 AND id_speciale = 8;
UPDATE P04_resultat SET position = 27 WHERE id_participant = 15 AND id_speciale = 8;
UPDATE P04_resultat SET position = 9 WHERE id_participant = 22 AND id_speciale = 8;
UPDATE P04_resultat SET position = 5 WHERE id_participant = 24 AND id_speciale = 8;
UPDATE P04_resultat SET position = 4 WHERE id_participant = 26 AND id_speciale = 8;
UPDATE P04_resultat SET position = 30 WHERE id_participant = 28 AND id_speciale = 8;
UPDATE P04_resultat SET position = 24 WHERE id_participant = 30 AND id_speciale = 8;
UPDATE P04_resultat SET position = 11 WHERE id_participant = 32 AND id_speciale = 8;
UPDATE P04_resultat SET position = 35 WHERE id_participant = 34 AND id_speciale = 8;
UPDATE P04_resultat SET position = 21 WHERE id_participant = 36 AND id_speciale = 8;
UPDATE P04_resultat SET position = 22 WHERE id_participant = 38 AND id_speciale = 8;
UPDATE P04_resultat SET position = 16 WHERE id_participant = 40 AND id_speciale = 8;
UPDATE P04_resultat SET position = 19 WHERE id_participant = 42 AND id_speciale = 8;
UPDATE P04_resultat SET position = 23 WHERE id_participant = 44 AND id_speciale = 8;
UPDATE P04_resultat SET position = 29 WHERE id_participant = 46 AND id_speciale = 8;
UPDATE P04_resultat SET position = 25 WHERE id_participant = 48 AND id_speciale = 8;
UPDATE P04_resultat SET position = 13 WHERE id_participant = 50 AND id_speciale = 8;
UPDATE P04_resultat SET position = 1 WHERE id_participant = 52 AND id_speciale = 8;
UPDATE P04_resultat SET position = 15 WHERE id_participant = 54 AND id_speciale = 8;
UPDATE P04_resultat SET position = 31 WHERE id_participant = 56 AND id_speciale = 8;
UPDATE P04_resultat SET position = 2 WHERE id_participant = 58 AND id_speciale = 8;
UPDATE P04_resultat SET position = 6 WHERE id_participant = 60 AND id_speciale = 8;

 -- modification pour l'etape 9

UPDATE P04_resultat
SET position = 18
WHERE id_participant = 1 AND id_speciale = 9;

UPDATE P04_resultat
SET position = 33
WHERE id_participant = 2 AND id_speciale = 9;

UPDATE P04_resultat
SET position = 11
WHERE id_participant = 3 AND id_speciale = 9;

UPDATE P04_resultat
SET position = 12
WHERE id_participant = 4 AND id_speciale = 9;

UPDATE P04_resultat
SET position = 31
WHERE id_participant = 5 AND id_speciale = 9;

UPDATE P04_resultat
SET position = 16
WHERE id_participant = 6 AND id_speciale = 9;

UPDATE P04_resultat
SET position = 17
WHERE id_participant = 8 AND id_speciale = 9;

UPDATE P04_resultat
SET position = 26
WHERE id_participant = 10 AND id_speciale = 9;

UPDATE P04_resultat
SET position = 27
WHERE id_participant = 12 AND id_speciale = 9;

UPDATE P04_resultat
SET position = 22
WHERE id_participant = 14 AND id_speciale = 9;

UPDATE P04_resultat
SET position = 20
WHERE id_participant = 16 AND id_speciale = 9;

UPDATE P04_resultat
SET position = 8
WHERE id_participant = 17 AND id_speciale = 9;

UPDATE P04_resultat
SET position = 14
WHERE id_participant = 18 AND id_speciale = 9;

UPDATE P04_resultat
SET position = 24
WHERE id_participant = 19 AND id_speciale = 9;

UPDATE P04_resultat
SET position = 23
WHERE id_participant = 20 AND id_speciale = 9;

UPDATE P04_resultat
SET position = 10
WHERE id_participant = 21 AND id_speciale = 9;

UPDATE P04_resultat
SET position = 30
WHERE id_participant = 23 AND id_speciale = 9;

UPDATE P04_resultat
SET position = 13
WHERE id_participant = 25 AND id_speciale = 9;

UPDATE P04_resultat
SET position = 21
WHERE id_participant = 27 AND id_speciale = 9;

UPDATE P04_resultat
SET position = 7
WHERE id_participant = 29 AND id_speciale = 9;

UPDATE P04_resultat
SET position = 5
WHERE id_participant = 31 AND id_speciale = 9;

UPDATE P04_resultat
SET position = 29
WHERE id_participant = 33 AND id_speciale = 9;

UPDATE P04_resultat
SET position = 32
WHERE id_participant = 35 AND id_speciale = 9;

UPDATE P04_resultat
SET position = 15
WHERE id_participant = 37 AND id_speciale = 9;

UPDATE P04_resultat
SET position = 2
WHERE id_participant = 39 AND id_speciale = 9;

UPDATE P04_resultat
SET position = 3
WHERE id_participant = 41 AND id_speciale = 9;

UPDATE P04_resultat
SET position = 25
WHERE id_participant = 43 AND id_speciale = 9;

UPDATE P04_resultat
SET position = 6
WHERE id_participant = 45 AND id_speciale = 9;

UPDATE P04_resultat
SET position = 35
WHERE id_participant = 47 AND id_speciale = 9;

UPDATE P04_resultat
SET position = 28
WHERE id_participant = 49 AND id_speciale = 9;

UPDATE P04_resultat
SET position = 19
WHERE id_participant = 51 AND id_speciale = 9;

UPDATE P04_resultat
SET position = 1
WHERE id_participant = 53 AND id_speciale = 9;

UPDATE P04_resultat
SET position = 9
WHERE id_participant = 55 AND id_speciale = 9;

UPDATE P04_resultat
SET position = 34
WHERE id_participant = 57 AND id_speciale = 9;

UPDATE P04_resultat
SET position = 4
WHERE id_participant = 59 AND id_speciale = 9;

UPDATE P04_resultat SET position = 16 WHERE id_participant = 7 AND id_speciale = 9;
UPDATE P04_resultat SET position = 17 WHERE id_participant = 9 AND id_speciale = 9;
UPDATE P04_resultat SET position = 26 WHERE id_participant = 11 AND id_speciale = 9;
UPDATE P04_resultat SET position = 27 WHERE id_participant = 13 AND id_speciale = 9;
UPDATE P04_resultat SET position = 22 WHERE id_participant = 15 AND id_speciale = 9;
UPDATE P04_resultat SET position = 10 WHERE id_participant = 22 AND id_speciale = 9;
UPDATE P04_resultat SET position = 30 WHERE id_participant = 24 AND id_speciale = 9;
UPDATE P04_resultat SET position = 13 WHERE id_participant = 26 AND id_speciale = 9;
UPDATE P04_resultat SET position = 21 WHERE id_participant = 28 AND id_speciale = 9;
UPDATE P04_resultat SET position = 7 WHERE id_participant = 30 AND id_speciale = 9;
UPDATE P04_resultat SET position = 5 WHERE id_participant = 32 AND id_speciale = 9;
UPDATE P04_resultat SET position = 29 WHERE id_participant = 34 AND id_speciale = 9;
UPDATE P04_resultat SET position = 32 WHERE id_participant = 36 AND id_speciale = 9;
UPDATE P04_resultat SET position = 15 WHERE id_participant = 38 AND id_speciale = 9;
UPDATE P04_resultat SET position = 2 WHERE id_participant = 40 AND id_speciale = 9;
UPDATE P04_resultat SET position = 3 WHERE id_participant = 42 AND id_speciale = 9;
UPDATE P04_resultat SET position = 25 WHERE id_participant = 44 AND id_speciale = 9;
UPDATE P04_resultat SET position = 6 WHERE id_participant = 46 AND id_speciale = 9;
UPDATE P04_resultat SET position = 35 WHERE id_participant = 48 AND id_speciale = 9;
UPDATE P04_resultat SET position = 28 WHERE id_participant = 50 AND id_speciale = 9;
UPDATE P04_resultat SET position = 19 WHERE id_participant = 52 AND id_speciale = 9;
UPDATE P04_resultat SET position = 1 WHERE id_participant = 54 AND id_speciale = 9;
UPDATE P04_resultat SET position = 9 WHERE id_participant = 56 AND id_speciale = 9;
UPDATE P04_resultat SET position = 34 WHERE id_participant = 58 AND id_speciale = 9;
UPDATE P04_resultat SET position = 4 WHERE id_participant = 60 AND id_speciale = 9;


 -- modification pour l'etape 10


UPDATE P04_resultat
SET position = 20
WHERE id_participant = 1 AND id_speciale = 10;

UPDATE P04_resultat
SET position = 35
WHERE id_participant = 2 AND id_speciale = 10;

UPDATE P04_resultat
SET position = 1
WHERE id_participant = 3 AND id_speciale = 10;

UPDATE P04_resultat
SET position = 12
WHERE id_participant = 4 AND id_speciale = 10;

UPDATE P04_resultat
SET position = 17
WHERE id_participant = 5 AND id_speciale = 10;

UPDATE P04_resultat
SET position = 8
WHERE id_participant = 6 AND id_speciale = 10;

UPDATE P04_resultat
SET position = 27
WHERE id_participant = 8 AND id_speciale = 10;

UPDATE P04_resultat
SET position = 28
WHERE id_participant = 10 AND id_speciale = 10;

UPDATE P04_resultat
SET position = 15
WHERE id_participant = 12 AND id_speciale = 10;

UPDATE P04_resultat
SET position = 6
WHERE id_participant = 14 AND id_speciale = 10;

UPDATE P04_resultat
SET position = 2
WHERE id_participant = 16 AND id_speciale = 10;

UPDATE P04_resultat
SET position = 22
WHERE id_participant = 17 AND id_speciale = 10;

UPDATE P04_resultat
SET position = 5
WHERE id_participant = 18 AND id_speciale = 10;

UPDATE P04_resultat
SET position = 18
WHERE id_participant = 19 AND id_speciale = 10;

UPDATE P04_resultat
SET position = 21
WHERE id_participant = 20 AND id_speciale = 10;

UPDATE P04_resultat
SET position = 14
WHERE id_participant = 21 AND id_speciale = 10;

UPDATE P04_resultat
SET position = 3
WHERE id_participant = 23 AND id_speciale = 10;

UPDATE P04_resultat
SET position = 23
WHERE id_participant = 25 AND id_speciale = 10;

UPDATE P04_resultat
SET position = 9
WHERE id_participant = 27 AND id_speciale = 10;

UPDATE P04_resultat
SET position = 13
WHERE id_participant = 29 AND id_speciale = 10;

UPDATE P04_resultat
SET position = 29
WHERE id_participant = 31 AND id_speciale = 10;

UPDATE P04_resultat
SET position = 4
WHERE id_participant = 33 AND id_speciale = 10;

UPDATE P04_resultat
SET position = 30
WHERE id_participant = 35 AND id_speciale = 10;

UPDATE P04_resultat
SET position = 25
WHERE id_participant = 37 AND id_speciale = 10;

UPDATE P04_resultat
SET position = 11
WHERE id_participant = 39 AND id_speciale = 10;

UPDATE P04_resultat
SET position = 19
WHERE id_participant = 41 AND id_speciale = 10;

UPDATE P04_resultat
SET position = 33
WHERE id_participant = 43 AND id_speciale = 10;

UPDATE P04_resultat
SET position = 34
WHERE id_participant = 45 AND id_speciale = 10;

UPDATE P04_resultat
SET position = 31
WHERE id_participant = 47 AND id_speciale = 10;

UPDATE P04_resultat
SET position = 10
WHERE id_participant = 49 AND id_speciale = 10;

UPDATE P04_resultat
SET position = 26
WHERE id_participant = 51 AND id_speciale = 10;

UPDATE P04_resultat
SET position = 16
WHERE id_participant = 53 AND id_speciale = 10;

UPDATE P04_resultat
SET position = 32
WHERE id_participant = 55 AND id_speciale = 10;

UPDATE P04_resultat
SET position = 7
WHERE id_participant = 57 AND id_speciale = 10;

UPDATE P04_resultat
SET position = 24
WHERE id_participant = 59 AND id_speciale = 10;



UPDATE P04_resultat SET position = 8 WHERE id_participant = 7 AND id_speciale = 10;
UPDATE P04_resultat SET position = 27 WHERE id_participant = 9 AND id_speciale = 10;
UPDATE P04_resultat SET position = 28 WHERE id_participant = 11 AND id_speciale = 10;
UPDATE P04_resultat SET position = 15 WHERE id_participant = 13 AND id_speciale = 10;
UPDATE P04_resultat SET position = 6 WHERE id_participant = 15 AND id_speciale = 10;
UPDATE P04_resultat SET position = 14 WHERE id_participant = 22 AND id_speciale = 10;
UPDATE P04_resultat SET position = 3 WHERE id_participant = 24 AND id_speciale = 10;
UPDATE P04_resultat SET position = 23 WHERE id_participant = 26 AND id_speciale = 10;
UPDATE P04_resultat SET position = 9 WHERE id_participant = 28 AND id_speciale = 10;
UPDATE P04_resultat SET position = 13 WHERE id_participant = 30 AND id_speciale = 10;
UPDATE P04_resultat SET position = 29 WHERE id_participant = 32 AND id_speciale = 10;
UPDATE P04_resultat SET position = 4 WHERE id_participant = 34 AND id_speciale = 10;
UPDATE P04_resultat SET position = 30 WHERE id_participant = 36 AND id_speciale = 10;
UPDATE P04_resultat SET position = 25 WHERE id_participant = 38 AND id_speciale = 10;
UPDATE P04_resultat SET position = 11 WHERE id_participant = 40 AND id_speciale = 10;
UPDATE P04_resultat SET position = 19 WHERE id_participant = 42 AND id_speciale = 10;
UPDATE P04_resultat SET position = 33 WHERE id_participant = 44 AND id_speciale = 10;
UPDATE P04_resultat SET position = 34 WHERE id_participant = 46 AND id_speciale = 10;
UPDATE P04_resultat SET position = 31 WHERE id_participant = 48 AND id_speciale = 10;
UPDATE P04_resultat SET position = 10 WHERE id_participant = 50 AND id_speciale = 10;
UPDATE P04_resultat SET position = 26 WHERE id_participant = 52 AND id_speciale = 10;
UPDATE P04_resultat SET position = 16 WHERE id_participant = 54 AND id_speciale = 10;
UPDATE P04_resultat SET position = 32 WHERE id_participant = 56 AND id_speciale = 10;
UPDATE P04_resultat SET position = 7 WHERE id_participant = 58 AND id_speciale = 10;
UPDATE P04_resultat SET position = 24 WHERE id_participant = 60 AND id_speciale = 10;


 -- modification pour l'etape 11


UPDATE P04_resultat
SET position = 21
WHERE id_participant = 1 AND id_speciale = 11;

UPDATE P04_resultat
SET position = 26
WHERE id_participant = 2 AND id_speciale = 11;

UPDATE P04_resultat
SET position = 34
WHERE id_participant = 3 AND id_speciale = 11;

UPDATE P04_resultat
SET position = 15
WHERE id_participant = 4 AND id_speciale = 11;

UPDATE P04_resultat
SET position = 5
WHERE id_participant = 5 AND id_speciale = 11;

UPDATE P04_resultat
SET position = 6
WHERE id_participant = 6 AND id_speciale = 11;

UPDATE P04_resultat
SET position = 17
WHERE id_participant = 8 AND id_speciale = 11;

UPDATE P04_resultat
SET position = 19
WHERE id_participant = 10 AND id_speciale = 11;

UPDATE P04_resultat
SET position = 30
WHERE id_participant = 12 AND id_speciale = 11;

UPDATE P04_resultat
SET position = 10
WHERE id_participant = 14 AND id_speciale = 11;

UPDATE P04_resultat
SET position = 25
WHERE id_participant = 16 AND id_speciale = 11;

UPDATE P04_resultat
SET position = 32
WHERE id_participant = 17 AND id_speciale = 11;

UPDATE P04_resultat
SET position = 31
WHERE id_participant = 18 AND id_speciale = 11;

UPDATE P04_resultat
SET position = 18
WHERE id_participant = 19 AND id_speciale = 11;

UPDATE P04_resultat
SET position = 24
WHERE id_participant = 20 AND id_speciale = 11;

UPDATE P04_resultat
SET position = 12
WHERE id_participant = 21 AND id_speciale = 11;

UPDATE P04_resultat
SET position = 9
WHERE id_participant = 23 AND id_speciale = 11;

UPDATE P04_resultat
SET position = 14
WHERE id_participant = 25 AND id_speciale = 11;

UPDATE P04_resultat
SET position = 35
WHERE id_participant = 27 AND id_speciale = 11;

UPDATE P04_resultat
SET position = 8
WHERE id_participant = 29 AND id_speciale = 11;

UPDATE P04_resultat
SET position = 33
WHERE id_participant = 31 AND id_speciale = 11;

UPDATE P04_resultat
SET position = 20
WHERE id_participant = 33 AND id_speciale = 11;

UPDATE P04_resultat
SET position = 27
WHERE id_participant = 35 AND id_speciale = 11;

UPDATE P04_resultat
SET position = 22
WHERE id_participant = 37 AND id_speciale = 11;

UPDATE P04_resultat
SET position = 11
WHERE id_participant = 39 AND id_speciale = 11;

UPDATE P04_resultat
SET position = 7
WHERE id_participant = 41 AND id_speciale = 11;

UPDATE P04_resultat
SET position = 23
WHERE id_participant = 43 AND id_speciale = 11;

UPDATE P04_resultat
SET position = 16
WHERE id_participant = 45 AND id_speciale = 11;

UPDATE P04_resultat
SET position = 3
WHERE id_participant = 47 AND id_speciale = 11;

UPDATE P04_resultat
SET position = 29
WHERE id_participant = 49 AND id_speciale = 11;

UPDATE P04_resultat
SET position = 1
WHERE id_participant = 51 AND id_speciale = 11;

UPDATE P04_resultat
SET position = 2
WHERE id_participant = 53 AND id_speciale = 11;

UPDATE P04_resultat
SET position = 13
WHERE id_participant = 55 AND id_speciale = 11;

UPDATE P04_resultat
SET position = 4
WHERE id_participant = 57 AND id_speciale = 11;

UPDATE P04_resultat
SET position = 28
WHERE id_participant = 59 AND id_speciale = 11;


UPDATE P04_resultat SET position = 6 WHERE id_participant = 7 AND id_speciale = 11;
UPDATE P04_resultat SET position = 17 WHERE id_participant = 9 AND id_speciale = 11;
UPDATE P04_resultat SET position = 19 WHERE id_participant = 11 AND id_speciale = 11;
UPDATE P04_resultat SET position = 30 WHERE id_participant = 13 AND id_speciale = 11;
UPDATE P04_resultat SET position = 10 WHERE id_participant = 15 AND id_speciale = 11;
UPDATE P04_resultat SET position = 12 WHERE id_participant = 22 AND id_speciale = 11;
UPDATE P04_resultat SET position = 9 WHERE id_participant = 24 AND id_speciale = 11;
UPDATE P04_resultat SET position = 14 WHERE id_participant = 26 AND id_speciale = 11;
UPDATE P04_resultat SET position = 35 WHERE id_participant = 28 AND id_speciale = 11;
UPDATE P04_resultat SET position = 8 WHERE id_participant = 30 AND id_speciale = 11;
UPDATE P04_resultat SET position = 33 WHERE id_participant = 32 AND id_speciale = 11;
UPDATE P04_resultat SET position = 20 WHERE id_participant = 34 AND id_speciale = 11;
UPDATE P04_resultat SET position = 27 WHERE id_participant = 36 AND id_speciale = 11;
UPDATE P04_resultat SET position = 22 WHERE id_participant = 38 AND id_speciale = 11;
UPDATE P04_resultat SET position = 11 WHERE id_participant = 40 AND id_speciale = 11;
UPDATE P04_resultat SET position = 7 WHERE id_participant = 42 AND id_speciale = 11;
UPDATE P04_resultat SET position = 23 WHERE id_participant = 44 AND id_speciale = 11;
UPDATE P04_resultat SET position = 16 WHERE id_participant = 46 AND id_speciale = 11;
UPDATE P04_resultat SET position = 3 WHERE id_participant = 48 AND id_speciale = 11;
UPDATE P04_resultat SET position = 29 WHERE id_participant = 50 AND id_speciale = 11;
UPDATE P04_resultat SET position = 1 WHERE id_participant = 52 AND id_speciale = 11;
UPDATE P04_resultat SET position = 2 WHERE id_participant = 54 AND id_speciale = 11;
UPDATE P04_resultat SET position = 13 WHERE id_participant = 56 AND id_speciale = 11;
UPDATE P04_resultat SET position = 4 WHERE id_participant = 58 AND id_speciale = 11;
UPDATE P04_resultat SET position = 28 WHERE id_participant = 60 AND id_speciale = 11;


 -- modification pour l'etape 12


UPDATE P04_resultat
SET position = 17
WHERE id_participant = 1 AND id_speciale = 12;

UPDATE P04_resultat
SET position = 34
WHERE id_participant = 2 AND id_speciale = 12;

UPDATE P04_resultat
SET position = 29
WHERE id_participant = 3 AND id_speciale = 12;

UPDATE P04_resultat
SET position = 32
WHERE id_participant = 4 AND id_speciale = 12;

UPDATE P04_resultat
SET position = 23
WHERE id_participant = 5 AND id_speciale = 12;

UPDATE P04_resultat
SET position = 24
WHERE id_participant = 6 AND id_speciale = 12;

UPDATE P04_resultat
SET position = 3
WHERE id_participant = 8 AND id_speciale = 12;

UPDATE P04_resultat
SET position = 30
WHERE id_participant = 10 AND id_speciale = 12;

UPDATE P04_resultat
SET position = 8
WHERE id_participant = 12 AND id_speciale = 12;

UPDATE P04_resultat
SET position = 15
WHERE id_participant = 14 AND id_speciale = 12;

UPDATE P04_resultat
SET position = 10
WHERE id_participant = 16 AND id_speciale = 12;

UPDATE P04_resultat
SET position = 11
WHERE id_participant = 17 AND id_speciale = 12;

UPDATE P04_resultat
SET position = 27
WHERE id_participant = 18 AND id_speciale = 12;

UPDATE P04_resultat
SET position = 26
WHERE id_participant = 19 AND id_speciale = 12;

UPDATE P04_resultat
SET position = 6
WHERE id_participant = 20 AND id_speciale = 12;

UPDATE P04_resultat
SET position = 12
WHERE id_participant = 21 AND id_speciale = 12;

UPDATE P04_resultat
SET position = 21
WHERE id_participant = 23 AND id_speciale = 12;

UPDATE P04_resultat
SET position = 5
WHERE id_participant = 25 AND id_speciale = 12;

UPDATE P04_resultat
SET position = 16
WHERE id_participant = 27 AND id_speciale = 12;

UPDATE P04_resultat
SET position = 28
WHERE id_participant = 29 AND id_speciale = 12;

UPDATE P04_resultat
SET position = 9
WHERE id_participant = 31 AND id_speciale = 12;

UPDATE P04_resultat
SET position = 2
WHERE id_participant = 33 AND id_speciale = 12;

UPDATE P04_resultat
SET position = 19
WHERE id_participant = 35 AND id_speciale = 12;

UPDATE P04_resultat
SET position = 33
WHERE id_participant = 37 AND id_speciale = 12;

UPDATE P04_resultat
SET position = 18
WHERE id_participant = 39 AND id_speciale = 12;

UPDATE P04_resultat
SET position = 13
WHERE id_participant = 41 AND id_speciale = 12;

UPDATE P04_resultat
SET position = 4
WHERE id_participant = 43 AND id_speciale = 12;

UPDATE P04_resultat
SET position = 35
WHERE id_participant = 45 AND id_speciale = 12;

UPDATE P04_resultat
SET position = 1
WHERE id_participant = 47 AND id_speciale = 12;

UPDATE P04_resultat
SET position = 7
WHERE id_participant = 49 AND id_speciale = 12;

UPDATE P04_resultat
SET position = 22
WHERE id_participant = 51 AND id_speciale = 12;

UPDATE P04_resultat
SET position = 31
WHERE id_participant = 53 AND id_speciale = 12;

UPDATE P04_resultat
SET position = 14
WHERE id_participant = 55 AND id_speciale = 12;

UPDATE P04_resultat
SET position = 25
WHERE id_participant = 57 AND id_speciale = 12;

UPDATE P04_resultat
SET position = 20
WHERE id_participant = 59 AND id_speciale = 12;


UPDATE P04_resultat SET position = 24 WHERE id_participant = 7 AND id_speciale = 12;
UPDATE P04_resultat SET position = 3 WHERE id_participant = 9 AND id_speciale = 12;
UPDATE P04_resultat SET position = 30 WHERE id_participant = 11 AND id_speciale = 12;
UPDATE P04_resultat SET position = 8 WHERE id_participant = 13 AND id_speciale = 12;
UPDATE P04_resultat SET position = 15 WHERE id_participant = 15 AND id_speciale = 12;
UPDATE P04_resultat SET position = 12 WHERE id_participant = 22 AND id_speciale = 12;
UPDATE P04_resultat SET position = 21 WHERE id_participant = 24 AND id_speciale = 12;
UPDATE P04_resultat SET position = 5 WHERE id_participant = 26 AND id_speciale = 12;
UPDATE P04_resultat SET position = 16 WHERE id_participant = 28 AND id_speciale = 12;
UPDATE P04_resultat SET position = 28 WHERE id_participant = 30 AND id_speciale = 12;
UPDATE P04_resultat SET position = 9 WHERE id_participant = 32 AND id_speciale = 12;
UPDATE P04_resultat SET position = 2 WHERE id_participant = 34 AND id_speciale = 12;
UPDATE P04_resultat SET position = 19 WHERE id_participant = 36 AND id_speciale = 12;
UPDATE P04_resultat SET position = 33 WHERE id_participant = 38 AND id_speciale = 12;
UPDATE P04_resultat SET position = 18 WHERE id_participant = 40 AND id_speciale = 12;
UPDATE P04_resultat SET position = 13 WHERE id_participant = 42 AND id_speciale = 12;
UPDATE P04_resultat SET position = 4 WHERE id_participant = 44 AND id_speciale = 12;
UPDATE P04_resultat SET position = 35 WHERE id_participant = 46 AND id_speciale = 12;
UPDATE P04_resultat SET position = 1 WHERE id_participant = 48 AND id_speciale = 12;
UPDATE P04_resultat SET position = 7 WHERE id_participant = 50 AND id_speciale = 12;
UPDATE P04_resultat SET position = 22 WHERE id_participant = 52 AND id_speciale = 12;
UPDATE P04_resultat SET position = 31 WHERE id_participant = 54 AND id_speciale = 12;
UPDATE P04_resultat SET position = 14 WHERE id_participant = 56 AND id_speciale = 12;
UPDATE P04_resultat SET position = 25 WHERE id_participant = 58 AND id_speciale = 12;
UPDATE P04_resultat SET position = 20 WHERE id_participant = 60 AND id_speciale = 12;


 -- modification pour l'etape 13


UPDATE P04_resultat
SET position = 22
WHERE id_participant = 1 AND id_speciale = 13;

UPDATE P04_resultat
SET position = 15
WHERE id_participant = 2 AND id_speciale = 13;

UPDATE P04_resultat
SET position = 30
WHERE id_participant = 3 AND id_speciale = 13;

UPDATE P04_resultat
SET position = 31
WHERE id_participant = 4 AND id_speciale = 13;

UPDATE P04_resultat
SET position = 33
WHERE id_participant = 5 AND id_speciale = 13;

UPDATE P04_resultat
SET position = 14
WHERE id_participant = 6 AND id_speciale = 13;

UPDATE P04_resultat
SET position = 21
WHERE id_participant = 8 AND id_speciale = 13;

UPDATE P04_resultat
SET position = 16
WHERE id_participant = 10 AND id_speciale = 13;

UPDATE P04_resultat
SET position = 10
WHERE id_participant = 12 AND id_speciale = 13;

UPDATE P04_resultat
SET position = 11
WHERE id_participant = 14 AND id_speciale = 13;

UPDATE P04_resultat
SET position = 4
WHERE id_participant = 16 AND id_speciale = 13;

UPDATE P04_resultat
SET position = 9
WHERE id_participant = 17 AND id_speciale = 13;

UPDATE P04_resultat
SET position = 29
WHERE id_participant = 18 AND id_speciale = 13;

UPDATE P04_resultat
SET position = 24
WHERE id_participant = 19 AND id_speciale = 13;

UPDATE P04_resultat
SET position = 7
WHERE id_participant = 20 AND id_speciale = 13;

UPDATE P04_resultat
SET position = 34
WHERE id_participant = 21 AND id_speciale = 13;

UPDATE P04_resultat
SET position = 28
WHERE id_participant = 23 AND id_speciale = 13;

UPDATE P04_resultat
SET position = 12
WHERE id_participant = 25 AND id_speciale = 13;

UPDATE P04_resultat
SET position = 35
WHERE id_participant = 27 AND id_speciale = 13;

UPDATE P04_resultat
SET position = 1
WHERE id_participant = 29 AND id_speciale = 13;

UPDATE P04_resultat
SET position = 13
WHERE id_participant = 31 AND id_speciale = 13;

UPDATE P04_resultat
SET position = 19
WHERE id_participant = 33 AND id_speciale = 13;

UPDATE P04_resultat
SET position = 20
WHERE id_participant = 35 AND id_speciale = 13;

UPDATE P04_resultat
SET position = 27
WHERE id_participant = 37 AND id_speciale = 13;

UPDATE P04_resultat
SET position = 6
WHERE id_participant = 39 AND id_speciale = 13;

UPDATE P04_resultat
SET position = 26
WHERE id_participant = 41 AND id_speciale = 13;

UPDATE P04_resultat
SET position = 17
WHERE id_participant = 43 AND id_speciale = 13;

UPDATE P04_resultat
SET position = 18
WHERE id_participant = 45 AND id_speciale = 13;

UPDATE P04_resultat
SET position = 5
WHERE id_participant = 47 AND id_speciale = 13;

UPDATE P04_resultat
SET position = 25
WHERE id_participant = 49 AND id_speciale = 13;

UPDATE P04_resultat
SET position = 3
WHERE id_participant = 51 AND id_speciale = 13;

UPDATE P04_resultat
SET position = 8
WHERE id_participant = 53 AND id_speciale = 13;

UPDATE P04_resultat
SET position = 2
WHERE id_participant = 55 AND id_speciale = 13;

UPDATE P04_resultat
SET position = 23
WHERE id_participant = 57 AND id_speciale = 13;

UPDATE P04_resultat
SET position = 32
WHERE id_participant = 59 AND id_speciale = 13;



UPDATE P04_resultat SET position = 14 WHERE id_participant = 7 AND id_speciale = 13;
UPDATE P04_resultat SET position = 21 WHERE id_participant = 9 AND id_speciale = 13;
UPDATE P04_resultat SET position = 16 WHERE id_participant = 11 AND id_speciale = 13;
UPDATE P04_resultat SET position = 10 WHERE id_participant = 13 AND id_speciale = 13;
UPDATE P04_resultat SET position = 11 WHERE id_participant = 15 AND id_speciale = 13;
UPDATE P04_resultat SET position = 34 WHERE id_participant = 22 AND id_speciale = 13;
UPDATE P04_resultat SET position = 28 WHERE id_participant = 24 AND id_speciale = 13;
UPDATE P04_resultat SET position = 12 WHERE id_participant = 26 AND id_speciale = 13;
UPDATE P04_resultat SET position = 35 WHERE id_participant = 28 AND id_speciale = 13;
UPDATE P04_resultat SET position = 1 WHERE id_participant = 30 AND id_speciale = 13;
UPDATE P04_resultat SET position = 13 WHERE id_participant = 32 AND id_speciale = 13;
UPDATE P04_resultat SET position = 19 WHERE id_participant = 34 AND id_speciale = 13;
UPDATE P04_resultat SET position = 20 WHERE id_participant = 36 AND id_speciale = 13;
UPDATE P04_resultat SET position = 27 WHERE id_participant = 38 AND id_speciale = 13;
UPDATE P04_resultat SET position = 6 WHERE id_participant = 40 AND id_speciale = 13;
UPDATE P04_resultat SET position = 26 WHERE id_participant = 42 AND id_speciale = 13;
UPDATE P04_resultat SET position = 17 WHERE id_participant = 44 AND id_speciale = 13;
UPDATE P04_resultat SET position = 18 WHERE id_participant = 46 AND id_speciale = 13;
UPDATE P04_resultat SET position = 5 WHERE id_participant = 48 AND id_speciale = 13;
UPDATE P04_resultat SET position = 25 WHERE id_participant = 50 AND id_speciale = 13;
UPDATE P04_resultat SET position = 3 WHERE id_participant = 52 AND id_speciale = 13;
UPDATE P04_resultat SET position = 8 WHERE id_participant = 54 AND id_speciale = 13;
UPDATE P04_resultat SET position = 2 WHERE id_participant = 56 AND id_speciale = 13;
UPDATE P04_resultat SET position = 23 WHERE id_participant = 58 AND id_speciale = 13;
UPDATE P04_resultat SET position = 32 WHERE id_participant = 60 AND id_speciale = 13;



 -- modification pour l'etape 14


UPDATE P04_resultat
SET position = 10
WHERE id_participant = 1 AND id_speciale = 14;

UPDATE P04_resultat
SET position = 13
WHERE id_participant = 2 AND id_speciale = 14;

UPDATE P04_resultat
SET position = 2
WHERE id_participant = 3 AND id_speciale = 14;

UPDATE P04_resultat
SET position = 24
WHERE id_participant = 4 AND id_speciale = 14;

UPDATE P04_resultat
SET position = 3
WHERE id_participant = 5 AND id_speciale = 14;

UPDATE P04_resultat
SET position = 23
WHERE id_participant = 6 AND id_speciale = 14;

UPDATE P04_resultat
SET position = 30
WHERE id_participant = 8 AND id_speciale = 14;

UPDATE P04_resultat
SET position = 11
WHERE id_participant = 10 AND id_speciale = 14;

UPDATE P04_resultat
SET position = 8
WHERE id_participant = 12 AND id_speciale = 14;

UPDATE P04_resultat
SET position = 27
WHERE id_participant = 14 AND id_speciale = 14;

UPDATE P04_resultat
SET position = 22
WHERE id_participant = 16 AND id_speciale = 14;

UPDATE P04_resultat
SET position = 35
WHERE id_participant = 17 AND id_speciale = 14;

UPDATE P04_resultat
SET position = 20
WHERE id_participant = 18 AND id_speciale = 14;

UPDATE P04_resultat
SET position = 1
WHERE id_participant = 19 AND id_speciale = 14;

UPDATE P04_resultat
SET position = 9
WHERE id_participant = 20 AND id_speciale = 14;

UPDATE P04_resultat
SET position = 29
WHERE id_participant = 21 AND id_speciale = 14;

UPDATE P04_resultat
SET position = 6
WHERE id_participant = 23 AND id_speciale = 14;

UPDATE P04_resultat
SET position = 12
WHERE id_participant = 25 AND id_speciale = 14;

UPDATE P04_resultat
SET position = 5
WHERE id_participant = 27 AND id_speciale = 14;

UPDATE P04_resultat
SET position = 18
WHERE id_participant = 29 AND id_speciale = 14;

UPDATE P04_resultat
SET position = 19
WHERE id_participant = 31 AND id_speciale = 14;

UPDATE P04_resultat
SET position = 33
WHERE id_participant = 33 AND id_speciale = 14;

UPDATE P04_resultat
SET position = 28
WHERE id_participant = 35 AND id_speciale = 14;

UPDATE P04_resultat
SET position = 26
WHERE id_participant = 37 AND id_speciale = 14;

UPDATE P04_resultat
SET position = 17
WHERE id_participant = 39 AND id_speciale = 14;

UPDATE P04_resultat
SET position = 4
WHERE id_participant = 41 AND id_speciale = 14;

UPDATE P04_resultat
SET position = 7
WHERE id_participant = 43 AND id_speciale = 14;

UPDATE P04_resultat
SET position = 34
WHERE id_participant = 45 AND id_speciale = 14;

UPDATE P04_resultat
SET position = 25
WHERE id_participant = 47 AND id_speciale = 14;

UPDATE P04_resultat
SET position = 31
WHERE id_participant = 49 AND id_speciale = 14;

UPDATE P04_resultat
SET position = 21
WHERE id_participant = 51 AND id_speciale = 14;

UPDATE P04_resultat
SET position = 15
WHERE id_participant = 53 AND id_speciale = 14;

UPDATE P04_resultat
SET position = 16
WHERE id_participant = 55 AND id_speciale = 14;

UPDATE P04_resultat
SET position = 14
WHERE id_participant = 57 AND id_speciale = 14;

UPDATE P04_resultat
SET position = 32
WHERE id_participant = 59 AND id_speciale = 14;




UPDATE P04_resultat SET position = 23 WHERE id_participant = 7 AND id_speciale = 14;
UPDATE P04_resultat SET position = 30 WHERE id_participant = 9 AND id_speciale = 14;
UPDATE P04_resultat SET position = 11 WHERE id_participant = 11 AND id_speciale = 14;
UPDATE P04_resultat SET position = 8 WHERE id_participant = 13 AND id_speciale = 14;
UPDATE P04_resultat SET position = 27 WHERE id_participant = 15 AND id_speciale = 14;
UPDATE P04_resultat SET position = 29 WHERE id_participant = 22 AND id_speciale = 14;
UPDATE P04_resultat SET position = 6 WHERE id_participant = 24 AND id_speciale = 14;
UPDATE P04_resultat SET position = 12 WHERE id_participant = 26 AND id_speciale = 14;
UPDATE P04_resultat SET position = 5 WHERE id_participant = 28 AND id_speciale = 14;
UPDATE P04_resultat SET position = 18 WHERE id_participant = 30 AND id_speciale = 14;
UPDATE P04_resultat SET position = 19 WHERE id_participant = 32 AND id_speciale = 14;
UPDATE P04_resultat SET position = 33 WHERE id_participant = 34 AND id_speciale = 14;
UPDATE P04_resultat SET position = 28 WHERE id_participant = 36 AND id_speciale = 14;
UPDATE P04_resultat SET position = 26 WHERE id_participant = 38 AND id_speciale = 14;
UPDATE P04_resultat SET position = 17 WHERE id_participant = 40 AND id_speciale = 14;
UPDATE P04_resultat SET position = 4 WHERE id_participant = 42 AND id_speciale = 14;
UPDATE P04_resultat SET position = 7 WHERE id_participant = 44 AND id_speciale = 14;
UPDATE P04_resultat SET position = 34 WHERE id_participant = 46 AND id_speciale = 14;
UPDATE P04_resultat SET position = 25 WHERE id_participant = 48 AND id_speciale = 14;
UPDATE P04_resultat SET position = 31 WHERE id_participant = 50 AND id_speciale = 14;
UPDATE P04_resultat SET position = 21 WHERE id_participant = 52 AND id_speciale = 14;
UPDATE P04_resultat SET position = 15 WHERE id_participant = 54 AND id_speciale = 14;
UPDATE P04_resultat SET position = 16 WHERE id_participant = 56 AND id_speciale = 14;
UPDATE P04_resultat SET position = 14 WHERE id_participant = 58 AND id_speciale = 14;
UPDATE P04_resultat SET position = 32 WHERE id_participant = 60 AND id_speciale = 14;



 -- modification pour l'etape 15


UPDATE P04_resultat
SET position = 11
WHERE id_participant = 1 AND id_speciale = 15;

UPDATE P04_resultat
SET position = 12
WHERE id_participant = 2 AND id_speciale = 15;

UPDATE P04_resultat
SET position = 17
WHERE id_participant = 3 AND id_speciale = 15;

UPDATE P04_resultat
SET position = 33
WHERE id_participant = 4 AND id_speciale = 15;

UPDATE P04_resultat
SET position = 10
WHERE id_participant = 5 AND id_speciale = 15;

UPDATE P04_resultat
SET position = 9
WHERE id_participant = 6 AND id_speciale = 15;

UPDATE P04_resultat
SET position = 7
WHERE id_participant = 8 AND id_speciale = 15;

UPDATE P04_resultat
SET position = 6
WHERE id_participant = 10 AND id_speciale = 15;

UPDATE P04_resultat
SET position = 23
WHERE id_participant = 12 AND id_speciale = 15;

UPDATE P04_resultat
SET position = 28
WHERE id_participant = 14 AND id_speciale = 15;

UPDATE P04_resultat
SET position = 13
WHERE id_participant = 16 AND id_speciale = 15;

UPDATE P04_resultat
SET position = 26
WHERE id_participant = 17 AND id_speciale = 15;

UPDATE P04_resultat
SET position = 15
WHERE id_participant = 18 AND id_speciale = 15;

UPDATE P04_resultat
SET position = 31
WHERE id_participant = 19 AND id_speciale = 15;

UPDATE P04_resultat
SET position = 22
WHERE id_participant = 20 AND id_speciale = 15;

UPDATE P04_resultat
SET position = 34
WHERE id_participant = 21 AND id_speciale = 15;

UPDATE P04_resultat
SET position = 5
WHERE id_participant = 23 AND id_speciale = 15;

UPDATE P04_resultat
SET position = 2
WHERE id_participant = 25 AND id_speciale = 15;

UPDATE P04_resultat
SET position = 14
WHERE id_participant = 27 AND id_speciale = 15;

UPDATE P04_resultat
SET position = 1
WHERE id_participant = 29 AND id_speciale = 15;

UPDATE P04_resultat
SET position = 30
WHERE id_participant = 31 AND id_speciale = 15;

UPDATE P04_resultat
SET position = 35
WHERE id_participant = 33 AND id_speciale = 15;

UPDATE P04_resultat
SET position = 18
WHERE id_participant = 35 AND id_speciale = 15;

UPDATE P04_resultat
SET position = 24
WHERE id_participant = 37 AND id_speciale = 15;

UPDATE P04_resultat
SET position = 19
WHERE id_participant = 39 AND id_speciale = 15;

UPDATE P04_resultat
SET position = 8
WHERE id_participant = 41 AND id_speciale = 15;

UPDATE P04_resultat
SET position = 25
WHERE id_participant = 43 AND id_speciale = 15;

UPDATE P04_resultat
SET position = 16
WHERE id_participant = 45 AND id_speciale = 15;

UPDATE P04_resultat
SET position = 32
WHERE id_participant = 47 AND id_speciale = 15;

UPDATE P04_resultat
SET position = 4
WHERE id_participant = 49 AND id_speciale = 15;

UPDATE P04_resultat
SET position = 20
WHERE id_participant = 51 AND id_speciale = 15;

UPDATE P04_resultat
SET position = 29
WHERE id_participant = 53 AND id_speciale = 15;

UPDATE P04_resultat
SET position = 21
WHERE id_participant = 55 AND id_speciale = 15;

UPDATE P04_resultat
SET position = 27
WHERE id_participant = 57 AND id_speciale = 15;

UPDATE P04_resultat
SET position = 3
WHERE id_participant = 59 AND id_speciale = 15;


UPDATE P04_resultat SET position = 9 WHERE id_participant = 7 AND id_speciale = 15;
UPDATE P04_resultat SET position = 7 WHERE id_participant = 9 AND id_speciale = 15;
UPDATE P04_resultat SET position = 6 WHERE id_participant = 11 AND id_speciale = 15;
UPDATE P04_resultat SET position = 23 WHERE id_participant = 13 AND id_speciale = 15;
UPDATE P04_resultat SET position = 28 WHERE id_participant = 15 AND id_speciale = 15;
UPDATE P04_resultat SET position = 34 WHERE id_participant = 22 AND id_speciale = 15;
UPDATE P04_resultat SET position = 5 WHERE id_participant = 24 AND id_speciale = 15;
UPDATE P04_resultat SET position = 2 WHERE id_participant = 26 AND id_speciale = 15;
UPDATE P04_resultat SET position = 14 WHERE id_participant = 28 AND id_speciale = 15;
UPDATE P04_resultat SET position = 1 WHERE id_participant = 30 AND id_speciale = 15;
UPDATE P04_resultat SET position = 30 WHERE id_participant = 32 AND id_speciale = 15;
UPDATE P04_resultat SET position = 35 WHERE id_participant = 34 AND id_speciale = 15;
UPDATE P04_resultat SET position = 18 WHERE id_participant = 36 AND id_speciale = 15;
UPDATE P04_resultat SET position = 24 WHERE id_participant = 38 AND id_speciale = 15;
UPDATE P04_resultat SET position = 19 WHERE id_participant = 40 AND id_speciale = 15;
UPDATE P04_resultat SET position = 8 WHERE id_participant = 42 AND id_speciale = 15;
UPDATE P04_resultat SET position = 25 WHERE id_participant = 44 AND id_speciale = 15;
UPDATE P04_resultat SET position = 16 WHERE id_participant = 46 AND id_speciale = 15;
UPDATE P04_resultat SET position = 32 WHERE id_participant = 48 AND id_speciale = 15;
UPDATE P04_resultat SET position = 4 WHERE id_participant = 50 AND id_speciale = 15;
UPDATE P04_resultat SET position = 20 WHERE id_participant = 52 AND id_speciale = 15;
UPDATE P04_resultat SET position = 29 WHERE id_participant = 54 AND id_speciale = 15;
UPDATE P04_resultat SET position = 21 WHERE id_participant = 56 AND id_speciale = 15;
UPDATE P04_resultat SET position = 27 WHERE id_participant = 58 AND id_speciale = 15;
UPDATE P04_resultat SET position = 3 WHERE id_participant = 60 AND id_speciale = 15;


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