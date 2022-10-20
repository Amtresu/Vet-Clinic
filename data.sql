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

INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);

INSERT INTO speecies (name) VALUES ('Pokemon')
INSERT INTO speecies (name) VALUES ('Digimon')  

UPDATE animals 
SET owners_id = 1
WHERE name = 'Agumon'

UPDATE animals 
SET owners_id = 2
WHERE name IN ('Gabumon', 'Pikachu')

UPDATE animals 
SET owners_id = 3
WHERE name IN ('Charmander', 'Squirtle', 'Blossom')

UPDATE animals 
SET owners_id = 4
WHERE name IN ('Angemon', 'Boarmon')

INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);

INSERT INTO vets(name, age, date_of_graduation) VALUES
('William Tatcher', 45, '2000-Apr-23'),
('Maisy Smith', 26, '2019-Jan-17'),
('Stephanie Mendez', 64, '1981-May-04'),
('Jack Harkness', 38, '2008-Jun-08');

INSERT INTO visits VALUES
(7,1, '2020-May-24'),
(7,3, '2020-Jul-22'),
(8,4, '2021-Feb-02'),
(9,2, '2020-Jan-05'),
(9,2, '2020-Mar-08'),
(9,2, '2020-May-14'),
(10,3, '2021-May-04'),
(1,4, '2021-Feb-24'),
(2,2, '2019-Dec-21'),
(2,1, '2020-Aug-10'),
(2,2, '2021-Apr-07'),
(3,3, '2019-Sep-29'),
(4,4, '2020-Oct-03'),
(4,4, '2020-Nov-04'),
(5,2, '2019-Jan-24'),
(5,2, '2019-May-15'),
(5,2, '2020-Feb-27'),
(5,2, '2020-Aug-03'),
(6,3, '2020-May-24'),
(6,1, '2021-Jan-11');
