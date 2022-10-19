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

SELECT name FROM animals JOIN owners ON animals.owners_id=owners.id WHERE owners.full_name='Bob';
SELECT (animals.name) FROM animals  JOIN species ON animals.species_id=species.id WHERE (animals.name) NOT LIKE '%mon';
SELECT * FROM owners LEFT JOIN animals ON owners.id=animals.owners_id;
SELECT COUNT(animals.species_id),  species.name FROM animals JOIN species on animals.species_id = species.id GROUP BY species.name, animals.species_id;
select name FROM animals WHERE owners_id = 2 AND name LIKE '%mon';
SELECT * FROM animals  JOIN owners  ON animals.owners_id=owners.id WHERE owners.full_name='Dean Winchester'
AND animals.escapte_attempts = 0;
SELECT COUNT(*) AS owners_count, owners.full_name FROM animals  JOIN owners  ON owners.id=animals.owners_id GROUP BY owners.full_name ORDER BY owners_count DESC LIMIT 1;;




