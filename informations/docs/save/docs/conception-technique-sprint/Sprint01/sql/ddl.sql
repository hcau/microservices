-- ===================================
-- === tbref01_service_instructeur ===
-- ===================================
CREATE SEQUENCE tbref01_service_instructeur_id_seq;

CREATE TABLE tbref01_service_instructeur (
  id  smallint NOT NULL DEFAULT nextval('tbref01_service_instructeur_id_seq') PRIMARY KEY,
  nom varchar(255) NOT NULL
);

ALTER SEQUENCE tbref01_service_instructeur_id_seq OWNED BY tbref01_service_instructeur.id;


-- ================================
-- === tbref02_niveau_formation ===
-- ================================
CREATE SEQUENCE tbref02_niveau_formation_id_seq;

CREATE TABLE tbref02_niveau_formation (
  id      smallint NOT NULL DEFAULT nextval('tbref02_niveau_formation_id_seq') PRIMARY KEY,
  code    varchar(20)  NOT NULL,
  libelle varchar(255) NOT NULL
);

ALTER SEQUENCE tbref02_niveau_formation_id_seq OWNED BY tbref02_niveau_formation.id;


-- =====================
-- === tb01_campagne ===
-- =====================
CREATE SEQUENCE tb01_campagne_id_seq;

CREATE TABLE tb01_campagne (
  id     smallint NOT NULL DEFAULT nextval('tb01_campagne_id_seq') PRIMARY KEY,
  annee  smallint NOT NULL,
  active boolean  NOT NULL
);

ALTER SEQUENCE tb01_campagne_id_seq OWNED BY tb01_campagne.id;


-- =======================================
-- === tb02_etablissement_beneficiaire ===
-- =======================================
CREATE SEQUENCE tb02_etablissement_beneficiaire_id_seq;

CREATE TABLE tb02_etablissement_beneficiaire (
  id             bigint      NOT NULL DEFAULT nextval('tb02_etablissement_beneficiaire_id_seq') PRIMARY KEY,
  siret          varchar(14) NOT NULL UNIQUE,
  uai            varchar(9)  NULL     UNIQUE,
  sigle          varchar(50) NULL,
  raison_sociale varchar(80) NOT NULL,
  mail           varchar(50) NULL,
  telephone      varchar(10) NULL
);

ALTER SEQUENCE tb02_etablissement_beneficiaire_id_seq OWNED BY tb02_etablissement_beneficiaire.id;


-- ======================
-- === tb03_formation ===
-- ======================
CREATE SEQUENCE tb03_formation_id_seq;

CREATE TABLE tb03_formation (
  id                  bigint      NOT NULL DEFAULT nextval('tb03_formation_id_seq') PRIMARY KEY,
  code_rncp           varchar(6)  NULL,
  type_diplome        varchar(50) NOT NULL,
  formation_dispensee varchar(50) NOT NULL,
  id_niveau_formation smallint    NOT NULL
);

ALTER SEQUENCE tb03_formation_id_seq OWNED BY tb03_formation.id;

ALTER TABLE tb03_formation ADD CONSTRAINT fk_tb03_id_niveau_formation_tbref02_id FOREIGN KEY (id_niveau_formation) REFERENCES tbref02_niveau_formation (id);


-- =============================================
-- === tb04_campagne_etablissement_formation ===
-- =============================================
CREATE TABLE tb04_campagne_etablissement_formation (
  id_campagne                   smallint NOT NULL,
  id_etablissement_beneficiaire bigint   NOT NULL,
  id_formation                  bigint   NULL,
  PRIMARY KEY (id_campagne, id_etablissement_beneficiaire, id_formation)
);

ALTER TABLE tb04_campagne_etablissement_formation ADD CONSTRAINT fk_tb04_id_campagne_tb01_id FOREIGN KEY (id_campagne) REFERENCES tb01_campagne (id);
ALTER TABLE tb04_campagne_etablissement_formation ADD CONSTRAINT fk_tb04_id_etablissement_beneficiaire_tb02_id FOREIGN KEY (id_etablissement_beneficiaire) REFERENCES tb02_etablissement_beneficiaire (id);
ALTER TABLE tb04_campagne_etablissement_formation ADD CONSTRAINT fk_tb04_id_formation_tb03_id FOREIGN KEY (id_formation) REFERENCES tb03_formation (id);

