/* Database schema to keep the structure of entire database. */
CREATE DATABASE vet_clinic;

CREATE TABLE animals (
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg decimal
);

ALTER TABLE animals ADD species varchar(100);

CREATE TABLE owners (
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name varchar(100),
    age integer
);

CREATE TABLE species (
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name varchar(100)
);

-- Modify animals table: 
-- Make sure that id is set as autoincremented PRIMARY KEY
ALTER TABLE animals
ADD CONSTRAINT animals_pkey PRIMARY KEY (id);

-- Remove column species
ALTER TABLE animals
DROP COLUMN species;
-- Add column species_id which is a foreign key referencing species table
ALTER TABLE animals
ADD species_id integer;

ALTER TABLE animals 
ADD FOREIGN KEY (species_id) REFERENCES species (id);
-- Add column owner_id which is a foreign key referencing the owners table
ALTER TABLE animals
ADD owners_id integer;
ALTER TABLE animals 
ADD FOREIGN KEY (owners_id) REFERENCES owners (id);

CREATE TABLE vets (
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name varchar(100),
    age integer,
    date_of_graduation date
);

CREATE TABLE specializations (
    vet_id integer NOT NULL,
    species_id integer NOT NULL,
    PRIMARY KEY (vet_id, species_id),
    CONSTRAINT fk_Vets  
    FOREIGN KEY(vet_id) REFERENCES vets(id),
    CONSTRAINT fk_Species  
    FOREIGN KEY(species_id) REFERENCES species(id)
);

CREATE TABLE visits (
    vet_id integer NOT NULL,
    animals_id integer NOT NULL,
    date_visited date,
    PRIMARY KEY (vet_id, animals_id, date_visited),
    CONSTRAINT fk_Vets  
    FOREIGN KEY(vet_id) REFERENCES vets(id),
    CONSTRAINT fk_animals  
    FOREIGN KEY(animals_id) REFERENCES animals(id)
);

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);