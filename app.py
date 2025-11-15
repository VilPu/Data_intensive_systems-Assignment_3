from flask import Flask, request, jsonify, render_template
import psycopg2

import database

app = Flask("data-intensive-server")
connection_1 = psycopg2.connect(
    dbname="postgres", user="postgres", password="postgres", host="127.0.0.1", port=5431)
cursor_1 = connection_1.cursor()
connection_2 = psycopg2.connect(
    dbname="postgres", user="postgres", password="postgres", host="127.0.0.1", port=5432)
cursor_2 = connection_2.cursor()
connection_3 = psycopg2.connect(
    dbname="postgres", user="postgres", password="postgres", host="127.0.0.1", port=5433)
cursor_3 = connection_3.cursor()

# Init databases
database.init_db(connection_1, cursor_1)
database.insert_sample_1_data(connection_1, cursor_1)
database.init_db(connection_2, cursor_2)
database.insert_sample_2_data(connection_2, cursor_2)
database.init_db(connection_3, cursor_3)
database.insert_sample_3_data(connection_3, cursor_3)


@app.route("/")
def index():
    return render_template("index.html")


@app.route("/schools")
def schools():
    db = int(request.args.get("db"))
    conn_cur = select_connection(db)
    school_rows = database.select_schools(conn_cur[0], conn_cur[1])
    return render_template("schools.html", schools=school_rows)


@app.route("/faculties")
def faculties():
    db = int(request.args.get("db"))
    conn_cur = select_connection(db)
    faculty_rows = database.select_faculties(conn_cur[0], conn_cur[1])
    return render_template("faculties.html", faculties=faculty_rows)


@app.route("/personnel")
def personnel():
    db = int(request.args.get("db"))
    conn_cur = select_connection(db)
    personnel_rows = database.select_personnel(conn_cur[0], conn_cur[1])
    return render_template("personnel.html", personnel=personnel_rows)


@app.route("/courses")
def courses():
    db = int(request.args.get("db"))
    conn_cur = select_connection(db)
    course_rows = database.select_courses(conn_cur[0], conn_cur[1])
    return render_template("courses.html", courses=course_rows)


@app.route("/grades")
def grades():
    db = int(request.args.get("db"))
    conn_cur = select_connection(db)
    grade_rows = database.select_grades(conn_cur[0], conn_cur[1])
    return render_template("grades.html", grades=grade_rows)


@app.route("/insert/school", methods=['POST'])
def insert_school():
    db = int(request.args.get("db"))
    id = request.form.get('id')
    name = request.form.get('name')
    location = request.form.get('location')
    global_rank = request.form.get('global_rank')

    if id and name and location and global_rank:
        conn_cur = select_connection(db)
        database.update_create_school(
            conn_cur[0], conn_cur[1], id, name, location, global_rank)
        school_rows = database.select_schools(conn_cur[0], conn_cur[1])
        return render_template("schools.html", schools=school_rows)
    return jsonify({"Error": "Form was partially empty"}), 400


@app.route("/insert/faculty", methods=['POST'])
def insert_faculty():
    db = int(request.args.get("db"))
    id = request.form.get('id')
    school_id = request.form.get('school_id')
    name = request.form.get('name')
    budget = request.form.get('budget')

    if school_id and name:
        conn_cur = select_connection(db)
        database.update_create_faculty(
            conn_cur[0], conn_cur[1], id, school_id, name, budget)
        faculties = database.select_faculties(conn_cur[0], conn_cur[1])
        return render_template("faculties.html", faculties=faculties)

    return jsonify({"Error": "Form was partially empty"}), 400


@app.route("/insert/personnel", methods=['POST'])
def insert_personnel():
    db = int(request.args.get("db"))
    id = request.form.get('id')
    faculty_id = request.form.get('faculty_id')
    school_id = request.form.get('school_id')
    name = request.form.get('name')
    salary = request.form.get('salary')

    if faculty_id and school_id and name and salary:
        conn_cur = select_connection(db)
        database.update_create_personnel(
            conn_cur[0], conn_cur[1], id, faculty_id, school_id, name, salary)
        personnel = database.select_personnel(conn_cur[0], conn_cur[1])
        return render_template("personnel.html", personnel=personnel)

    return jsonify({"Error": "Form was partially empty"}), 400


@app.route("/insert/course", methods=['POST'])
def insert_course():
    db = int(request.args.get("db"))
    id = request.form.get('id')
    faculty_id = request.form.get('faculty_id')
    name = request.form.get('name')
    points = request.form.get('points')

    if faculty_id and name and points:
        conn_cur = select_connection(db)
        database.update_create_course(
            conn_cur[0], conn_cur[1], id, faculty_id, name, points)
        courses = database.select_courses(conn_cur[0], conn_cur[1])
        return render_template("courses.html", courses=courses)

    return jsonify({"Error": "Form was partially empty"}), 400


@app.route("/reset")
def reset():
    database.init_db(connection_1, cursor_1)
    database.insert_sample_1_data(connection_1, cursor_1)
    database.init_db(connection_2, cursor_2)
    database.insert_sample_2_data(connection_2, cursor_2)
    database.init_db(connection_3, cursor_3)
    database.insert_sample_3_data(connection_3, cursor_3)
    return render_template("index.html")


def select_connection(db):
    if db == 1:
        return (connection_1, cursor_1)
    elif db == 2:
        return (connection_2, cursor_2)
    elif db == 3:
        return (connection_3, cursor_3)
    else:
        return (connection_1, cursor_1)
