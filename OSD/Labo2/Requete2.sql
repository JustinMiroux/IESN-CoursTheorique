SELECT Cafe.Nom, AROME.Nom FROM Cafe LEFT JOIN AromeToCafe ON Cafe.id = AromeToCafe.Id_Cafe
LEFT JOIN AROME ON AromeToCafe.Id_Arome = AROME.id