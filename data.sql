/* Populate database with sample data. */

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
    VALUES ('Agumon', '2020-02-03', 0, true, 10.23);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
    VALUES ('Gabumon', '2018-11-15', 2, true, 8);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
    VALUES ('Pikachu', '2021-01-07', 1, false, 15.04);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
    VALUES ('Devimon', '2017-05-12', 5, true, 11);

-- After species column is added to animals table
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg, species)
    VALUES ('Charmander', '2020-02-08', 0, false, -11, 'Animal');
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg, species)
    VALUES ('Plantmon', '2021-11-15', 2, true, -5.7, 'Animal');
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg, species)
    VALUES ('Squirtle', '1993-04-02', 3, false, -12.13, 'Animal');
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg, species)
    VALUES ('Angemon', '2005-06-12', 1, true, -45, 'Animal');
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg, species)
    VALUES ('Boarmon', '2005-06-07', 7, true, 20.4, 'Animal');
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg, species)
    VALUES ('Blossom', '1998-10-13', 3, true, 17, 'Animal');
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg, species)
    VALUES ('Ditto', '2022-05-14', 4, true, 22, 'Animal');

INSERT INTO owners(full_name, age)
    VALUES ('Sam Smith', 34);
INSERT INTO owners(full_name, age)
    VALUES ('Jennifer Orwell', 19);
INSERT INTO owners(full_name, age)
    VALUES ('Bob', 45);
INSERT INTO owners(full_name, age)
    VALUES ('Melody Pond', 77);
INSERT INTO owners(full_name, age)
    VALUES ('Dean Winchester', 14);
INSERT INTO owners(full_name, age)
    VALUES ('Jodie Whittaker', 38);

INSERT INTO species(name)
    VALUES ('Pokemon');
INSERT INTO species(name)
    VALUES ('Digimon');

-- Modify your inserted animals so it includes the species_id value: 
UPDATE animals SET species_id=2 where name LIKE '%mon';
UPDATE animals SET species_id=1 where name NOT LIKE '%mon';

-- Modify your inserted animals to include owner information (owner_id): 
UPDATE animals SET owners_id=1 WHERE name='Agumon';
UPDATE animals SET owners_id=2 where name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owners_id=3 where name IN ('Devimon', 'Plantmon');
UPDATE animals SET owners_id=4 where name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owners_id=5 where name IN ('Angemon', 'Boarmon');

-- Update owners names with typo in Local DB
UPDATE owners SET full_name='Dean Winchester' WHERE full_name like 'Dean Wincheste';
UPDATE owners SET full_name='Jodie Whittaker' WHERE full_name like 'Jodie Whittake';