DROP SCHEMA IF EXISTS pharmapickup;
CREATE SCHEMA pharmapickup;
USE pharmapickup;
 
-- Table for pharmacy (Entity Set)
CREATE TABLE pharmacy (
  pharmacy_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(32) NOT NULL,
  location VARCHAR(255) UNIQUE NOT NULL,
  PRIMARY KEY (pharmacy_id)) ENGINE=InnoDB;
-- Data Instances
  INSERT INTO pharmacy(pharmacy_id, name, location)
  VALUES(1, 'Kaiser', '123 Kaiser Road'),
  (2, 'CVS', '100 CVS Drive'),
  (3, 'CVS', '1405 Foxworthy Ave'),
  (4, 'Rite Aid', '3171 Meridian Ave'), 
  (5, 'Walgreens', '1130 Foxworthy Ave'), 
  (6, 'Walmart', '5095 Almaden Expy'), 
  (7, 'Safeway', '1663 Branham Ln'), 
  (8, 'Costco', '5301 Almaden Expy'), 
  (9, 'CVS', '4550 Meridian Ave'), 
  (10, 'Walgreens', '1376 Kooser Rd'); 

-- Table for patient (Entity Set)
CREATE TABLE patient (
  patient_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(32) NOT NULL,
  last_name VARCHAR(32) NOT NULL,
  username VARCHAR(32) UNIQUE NOT NULL,
  email VARCHAR (256) NOT NULL,
  password VARCHAR(60) UNIQUE NOT NULL,
  create_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (patient_id)) ENGINE=InnoDB;
-- Data Instances
  INSERT INTO patient(patient_id, first_name, last_name, username, email, password, create_date)
  VALUES(1, 'Bob', 'Marley', 'bmarley123', 'bobmarley@yahoo.com', 'bobpass123', '2007-02-15 04:34:33'),
  (2, 'Maddison', 'Walle', 'madmed', 'maddison.walle@gmail.com', 'madiwall', '2008-07-22 06:54:53'),
  (3, 'Sarah', 'Buffet', 'sbuff', 'sarahbuffet@gmail.com', '24buffet', '2010-01-07 12:33:31'),
  (4, 'Tim', 'Loch', 'lochness', 'lochnessmonster@hotmail.com', 'monster', '2010-06-20 18:42:13'),
  (5, 'Pablo', 'Disney', 'disneypab', 'pablo@disney.com', 'disneyland', '2011-10-19 21:14:02'),
  (6, 'Jessie', 'Smith', 'jsmithz', 'jessmith@aol.com', 'willsmith', '2013-11-22 01:13:12'),
  (7, 'Gary', 'Mod', 'garymod', 'garm@steam.com', 'valve', '2014-03-05 08:25:00'),
  (8, 'Celine', 'Dion', 'celion97', 'heartgoeson@music.com', 'music', '2014-05-11 20:10:07'),
  (9, 'Tony', 'Chopper', 'opfan5', 'tonytonychopper@onepiece.com', 'iloveop', '2014-12-25 12:25:31'),
  (10, 'Michael', 'Gold', 'goldenboy', 'michaelgold@gmail.com', 'aumetal', '2015-09-09 09:09:09');
 
-- Table for staff (Entity Set)
CREATE TABLE staff (
  staff_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  pharmacy_id INT UNSIGNED NOT NULL,
  username VARCHAR(32) UNIQUE NOT NULL,
  password VARCHAR(60) UNIQUE NOT NULL,
  create_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (staff_id),
  FOREIGN KEY(pharmacy_id) REFERENCES pharmacy(pharmacy_id)) ENGINE=InnoDB;
-- Data Instances
  INSERT INTO staff(staff_id, pharmacy_id, username, password, create_date)
  VALUES(1, 1, 'admin', 'adminpass', '2006-01-01 01:01:01'),
  (2, 2, 'pharmacy', 'pharmapass', '2006-01-02 02:02:02'),
  (3, 3, 'doctor', 'docpass', '2006-03-03 03:03:03'),
  (4, 4, 'medical', 'medpass', '2006-04-04 04:04:04'),
  (5, 5, 'nurse', 'nursepass', '2006-05-05 05:05:05'),
  (6, 6, 'help', 'helppass', '2006-06-06 06:06:06'),
  (7, 7, 'care', 'carepass', '2006-07-07 07:07:07'),
  (8, 8, 'aid', 'aidpass', '2006-08-08 08:08:08'),
  (9, 9, 'bandage', 'bandpass', '2006-09-09 09:09:09'),
  (10, 10, 'heal', 'healpass', '2006-10-10 10:10:10');
 
-- Table for medicine (Entity Set)
CREATE TABLE medicine (
  medicine_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(32) UNIQUE NOT NULL,
  dosage VARCHAR(60) NOT NULL,
  PRIMARY KEY (medicine_id)) ENGINE=InnoDB;
-- Data Instances
  INSERT INTO medicine(medicine_id, name, dosage)
  VALUES(1, 'Advil', '200-400mg'),
  (2, 'Melatonin', '1-5mg'),
  (3, 'Tylenol', '325mg'),
  (4, 'Robitussin', '20mg'),
  (5, 'Claritn-D', '120mg'),
  (6, 'NyQuil', '30mg'),
  (7, 'DayQuil', '30mg'),
  (8, 'Motrin IB', '200-400mg'),
  (9, 'Vaseline', 'Any Amount Necessary'),
  (10, 'Band-Aid', '1 piece');
 
