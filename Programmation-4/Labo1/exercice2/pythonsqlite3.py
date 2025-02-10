import sqlite3

with sqlite3.connect("db.sqlite") as conn:
    print(type(conn))

    cur = conn.cursor()

    try:
        cur.execute("CREATE TABLE stationsinfo(id, date, windspeed, winddirection, temp);")
    except sqlite3.DatabaseError:
        print("Database already exist")
        pass # NEVER leave pass alone (no silent errors)

    while True:
        print("\n Menu de la base de donnée Stations info :\n")
        print(" Créer un nouveau relevé pour une station :        1")
        print(" Afficher tous les relevé d'un station :           2")

