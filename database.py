
def init_db(conn, cursor):
    with open("sql/init.sql", "r") as file:
        statement = file.read()
        cursor.execute(statement)
    conn.commit()


def insert_sample_1_data(conn, cursor):
    with open("sql/sample_data_1.sql", "r") as file:
        statement = file.read()
        cursor.execute(statement)
    conn.commit()


def insert_sample_2_data(conn, cursor):
    with open("sql/sample_data_2.sql", "r") as file:
        statement = file.read()
        cursor.execute(statement)
    conn.commit()


def insert_sample_3_data(conn, cursor):
    with open("sql/sample_data_3.sql", "r") as file:
        statement = file.read()
        cursor.execute(statement)
    conn.commit()


def select_schools(conn, cursor):
    statement = "SELECT * FROM schools;"
    try:
        cursor.execute(statement)
        return cursor.fetchall()
    except:
        conn.rollback()
    return []


def select_faculties(conn, cursor):
    statement = "SELECT * FROM faculties;"
    try:
        cursor.execute(statement)
        return cursor.fetchall()
    except:
        conn.rollback()
    return []


def select_personnel(conn, cursor):
    statement = "SELECT * FROM personnel;"
    try:
        cursor.execute(statement)
        return cursor.fetchall()
    except:
        conn.rollback()
    return []


def select_courses(conn, cursor):
    statement = "SELECT * FROM courses;"
    try:
        cursor.execute(statement)
        return cursor.fetchall()
    except:
        conn.rollback()
    return []


def select_grades(conn, cursor):
    statement = "SELECT * FROM grades;"
    try:
        cursor.execute(statement)
        return cursor.fetchall()
    except:
        conn.rollback()
    return []


def update_create_school(conn, cursor, id, name, location, global_rank):
    statement = """
            INSERT INTO schools (id, name, location, global_rank)
            VALUES (%s, %s, %s, %s)
            ON CONFLICT (id) 
            DO UPDATE SET
                name = EXCLUDED.name,
                location = EXCLUDED.location,
                global_rank = EXCLUDED.global_rank;
    """
    try:
        cursor.execute(statement, (id, name, location, global_rank))
        conn.commit()
    except:
        conn.rollback()


def update_create_faculty(conn, cursor, id, school_id, name, budget):
    statement = """
        INSERT INTO faculties (id, school_id, name, budget)
        VALUES (%s, %s, %s, %s)
        ON CONFLICT (id) 
        DO UPDATE SET
            school_id = EXCLUDED.school_id,
            name = EXCLUDED.name,
            budget = EXCLUDED.budget;
    """
    try:
        cursor.execute(statement, (id, school_id, name, budget))
        conn.commit()
    except:
        conn.rollback()


def update_create_personnel(conn, cursor, id, faculty_id, school_id, name, salary):
    statement = """
        INSERT INTO personnel (id, faculty_id, school_id, name, salary)
        VALUES (%s, %s, %s, %s, %s)
        ON CONFLICT (id)
        DO UPDATE SET
            faculty_id = EXCLUDED.faculty_id,
            school_id = EXCLUDED.school_id,
            name = EXCLUDED.name,
            salary = EXCLUDED.salary;
    """
    try:
        cursor.execute(statement, (id, faculty_id, school_id, name, salary))
        conn.commit()
    except:
        conn.rollback()


def update_create_course(conn, cursor, id, faculty_id, name, points):
    statement = """
        INSERT INTO courses (id, faculty_id, name, points)
        VALUES (%s, %s, %s, %s)
        ON CONFLICT (id)
        DO UPDATE SET
            faculty_id = EXCLUDED.faculty_id,
            name = EXCLUDED.name,
            points = EXCLUDED.points;
    """
    try:
        cursor.execute(statement, (id, faculty_id, name, points))
        conn.commit()
    except:
        conn.rollback()
