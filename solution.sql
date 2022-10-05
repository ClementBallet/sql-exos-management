-- 1. Trouver tous les employés qui gagnent plus de 2000 euros triés par ordre décroissant de salaire.
SELECT * 
FROM `employe` 
WHERE salaire >= 2000
ORDER BY salaire DESC;

-- 2. Quels sont les employés qui sont entrés en 2021 ? (17 entrées)
SELECT * 
FROM `employe` 
WHERE YEAR(date_entree) = 2021;

-- 3. Quels sont les employés qui ont, soit un salaire supérieur à 2500 euros, soit une commission supérieure à 3 ?
SELECT *
FROM `employe` 
WHERE salaire > 2500
AND commission > 3;

-- 4. Afficher les 3 personnes les mieux payés de l’entreprise.
SELECT *
FROM `employe` 
ORDER BY salaire DESC 
LIMIT 3;

-- 5 Afficher la date d’entrée de la personne la mieux payée
SELECT employe.date_entree
FROM `employe` 
ORDER BY employe.salaire DESC 
LIMIT 1;

-- 6 Afficher l’identifiant, le nom, le prénom, le nom du service et la date d’entrée de tous les employés dont le service est basé à Dijon
SELECT employe.id_employe, employe.nom, employe.prenom, employe.date_entree, service.nom, service.ville 
FROM `employe` 
INNER JOIN service 
ON employe.service_id = service.id_service
WHERE service.ville = 'Dijon';

-- 7 Afficher l’identifiant, le nom, le prénom, le nom du service, la date d’entrée et la ville des 5 employés les mieux payés
SELECT employe.id_employe, employe.nom, employe.prenom, employe.date_entree, employe.salaire, service.nom, service.ville 
FROM `employe` 
INNER JOIN service 
ON employe.service_id = service.id_service
ORDER BY employe.salaire DESC 
LIMIT 5;

-- 8 Qui sont les employés dont les services se trouvent à Lyon, Dijon et Paris et dont la date d’entrée est avant 2022 ? Afficher toutes les infos de l’employé y compris les noms de leurs services
SELECT employe.*, service.nom, service.ville 
FROM `employe` 
INNER JOIN service 
ON employe.service_id = service.id_service
WHERE service.ville IN ('Lyon', 'Dijon', 'Paris')
AND YEAR(employe.date_entree) < 2022;

-- 9 Afficher toutes les informations des employés dont le service se trouve à Paris et qui gagnent entre 1500 euros et 2500 euros. Afficher aussi leurs services
SELECT employe.*, service.nom, service.ville 
FROM `employe` 
INNER JOIN service 
ON employe.service_id = service.id_service
WHERE service.ville IN ('Paris')
AND employe.salaire BETWEEN '1500' AND '2500';

-- 10 Compter le nombre d’enregistrement dans la table employé
SELECT COUNT(*)
FROM `employe`;

-- 11 Afficher le total du salaire de l’entreprise
SELECT SUM(employe.salaire)
FROM `employe`;

-- 12 Afficher la liste des employés qui gagnent plus que la moyenne du salaire des employés
SELECT * 
FROM `employe`
WHERE employe.salaire > (SELECT AVG(employe.salaire) FROM employe);

-- 13 Lister les employés du service ‘Accounting’ en utilisant une sous-requête
SELECT * 
FROM `employe`
INNER JOIN service
ON employe.service_id = service.id_service
WHERE service.nom = 'Accounting';

-- 14 Lister les employés du service basé à Lyon en utilisant une sous-requête
SELECT * 
FROM `employe`
INNER JOIN service
ON employe.service_id = service.id_service
WHERE service.ville = 'Lyon';

-- 15 Qui sont les personnes les mieux payées de la société, c’est-à-dire ceux qui gagnent le montant maximum ?
SELECT *
FROM employe
WHERE employe.salaire = (SELECT MAX(employe.salaire) FROM employe);

-- 16 Lister les employés dont la fonction commence par la lettre ‘A’
SELECT *
FROM employe
WHERE employe.fonction LIKE 'A%';

-- 17 Lister les salaires moyens par service
SELECT employe.service_id, ROUND(AVG(employe.salaire), 0) AS 'Salaire moyen'
FROM employe
GROUP BY employe.service_id;
-- OU
SELECT service.nom, ROUND(AVG(employe.salaire), 0) AS 'Salaire moyen'
FROM employe
INNER JOIN service
ON employe.service_id = service.id_service
GROUP BY employe.service_id;

-- 18 Lister les services ayant un nombre d’employés supérieur ou égal à 5
SELECT employe.service_id, COUNT(*) AS count
FROM employe
GROUP BY employe.service_id
HAVING count >= 5;
-- OU
SELECT service.nom, COUNT(*) AS count
FROM employe
INNER JOIN service
ON employe.service_id = service.id_service
GROUP BY employe.service_id
HAVING count >= 5;

-- 19 Lister tous les employés avec les noms de leurs services en utilisant une jointure
SELECT *, service.nom AS nom_du_service
FROM employe
INNER JOIN service
ON employe.service_id = service.id_service;

-- 20 Lister les employés dont le service se trouve à Lyon en utilisant une jointure
SELECT *, service.nom AS nom_du_service
FROM employe
INNER JOIN service
ON employe.service_id = service.id_service
WHERE service.ville = 'Lyon';

-- 21 Insérer un nouveau service ‘RH’ pour la ville de ‘Nantes’
INSERT INTO service(`nom`, `ville`) 
VALUES ('RH','Nantes');