-- Table for category (Entity Set)
CREATE TABLE category (
  category_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(32) UNIQUE NOT NULL,
  PRIMARY KEY (category_id)) ENGINE=InnoDB;
-- Data Instances
  INSERT INTO category(category_id, name)
  VALUES(1, 'Fever'),
  (2, 'Pain Relief'),
  (3, 'Cough/Sore Throat'),
  (4, 'Headache'),
  (5, 'Sleep Aid'),
  (6, 'Allergies'),
  (7, 'Eye Irritation'),
  (8, 'Minor Cuts'),
  (9, 'Burns'),
  (10, 'Rash'),
  (11, 'Skin Irritation'),
  (12, 'Miscellaneous');
 
-- Table for different categories that medicine falls under (Relationship)
CREATE TABLE medicine_category (
  medicine_id INT UNSIGNED NOT NULL,
  category_id INT UNSIGNED NOT NULL,
  FOREIGN KEY(medicine_id) REFERENCES medicine(medicine_id),
  FOREIGN KEY(category_id) REFERENCES category(category_id)) ENGINE=InnoDB;
-- Data Instances
  INSERT INTO medicine_category(medicine_id, category_id)
  VALUES(1,1),
  (1,2),
  (2, 5),
  (3, 1),
  (3, 2),
  (4, 3),
  (5, 3),
  (6, 6),
  (7, 3),
  (7, 1),
  (7, 4);

-- Table for patient's prescriptions (Relationship)
CREATE TABLE prescription (
  patient_id INT UNSIGNED NOT NULL,
  medicine_id INT UNSIGNED NOT NULL,
  quantity INT,
  approval_status VARCHAR(32) DEFAULT 'Pending',
  FOREIGN KEY(patient_id) REFERENCES patient(patient_id),
  FOREIGN KEY(medicine_id) REFERENCES medicine(medicine_id)) ENGINE=InnoDB;
-- Data Instances
  INSERT INTO prescription(patient_id, medicine_id, quantity, approval_status)
  VALUES(1, 1, 3, 'Approved'),
  (1, 3, 4, 'Approved'),
  (2, 3, 2, 'Approved'),
  (4, 4, 1, 'Approved'),
  (5, 3, 2, 'Approved'),
  (6, 4, 1, 'Approved'),
  (7, 10, 20, 'Approved'),
  (9, 6, 1, 'Approved'),
  (9, 7, 2, 'Approved'),
  (9, 8, 1, 'Approved');

-- Table for medicine stock within different pharmacies (Relationship)
CREATE TABLE medicine_stock (
  medicine_id INT UNSIGNED NOT NULL,
  pharmacy_id INT UNSIGNED NOT NULL,
  quantity INT,
  FOREIGN KEY(medicine_id) REFERENCES medicine(medicine_id),
  FOREIGN KEY(pharmacy_id) REFERENCES pharmacy(pharmacy_id)) ENGINE=InnoDB;
 -- Data Instances
  INSERT INTO medicine_stock(medicine_id, pharmacy_id, quantity)
  VALUES(1, 1, 50),
  (2, 2, 50),
  (3, 3, 50),
  (4, 3, 50),
  (4, 2, 42), 
  (5, 1, 10),
  (6, 2, 20),
  (7, 4, 15),
  (8, 7, 35),
  (9, 9, 25),
  (10, 2, 5);

-- Table for ingredients that patients are allergic to (Relationship)
CREATE TABLE patient_allergies (
  patient_id INT UNSIGNED NOT NULL,
  allergy VARCHAR(64) NOT NULL,
  FOREIGN KEY(patient_id) REFERENCES patient(patient_id)) ENGINE=InnoDB;
-- Data Instances
INSERT INTO patient_allergies(patient_id, allergy)
  VALUES(2,'Gluten'),
  (2, 'Lactose'),
  (5,'Penicillin'),
  (6, 'Soy'), 
  (6, 'Penicillin'),
  (7, 'Ibuprofen'),
  (9, 'Egg'),
  (9, 'Peanut'),
  (9, 'Paracetamol'),
  (10, 'Peanut');

-- Table for ingredients (Entity Set)
CREATE TABLE ingredient (
  ingredient_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(64) UNIQUE NOT NULL,
  PRIMARY KEY (ingredient_id)) ENGINE=InnoDB;
-- Data Instances
INSERT INTO ingredient(ingredient_id, name)
  VALUES(1, 'Lactose'),
  (2, 'Gluten'),
  (3, 'Soy'),
  (4, 'Penicillin'),
  (5, 'Ibuprofen'),
  (6, 'Peanut'),
  (7, 'Egg'),
  (8, 'Paracetamol'),
  (9, 'Atorvastatin'),
  (10, 'Ascorbic acid');

-- Table of ingredients within medicines (Relationship)
CREATE TABLE medicine_ingredients (
  medicine_id INT UNSIGNED NOT NULL,
  ingredient_id INT UNSIGNED NOT NULL,
  FOREIGN KEY(medicine_id) REFERENCES medicine(medicine_id),
  FOREIGN KEY(ingredient_id) REFERENCES ingredient(ingredient_id)) ENGINE=InnoDB;
 -- Data Instances
  INSERT INTO medicine_ingredients(medicine_id, ingredient_id)
  VALUES(1, 2),
  (1,3),
  (3,2),
  (3,3),
  (4,3),
  (5,6),
  (6,4),
  (7,8),
  (8,10),
  (9,9);
