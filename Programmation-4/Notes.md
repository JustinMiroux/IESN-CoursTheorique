# Programmation 4

## Les environements virtuel

* ``python3 -m venv .venv`` : Créer un nouvelle environement virtuel dans le dossier .venv
* ``source .venv/bin/activate`` : Active l'environement virtuel
* ``deactivate`` : Désactive l'environement
* ``pip3 install matplotlib`` : Installer les libraries
* ``pip3 freeze > requirements.txt`` : Créer une liste des packets installer dans le venv
* ``pip3 install -r requirements.txt`` : Retelecharge les librairies dans la liste de texte

## Les bases de données

* Créer une base de donnéer et si (de)connecter avec python
```python
import sqlite3

conn = squlite3.connect("db.sqlite") #créer la db si n'existe pas

print(type(conn))

conn.close() #ferme la connection

#encore mieux : with
with sqlite3.connect("db.sqlite") as conn:
    print(type(conn))
```
* Pour créer une table
```python
import sqlite3

with sqlite3.connect("db.sqlite") as conn:

    with conn.cursor() as cur:
        cur.execute("CREATE TABLE videogames(name, year, rating);")
```
* Pour créer insérer des données
```python
import sqlite3

with sqlite3.connect("db.sqlite") as conn:

    with conn.cursor() as cur:
        cur.execute("INSERT INTO videogames('fortnite', 2017, 4)")
        cur.execute("INSERT INTO videogames('BG3', 2023, 9)")

        conn.commit() # Validation des modifications des données

        cur.execute("INSERT INTO videogames('Skyrim', 2011, 8)")
        conn.commit() # Auto commit si close (with too) 

        cur.execute("INSERT INTO videogames('Diablo 2', 1999, 8)")
        conn.rollback() # Annule l'insertion
```
* Pour récupérer/selectioner des données
```python
import sqlite3

with sqlite3.connect("db.sqlite") as conn:

    with conn.cursor() as cur:
        cur.execute("SELECT * FROM videogames")
        print(cur.fetchone())
        print(cur.fetchone())
        print(cur.fetchone())
        print(cur.fetchone())

        cur.execute("SELECT * FROM videogames")
        print(cur.fetchall())

        for row in cur.execute("SELECT * FROM videogames"):
            print(row)
```
* Pour changer les données
```python
import sqlite3

with sqlite3.connect("db.sqlite") as conn:

    with conn.cursor() as cur:
        cur.execute("UPDATE videogames SET rating = 3 WHERE name = 'fortnite'")
        conn.commit()
        print(cru.rowcount)
        print(cur.execute("SELECT * FROM videogames WHERE name = 'fortnite'").fetchone())
```
* Pour la suppression de données
```python
import sqlite3

with sqlite3.connect("db.sqlite") as conn:

    with conn.cursor() as cur:
        cur.execute("DELETE FROM videogames WHERE name = 'Skyrim'")
        conn.commit()
        print(cru.rowcount)
        print(cur.execute("SELECT * FROM videogames WHERE name = 'Skyrim'").fetchone())
```
* Pour récupérer le nom des colones
```python
import sqlite3

with sqlite3.connect("db.sqlite") as conn:

    conn.row_factory = sqlite3.Row

    with conn.cursor() as cur:
        cur.execute("SELECT * FROM videogames")
        row = cur.fetchone()
        print(row.keys())
        print(row["name"])
```
