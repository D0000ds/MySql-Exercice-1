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
CREATE OR REPLACE VIEW Moyenne AS
SELECT etudiant.id_etudiant, matiere.id_codeMat, AVG(note*coeffMat)
FROM etudiant,evaluer,matiere
WHERE evaluer.id_codeMat = matiere.id_codeMat
AND evaluer.id_numEtudiant = etudiant.id_etudiant;