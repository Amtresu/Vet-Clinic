/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon';
SELECT * from animals WHERE TO_CHAR(date_of_birth, 'yyyy') BETWEEN '2016' and '2019';
SELECT name from animals where neutered = false and escape_attempts < 3;
SELECT date_of_birth from animals where name IN ('Agumon', 'Pikachu'); 
SELECT name, escape_attempts from animals where weight_kg > 10.5;
SELECT name from animals where neutered = true;
SELECT * from animals WHERE name NOT LIKE '%Gabumon';
SELECT name from animals where weight_kg  BETWEEN 10.4 and 17.3;