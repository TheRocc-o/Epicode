/*L'esercizio è mirato a prendere confidenza con le interrogazioni avanzate SQL che fanno uso di date. Dato il seguente schema scrivere le interrogazioni di seguito:

Dipendente(id, nome, cognome, email, numerotelefono, data_assunzione, id_lavoro, salario, id_manager, id_dipartimento)
Dipartimento(id_dipartimento, nome_dip, id_manager, id_location) 
Nota: data assunzione è nella forma YYYY-MM-DD

1. Visualizzare la data di assunzione dei manager e i loro id appartenenti al dipartimento 'Amministrazione' nel formato Nome mese, giorno, anno 
2. Visualizzare il nome e il cognome dei dipendenti assunti nel mese di Giugno
3. Visualizzare gli anni in cui più di 10 dipendenti sono stati assunti
4. Visualizzare il nome del dipartimento, il nome del manager, il salario del manager di tutti i manager la cui esperienza è maggiore di 5 anni*/




--1.Visualizzare la data di assunzione dei manager e i loro id appartenenti al dipartimento 'Amministrazione' nel formato Nome mese, giorno, anno 
/* 
   SELECT
			data_assunzione, 
			id_manager
   FROM 
			Dipendente
   WHERE 
			id_manager IN (
							SELECT id_manager
							FROM Dipartimento
							WHERE id_dipartimento = 'Amministrazione')
;





--2.Visualizzare il nome e il cognome dei dipendenti assunti nel mese di Giugno
SELECT 
			nome, 
			cognome
FROM 
			Dipendente
WHERE 
			MONTH (data_assunzione) = 6
;


--3. Visualizzare gli anni in cui più di 10 dipendenti sono stati assunti
SELECT 
		YEAR (data_assunzione)
FROM 
		Dipendente
GROUP BY
		data_assunzione
HAVING 
		COUNT(*) > 10
;



--4. Visualizzare il nome del dipartimento, il nome del manager, il salario del manager di tutti i manager la cui esperienza è maggiore di 5 anni
SELECT
		d.id_manager, 
		f.nome_dip,  AS Dipartimento
		d.nome,      AS Nome Manager
		d.cognome,   AS Cognome Manager
		d.salario    AS Salario Manager
FROM 
		Dipendente AS d
INNER JOIN 
		Dipartimento AS f
ON 
		d.id_manager = f.id_manager
WHERE
		d.id_manager IN (
						SELECT id_manager
						FROM Dipendente
						WHERE DATEDIFF(CURRENT_DATE(), data_assunzione) > 5 * 365)
;