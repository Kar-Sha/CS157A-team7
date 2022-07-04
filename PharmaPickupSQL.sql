DROP SCHEMA IF EXISTS pharmapickup;
CREATE SCHEMA pharmapickup;
USE pharmapickup;

CREATE TABLE patient (
  patient_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(32) NOT NULL,
  last_name VARCHAR(32) NOT NULL,
  username VARCHAR(32) UNIQUE NOT NULL,
  email VARCHAR (256) NOT NULL,
  password VARCHAR(60) UNIQUE NOT NULL,
  create_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (patient_id)) ENGINE=InnoDB; 
  
  INSERT INTO patient(patient_id, first_name, last_name, username, email, password, create_date)
  VALUES(1, 'Bob', 'Marley', 'bmarley123', 'bobmarley@yahoo.com', 'bobpass123', '2007-02-15 04:34:33'),
  (2, 'Maddison', 'Walle', 'madmed', 'maddison.walle@gmail.com', 'madiwall', '2008-07-22 06:54:53'),
  (3, 'Sarah', 'Buffet', 'sbuff', 'sarahbuffet@gmail.com', '24buffet', '2010-01-07 12:33:31'),
  (4, 'Tim', 'Loch', 'lochness', 'lochnessmonster@hotmail.com', 'monster', '2010-06-20 18:42:13'),
  (5, 'Pablo', 'Disney', 'disneypab', 'pablo@disney.com', 'disneyland', '2013-10-19 21:14:02');

CREATE TABLE staff (
  staff_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  username VARCHAR(32) UNIQUE NOT NULL,
  password VARCHAR(60) UNIQUE NOT NULL,
  create_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (staff_id)) ENGINE=InnoDB;

INSERT INTO staff(staff_id, username, password, create_date)
VALUES(1, 'admin', 'adminpass', '2006-01-01 01:01:01'),
(2, 'pharmacy', 'pharmapass', '2006-01-02 02:02:02');

CREATE TABLE category (
  category_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(32) UNIQUE NOT NULL,
  PRIMARY KEY (category_id)) ENGINE=InnoDB;

  INSERT INTO category(category_id, name)
  VALUES(1, 'Fever'),
  (2, 'Pain Relief'),
  (3, 'Cough/Sore Throat'),
  (4, 'Headache'),
  (5, 'Sleep Aid'),
  (6, 'Allergies');
 

CREATE TABLE medicine (
  medicine_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(32) UNIQUE NOT NULL,
  dosage VARCHAR(60) UNIQUE NOT NULL,
  category_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (medicine_id),
  FOREIGN KEY(category_id) REFERENCES category(category_id)) ENGINE=InnoDB;

INSERT INTO medicine(medicine_id, name, dosage, category_id)
VALUES(1, 'Advil', '200-400mg', 1),
(2, 'Melatonin', '1-5mg', 5),
(3, 'Tylenol', '325mg', 2),
(4, 'Robitussin', '20mg', 3);

CREATE TABLE prescription (
  prescription_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  medicine_id INT UNSIGNED NOT NULL,
  patient_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (prescription_id),
  FOREIGN KEY(medicine_id) REFERENCES medicine(medicine_id),
  FOREIGN KEY(patient_id) REFERENCES patient(patient_id)) ENGINE=InnoDB;

  INSERT INTO prescription(prescription_id, medicine_id, patient_id)
  VALUES(1,1, 1),
  (2, 3, 1),
  (3, 2, 3),
  (4, 4, 4);
