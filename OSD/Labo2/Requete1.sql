SELECT Cafe.Nom, Type_Origine.Nom FROM Cafe INNER JOIN CafeToTypeOrigine ON Cafe.id = CafeToTypeOrigine.Id_Cafe
INNER JOIN Type_Origine ON CafeToTypeOrigine.Id_TypeOrigine = Type_Origine.id