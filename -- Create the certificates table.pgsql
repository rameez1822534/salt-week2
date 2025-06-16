-- Create the certificates table
CREATE TABLE certificates (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    person_id INT,
    CONSTRAINT fk_person FOREIGN KEY (person_id) REFERENCES person(id)
);

-- Insert a new person with valid age
INSERT INTO person (name, age) VALUES ('bashir', 30);

-- Insert certificate for bashir
INSERT INTO certificates (name, person_id)
VALUES ('Scrum', (SELECT id FROM person WHERE name = 'bashir'));

-- Add Scrum and Azure certificates for others
INSERT INTO certificates (name, person_id)
VALUES 
  ('Scrum', (SELECT id FROM person WHERE name = 'serhat')),
  ('Azure', (SELECT id FROM person WHERE name = 'henry'));

-- Query Scrum certificate holders
SELECT p.id, p.name
FROM person p
JOIN certificates c ON p.id = c.person_id
WHERE c.name = 'Scrum';

-- Query Azure certificate holders
SELECT p.id, p.name
FROM person p
JOIN certificates c ON p.id = c.person_id
WHERE c.name = 'Azure';
