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
  (10, 'Band-Aid', '1 Piece'),
  (11, 'Ricola', '1 Piece'),
  (12, 'Eye Drops', '1-2 Drops'),
  (13, 'Bengay', 'Apply Small Amount on Effected Area'),
  (14, 'Benadryl', '12.5-25mg'),
  (15, 'Cortizone-10', '20-240mg'),
  (16, 'CeraVe', 'Any Amount Necessary'),
  (17, 'Neosporin', 'Apply Small Amount on Effected Area'),
  (18, 'Compression Brace', '1 Piece'),
  (19, 'Bandages', '1 Piece'),
  (20, 'Mucinex', '200-400mg');
 
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
  (7, 'Congestion'),
  (8, 'Eye Irritation'),
  (9, 'Minor Cuts'),
  (10, 'Burns'),
  (11, 'Rash'),
  (12, 'Skin Irritation'),
  (13, 'Miscellaneous');
 
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
  (1,4),
  (2,5),
  (3,1),
  (3,2),
  (3,4),
  (4,3),
  (5,6),
  (6,1),
  (6,5),
  (6,6),
  (7,1),
  (7,6),
  (8,1),
  (8,2),
  (8,4),
  (9,9),
  (9,10),
  (9,12),
  (10,9),
  (11,3),
  (12,8),
  (13,2),
  (13,13),
  (14,6),
  (15,11),
  (15,12),
  (16,12),
  (17,9),
  (17,10),
  (18,13),
  (19,13),
  (20,6),
  (20,7);

-- Table for patient's prescriptions (Relationship)
CREATE TABLE prescription (
  patient_id INT UNSIGNED NOT NULL,
  medicine_id INT UNSIGNED NOT NULL,
  quantity INT,
  approval_status VARCHAR(32) DEFAULT 'Pending',
  FOREIGN KEY(patient_id) REFERENCES patient(patient_id) ON DELETE CASCADE,
  FOREIGN KEY(medicine_id) REFERENCES medicine(medicine_id)) ENGINE=InnoDB;
-- Data Instances
  INSERT INTO prescription(patient_id, medicine_id, quantity, approval_status)
  VALUES(1, 1, 3, 'Approved'),
  (1, 17, 4, 'Approved'),
  (2, 3, 2, 'Approved'),
  (4, 13, 1, 'Approved'),
  (4, 20, 3, 'Approved'),
  (5, 11, 25, 'Approved'),
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
  (4, 2, 50),
  (4, 3, 42), 
  (5, 1, 10),
  (6, 2, 30),
  (7, 4, 35),
  (8, 7, 32),
  (9, 9, 27),
  (10, 6, 51),
  (11, 6, 7),
  (11, 3, 34),
  (11, 8, 29),
  (12, 1, 41), 
  (12, 2, 10),
  (13, 5, 25),
  (13, 7, 14),
  (13, 8, 38),
  (13, 9, 29),
  (14, 10, 20),
  (15, 2, 30),
  (16, 3, 30),
  (16, 7, 22), 
  (17, 7, 12),
  (18, 6, 24),
  (19, 5, 15),
  (20, 8, 35),
  (20, 10, 50);

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
  (9, 'Ascorbic acid'),
  (10, 'Petrolatum'),
  (11, 'Glycerol'), 
  (12, 'Starch'),
  (13, 'Polyester'),
  (14, 'Nylon'),
  (15, 'PVC'),
  (16, 'Water'),
  (17, 'Menthol'),
  (18, 'Diphenhydramine HCl');
  
-- Table for ingredients that patients are allergic to (Relationship)
CREATE TABLE patient_allergies (
  patient_id INT UNSIGNED NOT NULL,
  ingredient_id INT UNSIGNED NOT NULL,
  FOREIGN KEY(patient_id) REFERENCES patient(patient_id) ON DELETE CASCADE,
  FOREIGN KEY(ingredient_id) REFERENCES ingredient(ingredient_id)) ENGINE=InnoDB;
-- Data Instances
INSERT INTO patient_allergies(patient_id, ingredient_id)
  VALUES(2,1),
  (2,2),
  (5,4),
  (6,4), 
  (6,12),
  (7,3),
  (8,4),
  (8,6),
  (8,7),
  (9,2),
  (9,4),
  (9,7),
  (9,14),
  (10,8),
  (10,16);

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
  (1,8),
  (1,11),
  (1,16),
  (2,3),
  (2,7),
  (3,1),
  (3,2),
  (3,3),
  (3,8),
  (3,11),
  (3,16),
  (4,3),
  (4,16),
  (5,1),
  (5,6),
  (5,13),
  (6,4),
  (7,8),
  (8,9),
  (9,10),
  (9,16),
  (10,15),
  (11,9),
  (11,11),
  (11,12),
  (11,17),
  (12,11),
  (12,16),
  (13,10),
  (13,17),
  (14,3),
  (14,11),
  (14,18),
  (15,10),
  (15,11),
  (15,16),
  (16,10),
  (16,11),
  (16,16),
  (17,10),
  (18,13),
  (18,14),
  (19,15),
  (20,1),
  (20,7),
  (20,8);
