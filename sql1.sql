-- exercice 1
-- a
SELECT Titre_representation
FROM representations

-- b
SELECT titre_representation
FROM representations
WHERE Lieu = "l'opéra Bastille"

-- c
SELECT nom, titre_representation
FROM musicien m, representations r
WHERE m.`N°representation` = r.`N°representation`

-- d
SELECT Titre_representation, Lieu, Date
FROM representations r, programmer p
WHERE r.`N°representation`= p.`N°representation` 
AND DATE = "2014-09-14"


-- exercice 2
-- a
SELECT COUNT(N°etudiant) 
FROM etudiant;

-- b
SELECT MAX(note), MIN(note)
FROM evaluer

-- c
CREATE VIEW Moyenne_eleve
AS
SELECT nom, prenom, coefmat ,libellemat, AVG(note) AS moyenne 
FROM etudiant, evaluer, matiere
WHERE etudiant.`N°etudiant` = evaluer.`N°etudiant` AND evaluer.codemat = matiere.codemat
GROUP BY Nom,Prenom,LibelleMat,coefmat;

-- d
SELECT libellemat, AVG(Moyenne_eleve)
FROM Moyenne_eleve
GROUP BY libellemat

-- e
CREATE VIEW MoyenneGeneral
AS
SELECT nom, prenom, SUM(Moyenne_eleve*coefmat)/SUM(coefmat) AS MGEtudiant
FROM Moyenne_eleve
GROUP BY nom, prenom;

-- f
SELECT AVG(MGEtudiant)
FROM MoyenneGeneral

-- g
SELECT nom, prenom, MGEtudiant
FROM MoyenneGeneral 
WHERE MGEtudiant>= (SELECT AVG(MGEtudiant) FROM MoyenneGeneral);


-- exercice 3
-- a
SELECT noArt, libelle, stock
FROM articles
WHERE stock < 10

-- b
SELECT *
FROM articles
WHERE prixInvent BETWEEN 100 AND 300

-- c
SELECT *
FROM fournisseurs
WHERE adrFour IS NULL

-- d
SELECT *
FROM fournisseurs
WHERE nomFour LIKE "STE%"

-- e
SELECT nomFour, adrFour, villeFour,delai
FROM fournisseurs, acheter
WHERE fournisseurs.noFour = acheter.noFour 
AND delai > 20

-- f
SELECT COUNT(*)
FROM articles

-- g
SELECT SUM(prixInvent*stock) AS valeurStock
FROM articles

-- h
SELECT noArt, libelle, stock
FROM articles
ORDER BY stock DESC 

-- i
SELECT articles.noArt,libelle,MIN(prixAchat) AS PrixAchatMin, 
MAX(prixAchat) AS PrixAchatMax, 
AVG(prixAchat) AS PrixAchatAVG
FROM articles, acheter
WHERE articles.noArt = acheter.noArt
GROUP BY articles.noArt,libelle;

-- j
SELECT fournisseurs.noFour,nomFour, COUNT(*), avg(delai) AS DelaiMoy
FROM fournisseurs, acheter
WHERE fournisseurs.noFour = acheter.noFour
GROUP BY fournisseurs.noFour,nomFour
HAVING COUNT(*) > 1

-- exercice 4
-- a
SELECT *
FROM etudiant

-- b
SELECT *
FROM etudiant
ORDER BY nom DESC 

-- c
SELECT libelle, coef*100
FROM matiere 

-- d
SELECT nom, prenom
FROM etudiant

-- e
SELECT *
FROM etudiant
WHERE ville = "Lyon"

-- f
SELECT *
FROM notation
WHERE note >= 10

-- g
SELECT *
FROM epreuve
WHERE dateEpreuve BETWEEN "2014-01-01" AND "2014-06-30"

-- h
SELECT *
FROM etudiant
WHERE ville LIKE '%ll%'

-- i
SELECT nom, prenom
FROM etudiant
WHERE nom IN ('Dupont', 'Durand', 'Martin')

-- j
SELECT SUM(coef) AS sommeCoef
FROM matiere 

-- k
SELECT COUNT(*) AS nbTotalEpreuves
FROM epreuve

-- l
SELECT COUNT(*)
FROM notation
WHERE note IS NULL

-- m
SELECT numEpreuve, dateEpreuve, lieu,libelle
FROM epreuve, matiere
WHERE epreuve.codeMat = matiere.codeMat

-- n
SELECT note, nom, prenom
FROM etudiant,notation
WHERE etudiant.numEtu = notation.numEtu 

-- o
SELECT note, nom,prenom,libelle
FROM notation, etudiant, matiere
WHERE notation.numEtu = etudiant.numEtu 
AND notation.codeMat = matiere.codeMat

-- p
SELECT nom, prenom,note
FROM etudiant, notation
WHERE etudiant.numEtu = notation.numEtu
AND note = 20

-- q
SELECT nom, prenom , AVG(note) AS moyennesNote
FROM etudiant, notation
WHERE etudiant.numEtu = notation.numEtu
GROUP BY nom,prenom

-- r
SELECT nom, prenom , AVG(note) AS moyennesNote
FROM etudiant, notation
WHERE etudiant.numEtu = notation.numEtu
GROUP BY nom,prenom
ORDER BY moyennesNote DESC  

-- s
SELECT note, libelle, COUNT(*), AVG(note) AS moyennes
FROM notation, matiere
WHERE notation.codeMat = matiere.codeMat
GROUP BY libelle, note
HAVING COUNT(*)>1 

-- t
SELECT numEpreuve, COUNT(numEpreuve) AS nbEpreuve, avg(note) AS moyennes
FROM epreuve, etudiant, notation
WHERE epreuve.codeMat = notation.codeMat
AND etudiant.numEtu = notation.numEtu
GROUP BY numEpreuve
HAVING COUNT(*)<6


-- exercice 5
-- a
INSERT INTO fournisseur (nomF,statut,villeF)
VALUES ('Unlimited', 'ouver', 'Shreveport');

-- b
DELETE FROM produit 
WHERE couleur = 'noir' 
AND poids BETWEEN 100 AND 1999

-- c
UPDATE fournisseur
SET villeF = 'Mulhouse'
WHERE numF = 3