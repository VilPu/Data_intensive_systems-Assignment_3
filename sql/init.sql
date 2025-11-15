DROP TABLE IF EXISTS schools CASCADE;
CREATE TABLE schools (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    location VARCHAR(255),
    global_rank INT
);

DROP TABLE IF EXISTS faculties CASCADE;
CREATE TABLE faculties (
    id SERIAL PRIMARY KEY,
    school_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    budget INT,
    CONSTRAINT fk_school
        FOREIGN KEY (school_id)
        REFERENCES schools (id)
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS personnel CASCADE;
CREATE TABLE personnel (
    id SERIAL PRIMARY KEY,
    faculty_id INT,
    school_id INT,
    name VARCHAR(255) NOT NULL,
    salary INT,
    CONSTRAINT fk_faculty
        FOREIGN KEY (faculty_id)
        REFERENCES faculties (id)
        ON DELETE SET NULL,
    CONSTRAINT fk_school
        FOREIGN KEY (school_id)
        REFERENCES schools (id)
        ON DELETE SET NULL
);

DROP TABLE IF EXISTS courses CASCADE;
CREATE TABLE courses (
    id SERIAL PRIMARY KEY,
    faculty_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    points INT,
    CONSTRAINT fk_faculty
        FOREIGN KEY (faculty_id)
        REFERENCES faculties (id)
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS grades CASCADE;
CREATE TABLE grades (
    id SERIAL PRIMARY KEY,
    course_id INT NOT NULL,
    student_number INT NOT NULL,
    grade INT NOT NULL,
    CONSTRAINT fk_course
        FOREIGN KEY (course_id)
        REFERENCES courses (id)
        ON DELETE CASCADE
);
