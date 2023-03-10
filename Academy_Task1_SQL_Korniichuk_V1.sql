
CREATE SCHEMA IF NOT EXISTS `PhoneLight` DEFAULT CHARACTER SET utf8 ;
USE `PhoneLight` ;


CREATE TABLE IF NOT EXISTS `PhoneLight`.`phone_models` (
  `Id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `sbrand` VARCHAR(50) NOT NULL,
  `sdescription` VARCHAR(50) NOT NULL,
  `nprice` DECIMAL(6,2) NOT NULL,
  `svendor` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Id`));


CREATE TABLE IF NOT EXISTS `PhoneLight`.`consultant` (
  `Id` BIGINT(20) NOT NULL,
  `sfname` VARCHAR(255) NOT NULL,
  `slname` VARCHAR(255) NOT NULL,
  `nphone` INT(11) NOT NULL,
  PRIMARY KEY (`Id`));


CREATE TABLE IF NOT EXISTS `PhoneLight`.`order_information` (
  `Id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `nmodel_Id` BIGINT(20) NOT NULL,
  `nconsultant_Id` BIGINT(20) NOT NULL,
  `ddata` TIMESTAMP NOT NULL,
  `nprice` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `phone_models_idx` (`nmodel_Id` ASC),
  INDEX `consultant_idx` (`nconsultant_Id` ASC),
  CONSTRAINT `phone_models`
    FOREIGN KEY (`nmodel_Id`)
    REFERENCES `PhoneLight`.`phone_models` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `consultant`
    FOREIGN KEY (`nconsultant_Id`)
    REFERENCES `PhoneLight`.`consultant` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


