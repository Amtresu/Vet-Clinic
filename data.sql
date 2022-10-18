/* Populate database with sample data. */

INSERT INTO animals VALUES (1,'Agumon', '2020-FEB-03', 0, TRUE, 10.23);
INSERT INTO animals VALUES (2,'Gabumon', '2018-NOV-15', 2, TRUE, 8);
INSERT INTO animals VALUES (3,'Pikachu', '2021-JAN-07', 1, FALSE, 15.04);
INSERT INTO animals VALUES (4,'Devimon', '2017-MAY-12', 5, TRUE, 11);
INSERT INTO animals VALUES (5,'Charmander', '2022-FEB-08', 0, FALSE, -11);
INSERT INTO animals VALUES (6,'Plantmon', '2021-NOV-15', 2, FALSE, -5.7);
INSERT INTO animals VALUES (7,'Squirtle', '1993-APR-02', 3, FALSE, -12.13);
INSERT INTO animals VALUES (8,'Angemon', '2005-JUN-12', 1, TRUE, -45);
INSERT INTO animals VALUES (9,'Boarmon', '2005-JUN-07', 7, TRUE, 20.4);
INSERT INTO animals VALUES (10,'Blossom', '1998-OCT-13', 3, TRUE, 17);
INSERT INTO animals VALUES (11,'Ditto', '2022-MAY-14', 4, TRUE, 22);

BEGIN;
UPDATE animals
SET species = 'Digimon'
WHERE name LIKE '%mon';

UPDATE animals
SET species = 'Pokemon'
WHERE name NOT LIKE '%mon';

COMMIT;