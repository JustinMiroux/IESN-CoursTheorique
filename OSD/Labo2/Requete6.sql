CREATE VIEW CombienCafe AS
SELECT Cafe.Intensit�, Torrefaction.Nom, COUNT(*) AS [Nombre d'occurence] 
FROM Cafe JOIN Torrefaction ON Cafe.Torr�faction = Torrefaction.id
GROUP BY Cafe.Intensit�, Torrefaction.Nom;
