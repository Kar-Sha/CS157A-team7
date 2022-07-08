DROP SCHEMA IF EXISTS pharmapickup;
CREATE SCHEMA pharmapickup;
USE pharmapickup;


CREATE TABLE pharmacy (
  pharmacy_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(32) UNIQUE NOT NULL,
  location VARCHAR(255) UNIQUE NOT NULL,
  PRIMARY KEY (pharmacy_id)) ENGINE=InnoDB;

  INSERT INTO pharmacy(pharmacy_id, name, location)
  VALUES(1, 'Kaiser', '123 Kaiser Road'),
  (2, 'CVS', '100 CVS Drive');


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
  pharmacy_id INT UNSIGNED NOT NULL,
  username VARCHAR(32) UNIQUE NOT NULL,
  password VARCHAR(60) UNIQUE NOT NULL,
  create_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (staff_id),
  FOREIGN KEY(pharmacy_id) REFERENCES pharmacy(pharmacy_id)) ENGINE=InnoDB;

  INSERT INTO staff(staff_id, pharmacy_id, username, password, create_date)
  VALUES(1, 1, 'admin', 'adminpass', '2006-01-01 01:01:01'),
  (2, 2, 'pharmacy', 'pharmapass', '2006-01-02 02:02:02');


CREATE TABLE medicine (
  medicine_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(32) UNIQUE NOT NULL,
  dosage VARCHAR(60) NOT NULL,
  PRIMARY KEY (medicine_id)) ENGINE=InnoDB;

  INSERT INTO medicine(medicine_id, name, dosage)
  VALUES(1, 'Advil', '200-400mg'),
  (2, 'Melatonin', '1-5mg'),
  (3, 'Tylenol', '325mg'),
  (4, 'Robitussin', '20mg');


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
 

CREATE TABLE medicine_category (
  medicine_id INT UNSIGNED NOT NULL,
  category_id INT UNSIGNED NOT NULL,
  FOREIGN KEY(medicine_id) REFERENCES medicine(medicine_id),
  FOREIGN KEY(category_id) REFERENCES category(category_id)) ENGINE=InnoDB;

  INSERT INTO medicine_category(medicine_id, category_id)
  VALUES(1,1),
  (1,2),
  (2, 5),
  (3, 1),
  (3, 2),
  (4, 3);

CREATE TABLE prescription (
  prescription_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  patient_id INT UNSIGNED NOT NULL,
  medicine_id INT UNSIGNED NOT NULL,
  quantity INT,
  PRIMARY KEY (prescription_id),
  FOREIGN KEY(patient_id) REFERENCES patient(patient_id),
  FOREIGN KEY(medicine_id) REFERENCES medicine(medicine_id)) ENGINE=InnoDB;

  INSERT INTO prescription(prescription_id, patient_id, medicine_id, quantity)
  VALUES(1,1, 1, 3),
  (2, 1, 3, 4),
  (3, 2, 3, 2),
  (4, 4, 4, 1);

CREATE TABLE medicine_stock (
  medicine_id INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
  quantity INT,
  FOREIGN KEY(medicine_id) REFERENCES medicine(medicine_id)) ENGINE=InnoDB;

  INSERT INTO medicine_stock(medicine_id, quantity)
  VALUES(1, 50),
  (2,50),
  (3,50),
  (4,50);

CREATE TABLE patient_request (
  request_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  patient_id INT UNSIGNED NOT NULL,
  medicine_id INT UNSIGNED NOT NULL,
  approval_status VARCHAR(32),
  PRIMARY KEY (request_id),
  FOREIGN KEY(patient_id) REFERENCES patient(patient_id),
  FOREIGN KEY(medicine_id) REFERENCES medicine(medicine_id)) ENGINE=InnoDB;

 INSERT INTO patient_request(request_id, patient_id, medicine_id, approval_status)
  VALUES(1,1, 1, 'Approved'),
  (2, 1, 3, 'Denied'),
  (3, 2, 3, 'Approved'),
  (4, 4, 4, 'Approved');

CREATE TABLE patient_allergies (
  patient_id INT UNSIGNED NOT NULL,
  allergy VARCHAR(64),
  FOREIGN KEY(patient_id) REFERENCES patient(patient_id)) ENGINE=InnoDB;

INSERT INTO patient_allergies(patient_id, allergy)
  VALUES(1, NULL),
  (2,'Gluten'),
  (2, 'Lactose'),
  (3, NULL),
  (4, NULL),
  (5,'Penicillin');

CREATE TABLE ingredient (
  ingredient_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(64) UNIQUE NOT NULL,
  PRIMARY KEY (ingredient_id)) ENGINE=InnoDB;

INSERT INTO ingredient(ingredient_id, name)
  VALUES(1, 'Lactose'),
  (2, 'Gluten'),
  (3, 'Soy'),
  (4, 'Penicillin');

CREATE TABLE medicine_ingredients (
  medicine_id INT UNSIGNED NOT NULL,
  ingredient_id INT UNSIGNED NOT NULL,
  FOREIGN KEY(medicine_id) REFERENCES medicine(medicine_id),
  FOREIGN KEY(ingredient_id) REFERENCES ingredient(ingredient_id)) ENGINE=InnoDB;

  INSERT INTO medicine_ingredients(medicine_id, ingredient_id)
  VALUES(1, 2),
  (1,3),
  (3,2),
  (3,3),
  (4,3);

