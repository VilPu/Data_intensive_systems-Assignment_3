INSERT INTO schools (name, location, global_rank) VALUES
('Lappeenrannan-Lahden teknillinen yliopisto, LUT-yliopisto', 'Lappeenranta', 1),
('LAB ylikorkeakoulu', 'Skinnarila', 2),
('Helsingin yliopisto', 'Helsinki', 3),
('Aalto-yliopisto', 'Espoo', 4),
('Itä-Suomen yliopisto', 'Kuopio', 5),
('Harvard', 'Yankee', 6),
('MIT yliopisto', 'Yanke', 7),
('Delaware yliopisto', 'Yank', 8),
('Florida yliopisto', 'Swamp', 9),
('Washington DC', 'Washington DC', 10);


INSERT INTO faculties (school_id, name, budget) VALUES
(1, 'Tite', 1000),
(1, 'Tuta', 1000000),
(1, 'KeTe', 500000),
(1, 'Kone', 0),
(1, 'Kauppa', 100000),
(5, 'Humanistinen tiedekunta', 10),
(5, 'Yhteiskuntatieteiden tiedekunta', 20),
(5, 'Lääketieteellinen tiedekunta', 30),
(5, 'Luonnontieteiden ja metsätieteiden tiedekunta', 40),
(5, 'Oikeustieteiden tiedekunta', 50);


INSERT INTO personnel (faculty_id, school_id, name, salary) VALUES
(1, 1, 'Knutas', 1000000),
(1, 1, 'Mustonen', 1000001),
(1, 1, 'Uolevi', 3000),
(1, 1, 'Vanhala', 123456),
(1, 1, 'Kälviäinen', 123),
(6, 2, 'Smart Smith', 111),
(6, 2, 'Eric Extrovert', 222),
(6, 2, 'Mad Scientist', 333),
(6, 2, 'Robert Robot', 444),
(6, 2, 'Large Language Model', 555);


INSERT INTO courses (faculty_id, name, points) VALUES
(1, 'Python 101', 6),  
(1, 'Java 101', 6),  
(1, 'C 101', 3),  
(1, 'Data 101', 3),  
(1, 'Intense Data', 6),  
(6, 'Yhteiskunnan perusteet', 6),  
(6, 'Bussit ja niiden aikataulut', 1),  
(8, 'Anatomia', 206),  
(8, 'Polven kierto', 2),  
(8, 'Verenkierron perusteet', 5);


INSERT INTO grades (course_id, student_number, grade) VALUES
(1, 1000, 5),  
(2, 1000, 5),  
(3, 1000, 1),  
(4, 1000, 4),  
(5, 1001, 5),  
(7, 999, 0),  
(7, 999, 1),  
(7, 999, 2),  
(7, 999, 3),  
(7, 999, 4);  

