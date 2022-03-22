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
