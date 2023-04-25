DROP DATABASE medical_db;
CREATE DATABASE medical_db;
\c medical_db;

CREATE TABLE medical_centers (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL,
    phone_number INT NOT NULL,
    address TEXT
);

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    provider_id INT UNIQUE 
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    phone_number INT,
    address TEXT
);

CREATE TABLE conditions (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    idc_10 INT UNIQUE
);

CREATE TABLE centers_doctors (
    id SERIAL PRIMARY KEY,
    dr_id INT REFERENCES doctors(id) ON DELETE SET NULL,
    med_center_id INT REFERENCES medical_centers(id) ON DELETE CASCADE
);

CREATE TABLE doctors_patients (
    id SERIAL PRIMARY KEY,
    dr_id INT REFERENCES doctors(id) ON DELETE SET NULL,
    patient_id INT REFERENCES patients(id) ON DELETE CASCADE
);

CREATE TABLE patients_conditions (
    id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES patients(id) ON DELETE CASCADE,
    condition_id INT REFERENCES conditions(id) ON DELETE SET NULL
);

INSERT INTO medical_centers
(name, phone_number, address)
VALUES
('San Jose',4156,'123 Sesame St'),
('Bay Area',5214,'42 Wallaby Way'),
('LA',1235,'143 Rogers Dr');

INSERT INTO doctors
(first_name, last_name, provider_id)
VALUES
('Sam','Wise',456789),
('Frodo','Baggins',456782),
('Gandalf','Thegray',789456);

INSERT INTO patients
(first_name,last_name,phone_number,address)
VALUES
('Nemo','Raggedfin',8522,'23 Coral'),
('Marlin','Overbearing',7896,'23 Coral'),
('Dory','Swimming',7895, '145 In The Shells');

INSERT INTO conditions
(name,idc_10)
VALUES
('scoliosis',125.2),
('depression',445.25),
('plague,black',2.4);

CREATE INDEX doctor_id ON doctors(id);
CREATE INDEX patient_id ON patients(id);