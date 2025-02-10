SELECT AROME.Nom, COUNT(Id_Cafe) AS [Number of records]
FROM AROME JOIN AromeToCafe ON AROME.id = AromeToCafe.Id_Arome
GROUP BY AROME.Nom;