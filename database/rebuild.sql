-- *****************************
-- Database Rebuild Script
-- *****************************

-- Drop tables if they already exist
DROP TABLE IF EXISTS inventory;
DROP TABLE IF EXISTS classification;
DROP TABLE IF EXISTS account;

-- Create account type
CREATE TYPE account_type_enum AS ENUM ('Client','Admin');

-- Create account table
CREATE TABLE account (
account_id SERIAL PRIMARY KEY,
account_firstname VARCHAR(50) NOT NULL,
account_lastname VARCHAR(50) NOT NULL,
account_email VARCHAR(100) UNIQUE NOT NULL,
account_password VARCHAR(255) NOT NULL,
account_type account_type_enum DEFAULT 'Client'
);

-- Create classification table
CREATE TABLE classification (
classification_id SERIAL PRIMARY KEY,
classification_name VARCHAR(50) NOT NULL
);

-- Create inventory table
CREATE TABLE inventory (
inv_id SERIAL PRIMARY KEY,
inv_make VARCHAR(50) NOT NULL,
inv_model VARCHAR(50) NOT NULL,
inv_description TEXT,
inv_image VARCHAR(255),
inv_thumbnail VARCHAR(255),
classification_id INT REFERENCES classification(classification_id)
);

-- Insert classification data
INSERT INTO classification (classification_name)
VALUES
('Sport'),
('SUV'),
('Truck'),
('Sedan');

-- Insert inventory data
INSERT INTO inventory (inv_make, inv_model, inv_description, inv_image, inv_thumbnail, classification_id)
VALUES
('GM','Hummer','small interiors','/images/hummer.jpg','/images/hummer-tn.jpg',2),
('Ferrari','F8','Italian sports car','/images/f8.jpg','/images/f8-tn.jpg',1),
('Lamborghini','Huracan','Luxury sports car','/images/huracan.jpg','/images/huracan-tn.jpg',1);

-- Query 4 copied from assignment2.sql
UPDATE inventory
SET inv_description = REPLACE(inv_description,'small interiors','a huge interior')
WHERE inv_make = 'GM'
AND inv_model = 'Hummer';

-- Query 6 copied from assignment2.sql
UPDATE inventory
SET inv_image = REPLACE(inv_image,'/images/','/images/vehicles/'),
    inv_thumbnail = REPLACE(inv_thumbnail,'/images/','/images/vehicles/');