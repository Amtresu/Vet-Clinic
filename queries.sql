/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon';
SELECT * from animals WHERE TO_CHAR(date_of_birth, 'yyyy') BETWEEN '2016' and '2019';
SELECT name from animals where neutered = false and escape_attempts < 3;
SELECT date_of_birth from animals where name IN ('Agumon', 'Pikachu'); 
SELECT name, escape_attempts from animals where weight_kg > 10.5;
SELECT name from animals where neutered = true;
SELECT * from animals WHERE name NOT LIKE '%Gabumon';
SELECT name from animals where weight_kg  BETWEEN 10.4 and 17.3;

BEGIN;
DELETE FROM animals 
WHERE TO_CHAR(date_of_birth,'YYYY-MON-DD') > '2022-JAN-01';

SAVEPOINT save_point1;

UPDATE animals
SET weight_kg = weight_kg*-1;

ROLLBACK TO save_point1;

UPDATE animals 
SET weight_kg=weight_kg*-1 WHERE weight_kg<0;

SELECT * FROM animals;

COMMIT;


SELECT COUNT(*) AS animal_count FROM animals;
SELECT COUNT(escapte_attempts) AS escape_count from animals WHERE escapte_attempts = 0;
SELECT AVG(weight_kg) AS weight_average FROM animals;
SELECT neutered, SUM(escapte_attempts) AS most_escapte_attempts FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg) AS min_wight, MAX(weight_kg) AS max_weight FROM animals GROUP BY species;
SELECT species, AVG(escapte_attempts) AS average_attempts FROM animals WHERE TO_CHAR(date_of_birth, 'yyyy') BETWEEN '2016' and '2019' GROUP BY species;
