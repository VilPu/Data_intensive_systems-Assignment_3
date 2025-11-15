INSERT INTO schools (name, location, global_rank) VALUES
('Lappeenrannan-Lahden teknillinen yliopisto, LUT-yliopisto', 'Lappeenranta', 1),
('LAB ylikorkeakoulu', 'Skinnarila', 2),
('Helsingin yliopisto', 'Helsinki', 3),
('Aalto-yliopisto', 'Espoo', 4),
('Itä-Suomen yliopisto', 'Kuopio', 5),
('Tampereen yliopisto', 'Tampere', 6),
('Jyväskylän yliopisto', 'Jyväskylä', 7),
('Oulun yliopisto', 'Oulu', 8),
('Vaasan yliopisto', 'Vaasa', 9),
('Lapin yliopisto', 'Rovaniemi', 10);


INSERT INTO faculties (school_id, name, budget) VALUES
(1, 'Tite', 1000),
(1, 'Tuta', 1000000),
(1, 'KeTe', 500000),
(1, 'Kone', 0),
(1, 'Kauppa', 100000),
(2, 'Tekniikka', 10),
(2, 'Liiketalous', 20),
(2, 'Hotelli-, ravintola- ja matkailuala', 30),
(2, 'Muotoilu, kuvataide ja visuaalinen viestintä', 40),
(2, 'Sosiaali- ja terveysala', 50);


INSERT INTO personnel (faculty_id, school_id, name, salary) VALUES
(1, 1, 'Knutas', 1000000),
(1, 1, 'Mustonen', 1000001),
(1, 1, 'Uolevi', 3000),
(1, 1, 'Vanhala', 123456),
(1, 1, 'Kälviäinen', 123),
(2, 2, 'Ingengör', 321),
(2, 2, 'Bakare', 456),
(2, 2, 'Metronomi', 553),
(2, 2, 'Merkonomi', 6123),
(2, 2, 'Ensihoitaja', 444);


INSERT INTO courses (faculty_id, name, points) VALUES
(1, 'Python 101', 6),  
(1, 'Java 101', 6),  
(1, 'C 101', 3),  
(1, 'Data 101', 3),  
(1, 'Intense Data', 6),  
(6, 'Lujari 101', 6),  
(6, 'Tekniikan fysiikka', 3),  
(7, 'Market 101', 6),  
(7, 'Talouden perusteet', 3),  
(7, 'Veronkierron perusteet', 6);


INSERT INTO grades (course_id, student_number, grade) VALUES
(1, 1000, 5),  
(2, 1000, 5),  
(3, 1000, 1),  
(5, 1000, 4),  
(6, 1001, 5),  
(3, 1006, 0),  
(4, 1007, 1),  
(4, 1008, 2),  
(5, 1009, 3),  
(5, 1010, 4);  

