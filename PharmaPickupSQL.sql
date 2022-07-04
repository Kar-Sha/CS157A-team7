DROP SCHEMA IF EXISTS pharmapickup;
CREATE SCHEMA pharmapickup;
USE pharmapickup;

CREATE TABLE `pharmapickup`.`patient` (
  `patient_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `create_date` DATETIME NOT NULL,
  PRIMARY KEY (`patient_id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE,
  UNIQUE INDEX `password_UNIQUE` (`password` ASC) VISIBLE) ENGINE=InnoDB;


CREATE TABLE `pharmapickup`.`staff` (
  `staff_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `create_date` DATETIME NOT NULL,
  PRIMARY KEY (`staff_id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE,
  UNIQUE INDEX `password_UNIQUE` (`password` ASC) VISIBLE) ENGINE=InnoDB;
