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

SELECT animals.name, vets.name , visits.date_of_visit 
FROM animals, vets, visits
WHERE animals.id = visits.animals_id
AND vets.id = visits.vets_id
AND vets.name = 'William Tatcher'
ORDER BY date_of_visit DESC
LIMIT 1;


SELECT DISTINCT(animals.name), vets.name , MAX(visits.date_of_visit)
FROM animals, vets, visits
WHERE animals.id = visits.animals_id
AND vets.id = visits.vets_id
AND vets.name = 'Stephanie Mendez'
GROUP BY animals.name, vets.name;

SELECT vets.name, species.name
FROM specializations 
INNER JOIN species ON species.id = specializations.species_id
FULL OUTER JOIN vets  ON specializations.vets_id = vets.id;

SELECT animals.name, vets.name, visits.date_of_visit visit_date
FROM animals, vets, visits
WHERE animals.id = visits.animals_id
AND vets.id = visits.vets_id
AND vets.name = 'Stephanie Mendez'
AND TO_CHAR(visits.date_of_visit, 'YYYY-MM-DD') BETWEEN '2020-04-01' AND '2020-08-30';


SELECT DISTINCT(animals.name) animal, COUNT(animals.name) total_visits
FROM animals, vets, visits
WHERE animals.id = visits.animals_id
AND vets.id = visits.vets_id
GROUP BY animals.name
ORDER BY total_visits DESC
LIMIT 1;

SELECT DISTINCT(animals.name) animal, visits.date_of_visit visit_date, vets.name vet
FROM vets, animals, visits
WHERE visits.animals_id = animals.id
AND visits.vets_id = vets.id
AND vets.name = 'Maisy Smith'
GROUP BY animals.name, visit_date, vet
ORDER BY visit_date
LIMIT 1;

SELECT DISTINCT(animals.name) animal, visits.date_of_visit visit_date, vets.name vet
FROM vets, animals, visits
WHERE visits.animals_id = animals.id
AND visits.vets_id = vets.id
GROUP BY animals.name, visit_date, vet
ORDER BY visit_date DESC
LIMIT 1;

SELECT COUNT(date_of_visit)-(SELECT COUNT(vets.name) 
FROM vets, specializations, animals, visits
WHERE
visits.vets_id = vets.id
AND animals.id = visits.animals_id
AND concat(animals.species_id, visits.vets_id) = concat(specializations.species_id, specializations.vets_id)) total_unspecialized_cases 
FROM visits;

WITH new AS(
    SELECT DISTINCT(animals.name) animal, COUNT(animals.name) total_visits, vets.name vet
FROM vets, animals, visits
WHERE visits.animals_id = animals.id
AND visits.vets_id = vets.id
AND vets.name = 'Maisy Smith'
GROUP BY animals.name, vet
)
SELECT * FROM new WHERE total_visits = (SELECT MAX(total_visits) FROM new);
