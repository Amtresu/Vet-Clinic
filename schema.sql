/* Database schema to keep the structure of entire database. */

CREATE TABLE animals ( 
	id INT PRIMARY KEY NOT NULL,
	name text,
	date_of_birth date,
	escapte_attempts int,
	neutered boolean, 
	weight_kg decimal
);

ALTER TABLE animals 
ADD COLUMN species VARCHAR(255);