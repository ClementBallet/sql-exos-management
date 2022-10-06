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

-- 22. Insérer un nouvel employé avec les informations suivantes : 
-- a. Nom : Smith 
-- b. Prénom : John 
-- c. Fonction : Manager 
-- d. Date d’entrée : 14 mai 2021 
-- e. Salaire : 2700 
-- f. Commission : 5 
-- g. Service_id : 6 
INSERT INTO `employe` (`id_employe`, `nom`, `prenom`, `fonction`, `date_entree`, `salaire`, `commission`, `service_id`) 
VALUES (NULL, 'Smith', 'John', 'Manager', '2021-05-14 11:17:44', '2700', '5', '6');

-- 23. Supprimer le dernier service
DELETE FROM service 
ORDER BY id_service DESC 
LIMIT 1;

-- 24. Lister tous les services avec leurs employés, y compris les services qui n’ont aucun employé
SELECT service.nom, employe.nom, employe.prenom
FROM service
LEFT JOIN employe
ON service.id_service = employe.service_id;
-- Ou pour avoir le nombres d'employés dans chaque services :
SELECT service.nom, COUNT(employe.id_employe) AS nb_employes
FROM service
LEFT JOIN employe
ON service.id_service = employe.service_id
GROUP BY service.nom;

-- 25. Quels sont les services qui n’ont aucun employé ?
SELECT service.nom, COUNT(employe.id_employe) AS nb_employes
FROM service
LEFT JOIN employe
ON service.id_service = employe.service_id
GROUP BY service.nom
HAVING nb_employes = 0;

-- 26. Modifier le nom du service ‘Legal’ en le mettant à ‘Juridique’
UPDATE service
SET nom = 'Juridique'
WHERE nom = 'Legal';

-- 27. Pour tous les employés du service ‘Sales’ mettez leurs commissions à 3
UPDATE employe 
SET commission = 3 
WHERE service_id = (SELECT service.id_service FROM service WHERE service.nom = 'Sales');

-- 28. Créer une table ‘Inscription’ dans la base de données ‘management’ contenant les informations suivantes : 
-- a. Id : type entier, clé primaire, auto-incrémenté 
-- b. Nom : type chaines de caractères, 50 caractères, obligatoire 
-- c. Prenom : type chaines de caractères, 50 caractères, obligatoire 
-- d. Genre : 1 caractère (H, F, A), pas obligatoire 
-- e. Email : type chaines de caractères, 255 caractères, unique et obligatoire 
-- f. Date_inscription : type date et time, valeur par défaut date du jour
CREATE TABLE `management`.`inscription` ( 
    `id` INT NOT NULL AUTO_INCREMENT, 
    `nom` VARCHAR(50) NOT NULL, 
    `prenom` VARCHAR(50) NOT NULL, 
    `genre` VARCHAR(1) NULL, 
    `email` VARCHAR(255) NOT NULL, 
    `date_inscription` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, 
    PRIMARY KEY (`id`), 
    UNIQUE `email` (`email`(255))
) ENGINE = MyISAM;

-- 29. Modifier la table inscription, en mettant la colonne ‘genre’ obligatoire
ALTER TABLE inscription
CHANGE genre genre VARCHAR(1) NOT NULL;
