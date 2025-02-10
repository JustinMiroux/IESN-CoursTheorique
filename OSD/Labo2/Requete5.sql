CREATE VIEW PointDeVenteActif2Ans AS
SELECT distinct PointDeVente.Nom
	FROM PointDeVente  JOIN CafeToPointDeVente 
		ON PointDeVente.id = CafeToPointDeVente.IdPointDeVente
GROUP BY PointDeVente.Nom,Date_Start 
HAVING DATEDIFF(YEAR, MIN(Date_Start), GETDATE()) > 2
