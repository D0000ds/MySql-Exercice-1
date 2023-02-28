-- Exercice 1 a)
SELECT titre_representation 
FROM representation;

-- Exercice 1 b)
SELECT titre_representation, lieu 
FROM representation 
WHERE lieu = "Opera bastille";

-- Exercice 1 c)
SELECT id_nom, titre_representation
FROM musicien,representation
WHERE musicien.id_numRepresentation = representation.id_numRepresentation;

-- Exercice 1 d)
SELECT titre_representation,lieu,tarif
FROM representation,programmer
WHERE representation.id_numRepresentation = programmer.id_numRepresentation
AND programmer.id_date = '2014-09-14';

-- Exercice 2 a)
SELECT COUNT(id_etudiant)
FROM etudiant

-- Exercice 2 b)
SELECT MAX(note), MIN(note)
FROM evaluer;

-- Exercice 2 c)
SELECT etudiant.id_etudiant, matiere.id_codeMat, AVG(note*coeffMat)
FROM etudiant,evaluer,matiere
WHERE evaluer.id_codeMat = matiere.id_codeMat
AND evaluer.id_numEtudiant = etudiant.id_etudiant;

-- Exercice 2 d)
SELECT libelle_mat, AVG(moyennes)
FROM matiere
GROUP BY libelle_mat;

-- Exercice 2 e)
SELECT etudiant.id_etudiant,nom,prenom,
SUM(moyennes*coeff_mat)/COUNT(moyennes) AS moyenneEtudiant
FROM moyennes,etudiant
GROUP BY etudiant,nom,prenom;

-- Exercice 2 f)
SELECT AVG(moyenneEtudiant)
FROM moyenne_etudiant;

-- Exercice 2 g)
SELECT etudiant.id_etudiant,nom,prenom,moyenneEtudiant,
FROM moyenne_etudiant
WHERE moyenneEtudiant >=(AVG(moyenneEtudiant));

-- Exercice 3 a)
SELECT articles.id_noArt,libelle,stock
FROM articles
WHERE stock<10;

-- Exercice 3 b)
SELECT libelle
FROM articles
WHERE prixInvent BETWEEN 100 AND 300;

-- Exercice 3 c)
SELECT nomFour
FROM fournisseurs
WHERE adrFour is NULL;

-- Exercice 3 d)
SELECT nomFour,adrFour,villeFour
FROM fournisseurs
WHERE nomFour LIKE "Ste%";

-- Exercice 3 e)
SELECT nomFour,adrFour,villeFour
FROM fournisseurs,acheter
WHERE fournisseurs.id_noFour=acheter.id_noFour
AND delai>20;

-- Exercice 3 f)
SELECT COUNT(*) 
FROM articles;

-- Exercice 3 g)
SELECT SUM(stock*prixInvent)
FROM ARTICLES;

-- Exercice 3 h)
SELECT libelle, stock
FROM articles
ORDER BY stock DESC;

-- Exercice 3 i)
SELECT acheter.id_noArt, libelle, MAX(prixAchat), MIN(prixAchat), AVG(prixAchat)
FROM acheter, articles
WHERE acheter.id_noArt = articles.id_noArt
GROUP BY acheter.id_noArt, libelle;

-- Exercice 3 j)
SELECT acheter.id_noFour, nomFour, AVG(delai)
FROM acheter, fournisseurs
WHERE acheter.id_noFour = fournisseurs.id_noFour
GROUP BY acheter.id_noFour, nomFour
HAVING COUNT(*) >=2;

-- Exercice 4 a)
SELECT *
FROM etudiant;

-- Exercice 4 b)
SELECT *
FROM etudiant
ORDER BY nom DESC;

-- Exercice 4 c)
SELECT libelle, coef/100
FROM matiere;

-- Exercice 4 d)
SELECT nom, prenom
FROM etudiant;

-- Exercice 4 e)
SELECT nom, prenom, ville
FROM etudiant
WHERE ville="Lyon";

-- Exercice 4 f)
SELECT note
FROM notation
WHERE note>=10;

-- Exercice 4 g)
SELECT dateEpreuve, lieu, epreuve.id_codeMat
FROM epreuve
WHERE dateEpreuve BETWEEN '2014-01-01' AND '2014-06-30';

-- Exercice 4 h)
SELECT nom, prenom, ville, cp 
FROM etudiant 
WHERE ville LIKE "%ll%";

-- Exercice 4 i)
SELECT prenom , nom
FROM etudiant 
WHERE nom IN ("Dupont", "Durand", "Martin");

-- Exercice 4 j)
SELECT SUM(coef) 
FROM matiere;

-- Exercice 4 k)
SELECT COUNT(*) 
FROM epreuve;

-- Exercice 4 l)
SELECT COUNT(*) 
FROM notation 
WHERE note IS NULL;

-- Exercice 4 m)
SELECT epreuve.id_numEpreuve, dateEpreuve, lieu, libelle 
FROM epreuve, matiere 
WHERE epreuve.id_codeMat= matiere.id_codeMat;

-- Exercice 4 n)
SELECT nom, prenom, note 
FROM etudiant, notation 
WHERE etudiant.id_numEtudiant=notation.id_numEtu;

-- Exercice 4 o)
SELECT nom, prenom, note, libelle 
FROM etudiant, notation, epreuve, matiere 
WHERE etudiant.id_numEtudiant=notation.id_numEtu
AND notation.id_numEpreuve=epreuve.id_numEpreuve
AND epreuve.id_codeMat=matiere.id_codeMat;

-- Exercice 4 p)
SELECT nom, prenom, note
FROM etudiant, notation 
WHERE etudiant.id_numEtudiant=notation.id_numEtu 
AND note=20;

-- Exercice 4 q)
SELECT nom, prenom, AVG(note) 
FROM etudiant, notation 
WHERE etudiant.id_numEtudiant=notation.id_numEtu
GROUP BY nom, prenom;

-- Exercice 4 r)
SELECT nom, prenom, AVG(note)
FROM etudiant, notation 
WHERE etudiant.id_numEtudiant=notation.id_numEtu
GROUP BY nom, prenom
ORDER BY AVG(note) DESC;

-- Exercice 4 s)
SELECT libelle, AVG(note) 
FROM matiere, epreuve, notation 
WHERE matiere.id_codeMat=epreuve.id_codeMat 
AND epreuve.id_numEpreuve=notation.id_numEpreuve
GROUP BY libelle;

-- Exercice 4 t)
SELECT epreuve.id_numEpreuve, AVG(note) 
FROM notation, epreuve
WHERE epreuve.id_numEpreuve = notation.id_numEpreuve
GROUP BY epreuve.id_numEpreuve 
HAVING COUNT(notation.id_numEtu)<6;

-- Exercice 5 a)
