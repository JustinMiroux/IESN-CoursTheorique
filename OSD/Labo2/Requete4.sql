CREATE VIEW Caféintense AS
SELECT Cafe.Intensité, Cafe.Nom FROM Cafe
WHERE(Intensité >= 5)
