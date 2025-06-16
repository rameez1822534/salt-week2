CREATE TABLE certificates (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    person_id INT,
    CONSTRAINT fk_person FOREIGN KEY (person_id) REFERENCES person(id)
);


INSERT INTO person (name) VALUES ('bashir') RETURNING id;

INSERT INTO certificates (name, person_id) VALUES ('Scrum', 4);


INSERT INTO certificates (name, person_id)
VALUES 
    ('Scrum', (SELECT id FROM person WHERE name = 'serhat')),
    ('Azure', (SELECT id FROM person WHERE name = 'henry'));


SELECT p.id , p.name FROM person p
JOIN certificates c ON p.id = c.person_id
WHERE c.name = "Scrum"

SELECT p.id , p.name FROM person p
JOIN certificates c ON p.id = c.person_id
WHERE c.name = "Azure"

