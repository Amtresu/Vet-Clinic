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

CREATE TABLE owners(
    id serial PRIMARY KEY,
    full_name text,
    age int
);

CREATE TABLE species(
    id serial PRIMARY KEY,
    name text
);

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD COLUMN species_ID INT REFERENCES species(id);

ALTER TABLE animals
ADD COLUMN owners_id INT REFERENCES owners(id);

UPDATE animals
SET species_id = 2
WHERE name NOT LIKE '%mon'

UPDATE animals
SET species_id = 2
WHERE name NOT LIKE '%mon'

CREATE TABLE vets ( 
	id  INT GENERATED ALWAYS AS IDENTITY,
	name text,
	age INT,
	date_of_graduation date
);
