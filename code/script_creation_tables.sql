 ---------------------------------------------------------------
 --        Script Oracle.  
 ---------------------------------------------------------------

DROP TABLE PAYS_ARTICLE;
DROP TABLE NATIONALITE;
DROP TABLE ARTICLE_COMPORTE_MOT;
DROP TABLE REDIGE;
DROP TABLE ARTICLE;
DROP TABLE AUTEUR;
DROP TABLE COLLECTION;

------------------------------------------------------------
-- Table: Auteur
------------------------------------------------------------

CREATE TABLE Auteur(
	Numero_auteur       VARCHAR2(255)  NOT NULL  ,
	Nom_prenom          VARCHAR2 (255)  ,
	Annee_de_naissance  NUMBER  ,
	Annee_de_deces      NUMBER  ,
	Profession          VARCHAR2 (255)  ,
	CONSTRAINT Auteur_PK PRIMARY KEY (Numero_auteur)
);


------------------------------------------------------------
-- Table: Collection
------------------------------------------------------------

CREATE TABLE Collection(
	ISSN            VARCHAR2 (255) NOT NULL  ,
	Nom_collection  VARCHAR2 (255) NOT NULL  ,
	Nb_numero       NUMBER ,
	Nb_document     NUMBER ,
	Annee_creation  NUMBER ,
	Annee_fin       NUMBER ,
    Discipline      VARCHAR2 (255)  ,
	Editeur         VARCHAR2 (255)  ,
	CONSTRAINT Collection_PK PRIMARY KEY (ISSN)
);

------------------------------------------------------------
-- Table: Article
------------------------------------------------------------

CREATE TABLE Article(
	Numero_article     NUMBER NOT NULL ,
	Titre_article      VARCHAR2 (2000)  ,
	Annee_publication  NUMBER(10,0)   ,
	ISSN               VARCHAR2 (255)  ,
	CONSTRAINT Article_PK PRIMARY KEY (Numero_article),
    CONSTRAINT Article_Collection_FK FOREIGN KEY (ISSN) REFERENCES Collection(ISSN)
);

------------------------------------------------------------
-- Table: redige
------------------------------------------------------------

CREATE TABLE redige(
	Numero_auteur   VARCHAR2(255) NOT NULL  ,
	Numero_article  NUMBER NOT NULL  ,
	CONSTRAINT redige_PK PRIMARY KEY (Numero_article,Numero_auteur),
    CONSTRAINT redige_Article_FK FOREIGN KEY (Numero_article) REFERENCES Article(Numero_article),
    CONSTRAINT redige_Auteur_FK FOREIGN KEY (Numero_auteur) REFERENCES Auteur(Numero_auteur)
);

------------------------------------------------------------
-- Table: article_comporte_mot
------------------------------------------------------------

CREATE TABLE article_comporte_mot(
	Numero_article     NUMBER NOT NULL  ,
    Mot                VARCHAR2 (255) NOT NULL  ,
	frequence_article  NUMBER ,
	CONSTRAINT article_comporte_mot_PK PRIMARY KEY (Mot, Numero_article),
    CONSTRAINT article_mot_Article_FK FOREIGN KEY (Numero_article) REFERENCES Article(Numero_article)
);

------------------------------------------------------------
-- Table: NATIONALITE
------------------------------------------------------------

CREATE TABLE NATIONALITE(
	Numero_auteur  VARCHAR2 (255)  NOT NULL  ,
	Nom_pays       VARCHAR2 (255) NOT NULL  ,
	CONSTRAINT pays_auteur_PK PRIMARY KEY (Nom_pays,Numero_auteur),
    CONSTRAINT pays_auteur_Auteur_FK FOREIGN KEY (Numero_auteur) REFERENCES Auteur(Numero_auteur)
);

------------------------------------------------------------
-- Table: pays_article
------------------------------------------------------------
CREATE TABLE pays_article(
	Nom_pays        VARCHAR2 (255) NOT NULL  ,
	Numero_article  NUMBER  NOT NULL  ,
	CONSTRAINT pays_article_PK PRIMARY KEY (Nom_pays,Numero_article),
    CONSTRAINT pays_article_Article_FK FOREIGN KEY (Numero_article) REFERENCES Article(Numero_article)
);

commit;