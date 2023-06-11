/*
1.
FROM
	AEREOPORTO
SELECT
	Citt‡, NumPiste
WHERE
	NumPiste IS Null


2.
FROM
	Volo
SELECT
	TipoAereo, Citt‡Part
WHERE Citt‡Part = 'Torino'


3.
FROM Volo
SELECT Citt‡Part, Citt‡Arr
WHERE Citt‡Arr = 'Bologna'


4.
FROM 
	Volo
SELECT 
	IdVolo, Citt‡Part, Citt‡Arr
WHERE
	IdVolo = 'AZ274'


5.
FROM
	Volo
SELECT 
	TipoAereo, GiornoSett, OraPart, Citt‡Part, Citt‡Arr
WHERE 
	CittaPart LIKE 'B%O%' AND CittaArr 'A%E%


*/
