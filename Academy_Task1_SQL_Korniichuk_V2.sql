
CREATE SCHEMA IF NOT EXISTS `PhoneLight` DEFAULT CHARACTER SET utf8 ;
USE `PhoneLight`;


CREATE TABLE IF NOT EXISTS `PhoneLight`.`brands` (
  `Id` BIGINT(20) NOT NULL,
  `sname` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Id`));


CREATE TABLE IF NOT EXISTS `PhoneLight`.`phone_models` (
  `Id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `sdescription` VARCHAR(50) NOT NULL,
  `nprice` DECIMAL(6,2) NOT NULL,
  `nbrands` BIGINT(20) NOT NULL,
  `svendor` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `brands_idx` (`nbrands` ASC),
  CONSTRAINT `brands`
    FOREIGN KEY (`nbrands`)
    REFERENCES `PhoneLight`.`brands` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE IF NOT EXISTS `PhoneLight`.`consultant` (
  `Id` BIGINT(20) NOT NULL,
  `sfname` VARCHAR(255) NOT NULL,
  `slname` VARCHAR(255) NOT NULL,
  `nphone` INT NOT NULL,
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


CREATE TABLE IF NOT EXISTS `PhoneLight`.`brands_consultant` (
  `nbrands` BIGINT(20) NOT NULL,
  `nconsultant` BIGINT(20) NOT NULL,
  INDEX `brands_idx` (`nbrands` ASC),
  INDEX `consultant_idx` (`nconsultant` ASC),
  CONSTRAINT `brands`
    FOREIGN KEY (`nbrands`)
    REFERENCES `PhoneLight`.`brands` (`Id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `consultant`
    FOREIGN KEY (`nconsultant`)
    REFERENCES `PhoneLight`.`consultant` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    

CREATE TABLE IF NOT EXISTS `PhoneLight`.`role` (
  `Idrole` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `scode` VARCHAR(255) NULL,
  `scode` VARCHAR(255) NULL,
  PRIMARY KEY (`Idrole`));


CREATE TABLE IF NOT EXISTS `PhoneLight`.`employees_role` (
  `nrole` BIGINT(20) NOT NULL,
  `nemployees` BIGINT(20) NOT NULL,
  INDEX `role_idx` (`nemployees` ASC),
  INDEX `role_idx1` (`nrole` ASC),
  CONSTRAINT `consultant`
    FOREIGN KEY (`nemployees`)
    REFERENCES `PhoneLight`.`consultant` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `role`
    FOREIGN KEY (`nrole`)
    REFERENCES `PhoneLight`.`role` (`Idrole`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

