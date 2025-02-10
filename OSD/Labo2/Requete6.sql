CREATE VIEW CombienCafe AS
SELECT Cafe.Intensité, Torrefaction.Nom, COUNT(*) AS [Nombre d'occurence] 
FROM Cafe JOIN Torrefaction ON Cafe.Torréfaction = Torrefaction.id
GROUP BY Cafe.Intensité, Torrefaction.Nom;
