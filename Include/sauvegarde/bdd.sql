--- LDD (langage de définition de données)

--
-- Base de données: `FEUX`
--

--- Supprime la base de données

DROP DATABASE IF EXISTS `FEUX`;

--- Crée la base de données

CREATE DATABASE IF NOT EXISTS `FEUX`;

--- Sélectionne la base de données

USE `FEUX`;

--- Supprime les tables

DROP TABLE IF EXISTS MODE;
DROP TABLE IF EXISTS SEQUENCE;

--- Crée la table MODE

CREATE TABLE IF NOT EXISTS `MODE` (
  `idMode` int(11) NOT NULL AUTO_INCREMENT,
  `nomMode` varchar(255) NOT NULL,
  PRIMARY KEY (`idMode`),
  CONSTRAINT Unique_NomClub UNIQUE (`nomMode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--- Crée la table MODE

CREATE TABLE IF NOT EXISTS `SEQUENCE` (
  `idSequence` int(11) NOT NULL AUTO_INCREMENT,
  `numeroSequence` int(11) NOT NULL,
  `idMode` int(11) NOT NULL,
  `F1` VARCHAR(3) NOT NULL DEFAULT '000', `F2` VARCHAR(3) NOT NULL DEFAULT '000', `F3` VARCHAR(3) NOT NULL DEFAULT '000', `F4` VARCHAR(3) NOT NULL DEFAULT '000', `F5` VARCHAR(3) NOT NULL DEFAULT '000', `FP1` VARCHAR(2) NOT NULL DEFAULT '00', `FP2` VARCHAR(2) NOT NULL DEFAULT '00', `Duree` INT(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`idSequence`),
  CONSTRAINT Unique_SEQUENCE UNIQUE (`idSequence`,`numeroSequence`),
  CONSTRAINT SEQUENCE_fk_1 FOREIGN KEY (`idMode`) REFERENCES MODE(`idMode`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--- LMD (langage de manipulation de données)

--- Table MODE

INSERT INTO MODE (idMode, nomMode) VALUES (NULL,'CLASSIQUE');
INSERT INTO MODE (idMode, nomMode) VALUES (NULL,'MAINTENANCE');

--- Table SEQUENCE

--- Mode MAINTENANCE

INSERT INTO `SEQUENCE` (`numeroSequence`, `idMode`, `F1`, `F2`, `F3`, `F4`, `F5`, `FP1`, `FP2`, `Duree`) VALUES ('1', '2', '010', '010', '010', '010', '010', '00', '00', 2), ('2', '2', '000', '000', '000', '000', '000', '00', '00', 2);

--- Mode CLASSIQUE

INSERT INTO `SEQUENCE` (`numeroSequence`, `idMode`, `F1`, `F2`, `F3`, `F4`, `F5`, `FP1`, `FP2`, `Duree`) VALUES ('1', '1', '100', '100', '010', '010', '001', '00', '00', 3), ('2', '1', '100', '100', '000', '000', '100', '00', '00', 4);

--- Exemples de requêtes

--- Liste des modes

SELECT * FROM MODE;

|idMode|nomMode    |
|------|-----------|
|1     |CLASSIQUE  |
|2     |MAINTENANCE|

--- Liste des séquences pour un mode (ici CLASSIQUE)
--- avec l'id du MODE

SELECT * FROM SEQUENCE INNER JOIN MODE ON MODE.idMode = SEQUENCE.idMode WHERE SEQUENCE.idMode = 1 ORDER BY SEQUENCE.numeroSequence ASC;

--- ou avec le nom du MODE :

SELECT * FROM SEQUENCE INNER JOIN MODE ON MODE.idMode = SEQUENCE.idMode WHERE MODE.nomMode = 'CLASSIQUE' ORDER BY SEQUENCE.numeroSequence ASC;

|idSequence|numeroSequence|idMode|F1 |F2 |F3 |F4 |F5 |FP1|FP2|Duree|idMode|nomMode  |
|----------|--------------|------|---|---|---|---|---|---|---|-----|------|---------|
|3         |1             |1     |100|100|010|010|001|00 |00 |3    |1     |CLASSIQUE|
|4         |2             |1     |100|100|000|000|100|00 |00 |4    |1     |CLASSIQUE|

