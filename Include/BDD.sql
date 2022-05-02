CREATE DATABASE IF NOT EXISTS FEUX;
SHOW DATABASES;

USE FEUX;

CREATE TABLE `FEUX`.`PANNE` ( `F1` VARCHAR(3) NOT NULL , `F2` VARCHAR(3) NOT NULL , `F3` VARCHAR(3) NOT NULL , `F4` VARCHAR(3) NOT NULL , `F5` VARCHAR(3) NOT NULL , `FP1` VARCHAR(2) NOT NULL , `FP2` VARCHAR(2) NOT NULL , `D` VARCHAR(1) NOT NULL ) ENGINE = InnoDB;

INSERT INTO `PANNE` (`F1`, `F2`, `F3`, `F4`, `F5`, `FP1`, `FP2`, `D`) VALUES ('010', '010', '010', '010', '010', '00', '00', '2'), ('000', '000', '000', '000', '000', '00', '00', '2');


CREATE TABLE `FEUX`.`CLASSIQUE` ( `F1` VARCHAR(3) NOT NULL , `F2` VARCHAR(3) NOT NULL , `F3` VARCHAR(3) NOT NULL , `F4` VARCHAR(3) NOT NULL , `F5` VARCHAR(3) NOT NULL , `FP1` VARCHAR(2) NOT NULL , `FP2` VARCHAR(2) NOT NULL , `D` VARCHAR(1) NOT NULL ) ENGINE = InnoDB;

INSERT INTO `CLASSIQUE` (`F1`, `F2`, `F3`, `F4`, `F5`, `FP1`, `FP2`, `D`) VALUES ('100', '100', '010', '010', '001', '00', '00', '3'), ('100', '100', '000', '000', '100', '00', '00', '3');



