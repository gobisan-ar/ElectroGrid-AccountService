CREATE DATABASE ElectricityAccountDB;
USE ElectricityAccountDB;

DROP TABLE IF EXISTS ElectricityAccount;
CREATE TABLE ElectricityAccount(
eacc_id INT NOT NULL AUTO_INCREMENT,
eacc_name VARCHAR(30),
billing_address VARCHAR(50) NOT NULL,
con_type VARCHAR(30),
con_purpose VARCHAR(30),
con_status VARCHAR(30),
electrcity_supply int,
premise CHAR(6) NOT NULL,

PRIMARY KEY (eacc_id)
);

ALTER TABLE ElectricityAccount AUTO_INCREMENT=100; 

INSERT INTO ElectricityAccount (eacc_name, billing_address, con_type, con_purpose, con_status, electrcity_supply, premise) 
VALUES("Home", "No 77, Mayer Street", "Permanent", "Domestic", "Active", "30", "WEL236");

INSERT INTO ElectricityAccount (eacc_name, billing_address, con_type, con_purpose, con_status, electrcity_supply, premise) 
VALUES("Hardware_Shop", "No 5, Marine Drive", "Temporary", "Shop", "Active", "15", "BAM134");

INSERT INTO ElectricityAccount (eacc_name, billing_address, con_type, con_purpose, con_status, electrcity_supply, premise) 
VALUES("Metal_Factory", "No 14, Dry Lake", "Permanent", "Factory", "Active", "60", "MAL134");

INSERT INTO ElectricityAccount (eacc_name, billing_address, con_type, con_purpose, con_status, electrcity_supply, premise) 
VALUES("Food_Cafe", "No 14, Cofee Lake", "Permanent", "Hotel", "Active", "60", "MAL134");

INSERT INTO ElectricityAccount (eacc_name, billing_address, con_type, con_purpose, con_status, electrcity_supply, premise) 
VALUES("Home", "No 23, Hill Street", "Temporary", "Domestic", "Disconnected", "15", "DEH134");

INSERT INTO ElectricityAccount (eacc_name, billing_address, con_type, con_purpose, con_status, electrcity_supply, premise) 
VALUES("Home", "No 59, Kigs Street", "Permanent", "Domestic", "Active", "30", "WEL236");

INSERT INTO ElectricityAccount (eacc_name, billing_address, con_type, con_purpose, con_status, electrcity_supply, premise) 
VALUES("Mechanic_Shop", "No 5, Marine Drive", "Temporary", "Shop", "Active", "30", "MAL134");

INSERT INTO ElectricityAccount (eacc_name, billing_address, con_type, con_purpose, con_status, electrcity_supply, premise) 
VALUES("Garment_Factory", "No 33, Silk Street", "Permanent", "Factory", "Active", "60", "MOR134");

INSERT INTO ElectricityAccount (eacc_name, billing_address, con_type, con_purpose, con_status, electrcity_supply, premise) 
VALUES("Icecream_Cafe", "No 56, Choclate Lake", "Permanent", "Hotel", "Active", "15", "WEL236");

INSERT INTO ElectricityAccount (eacc_name, billing_address, con_type, con_purpose, con_status, electrcity_supply, premise) 
VALUES("Home", "No 23, Gate Drive", "Temporary", "Domestic", "Disconnected", "15", "DEH134");