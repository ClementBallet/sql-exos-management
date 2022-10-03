-- Trouver tous les employés qui gagnent plus de 2000 euros triés par ordre décroissant de salaire.
SELECT * 
FROM `employe` 
WHERE salaire >= 2000
ORDER BY salaire DESC;

-- Quels sont les employés qui sont entrés en 2021 ? (17 entrées)
SELECT * 
FROM `employe` 
WHERE YEAR(date_entree) = 2021;

-- Quels sont les employés qui ont, soit un salaire supérieur à 2500 euros, soit une commission supérieure à 3 ?
SELECT *
FROM `employe` 
WHERE salaire > 2500
AND commission > 3;