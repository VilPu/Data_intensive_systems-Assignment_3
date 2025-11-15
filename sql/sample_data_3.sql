INSERT INTO schools (name, location, global_rank) VALUES
('Lappeenrannan-Lahden teknillinen yliopisto, LUT-yliopisto', 'Lappeenranta', 1),
('LAB ylikorkeakoulu', 'Skinnarila', 2),
('Helsingin yliopisto', 'Helsinki', 3),
('Aalto-yliopisto', 'Espoo', 4),
('Itä-Suomen yliopisto', 'Kuopio', 5),
('Yleinen yliopisto', 'Yleinen', 6),
('Juvan yliopisto', 'Juva', 7),
('Tuuri yliopisto', 'Tuurin kyläkauppa', 8),
('Virtuaali yliopisto', 'Tietokone', 9),
('NULL', 'Err404', 404);

INSERT INTO faculties (school_id, name, budget) VALUES
(1, 'Tite', 1000),
(1, 'Tuta', 1000000),
(1, 'KeTe', 500000),
(1, 'Kone', 0),
(1, 'Kauppa', 100000),
(4, 'Kauppakorkeakoulu', 10),
(4, 'Insinööritieteiden korkeakoulu', 20),
(4, 'Arkkitehtuurin ja kaupunkisuunnittelun laitos', 30),
(4, 'Taiteiden ja suunnittelun korkeakoulu', 40),
(10, 'Not found', 50);

INSERT INTO personnel (faculty_id, school_id, name, salary) VALUES
(1, 1, 'Knutas', 1000000),
(1, 1, 'Mustonen', 1000001),
(1, 1, 'Uolevi', 3000),
(1, 1, 'Vanhala', 123456),
(1, 1, 'Kälviäinen', 123),
(9, 2, 'Co Pilot', 111),
(9, 2, 'ChatGPT', 222),
(9, 2, 'Claude', 333),
(9, 2, 'Gemini', 444),
(10, 2, 'Not here', 404);


INSERT INTO courses (faculty_id, name, points) VALUES
(1, 'Python 101', 6),  
(1, 'Java 101', 6),  
(1, 'C 101', 3),  
(1, 'Data 101', 3),  
(1, 'Intense Data', 6),  
(6, 'Osakkeiden perusteet', 6),  
(7, 'Mutterit 101', 3),  
(8, 'Talot', 6),  
(9, 'Maalaamisen perusteet', 2),  
(10, 'Katoamisen perusteet', 404);


INSERT INTO grades (course_id, student_number, grade) VALUES
(1, 1000, 5),  
(2, 1000, 5),  
(3, 1000, 1),  
(4, 1000, 4),  
(5, 1001, 5),  
(6, 101, 0),  
(7, 101, 3),  
(8, 101, 2),  
(9, 105, 5),  
(10, 404, 404);  
