CREATE TABLE Adresse(
   Id SERIAL,
   numero INTEGER NOT NULL,
   rue VARCHAR(50) NOT NULL,
   ville VARCHAR(50) NOT NULL,
   code_postal VARCHAR(5) NOT NULL,
   CONSTRAINT PK_Adresse PRIMARY KEY(Id),
   CONSTRAINT AK_Adresse_ident UNIQUE(numero, rue, ville, code_postal)
);

CREATE TABLE Salle(
   Id SERIAL,
   nom VARCHAR(50) NOT NULL,
   CONSTRAINT PK_Salle PRIMARY KEY(Id),
   CONSTRAINT AK_Salle UNIQUE(nom)
);

CREATE TABLE Matiere(
   Id SERIAL,
   nom VARCHAR(50) NOT NULL,
   CONSTRAINT PK_Matiere PRIMARY KEY(Id),
   CONSTRAINT AK_Matiere UNIQUE(nom)
);

CREATE TABLE Individu(
   Id SERIAL,
   code VARCHAR(6) NOT NULL,
   nom VARCHAR(50) NOT NULL,
   prenom VARCHAR(50) NOT NULL,
   Id_adresse INTEGER NOT NULL,
   CONSTRAINT PK_Individu PRIMARY KEY(Id),
   CONSTRAINT AK_Individu UNIQUE(code),
   CONSTRAINT FK_Individu_Adresse_adresse FOREIGN KEY(Id_adresse) REFERENCES Adresse(Id)
);

CREATE TABLE Professeur(
   Id SERIAL,
   competence VARCHAR(50),
   Id_individu INTEGER NOT NULL,
   CONSTRAINT PK_Professeur PRIMARY KEY(Id),
   CONSTRAINT FK_Professeur_Individu_individu FOREIGN KEY(Id_individu) REFERENCES Individu(Id)
);

CREATE TABLE Etudiant(
   Id SERIAL,
   diplome VARCHAR(50),
   Id_individu INTEGER NOT NULL,
   CONSTRAINT PK_Etudiant PRIMARY KEY(Id),
   CONSTRAINT FK_Etudiant_Individu_individu FOREIGN KEY(Id_individu) REFERENCES Individu(Id)
);

CREATE TABLE Cours(
   Id SERIAL,
   heure_de_debut TIME NOT NULL,
   heure_de_fin TIME NOT NULL,
   Id_matiere INTEGER NOT NULL,
   Id_salle INTEGER NOT NULL,
   Id_professeur INTEGER NOT NULL,
   CONSTRAINT PK_Cours PRIMARY KEY(Id),
   CONSTRAINT AK_Cours_ident UNIQUE(Id_salle, heure_de_debut, heure_de_fin),
   CONSTRAINT FK_Cours_Matiere_matiere FOREIGN KEY(Id_matiere) REFERENCES Matiere(Id),
   CONSTRAINT FK_Cours_Salle_salle FOREIGN KEY(Id_salle) REFERENCES Salle(Id),
   CONSTRAINT FK_Cours_Professeur_professeur FOREIGN KEY(Id_professeur) REFERENCES Professeur(Id)
);

CREATE TABLE Etudiant_Cours(
   Id_etudiant INTEGER,
   Id_cours INTEGER,
   CONSTRAINT PK_Etudiant_Cours PRIMARY KEY(Id_etudiant, Id_cours),
   CONSTRAINT FK_Etudiant_Cours_Etudiant_etudiant FOREIGN KEY(Id_etudiant) REFERENCES Etudiant(Id),
   CONSTRAINT FK_Etudiant_Cours_Cours_cours FOREIGN KEY(Id_cours) REFERENCES Cours(Id)
);
