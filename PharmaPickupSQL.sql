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
