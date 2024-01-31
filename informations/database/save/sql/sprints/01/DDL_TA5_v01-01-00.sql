-- ===================================
-- === tbref01_fournisseur_liste ===
-- ===================================
CREATE SEQUENCE tbref01_fournisseur_liste_id_seq;

CREATE TABLE tbref01_fournisseur_liste (
                                             id  smallint NOT NULL DEFAULT nextval('tbref01_fournisseur_liste_id_seq') PRIMARY KEY,
                                             code varchar(255) NOT NULL,
                                             libelle varchar(255) NOT NULL
);

ALTER SEQUENCE tbref01_fournisseur_liste_id_seq OWNED BY tbref01_fournisseur_liste.id;


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

-- ================================
-- === tbref03_niveau_formation ===
-- ================================
CREATE SEQUENCE tbref03_type_liste_id_seq;

CREATE TABLE tbref03_type_liste (
                                          id      smallint NOT NULL DEFAULT nextval('tbref03_type_liste_id_seq') PRIMARY KEY,
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
                               active boolean  NOT NULL,
                               date_limite_ingestion DATE
);

ALTER SEQUENCE tb01_campagne_id_seq OWNED BY tb01_campagne.id;

-- =======================================
-- === tb02_etablissement_beneficiaire ===
-- =======================================
CREATE SEQUENCE tb02_etablissement_beneficiaire_id_seq;

CREATE TABLE tb02_etablissement_beneficiaire (
                                                 id             bigint      NOT NULL DEFAULT nextval('tb02_etablissement_beneficiaire_id_seq') PRIMARY KEY,
                                                 siret          varchar(14) NOT NULL UNIQUE,
                                                 uai            varchar(8)  NULL     UNIQUE,
                                                 sigle          varchar(50) NULL,
                                                 raison_sociale varchar(50) NOT NULL,
                                                 mail           varchar(50) NULL,
                                                 telephone      varchar(10) NULL,
                                                 dispensaire_formation varchar(1) NOT NULL
);

ALTER SEQUENCE tb02_etablissement_beneficiaire_id_seq OWNED BY tb02_etablissement_beneficiaire.id;

-- ======================
-- === tb03_formation ===
-- ======================
CREATE SEQUENCE tb03_formation_id_seq;

CREATE TABLE tb03_formation (
                                id                  bigint      NOT NULL DEFAULT nextval('tb03_formation_id_seq') PRIMARY KEY,
                                code_rncp           varchar(9)  NULL,
                                type_diplome        varchar(50) NULL,
                                formation_dispensee varchar(50) NOT NULL,
                                id_niveau_formation smallint    NULL
);

ALTER SEQUENCE tb03_formation_id_seq OWNED BY tb03_formation.id;

ALTER TABLE tb03_formation ADD CONSTRAINT fk_tb03_id_niveau_formation_tbref02_id FOREIGN KEY (id_niveau_formation) REFERENCES tbref02_niveau_formation (id);

-- =============================================
-- === tb04_campagne_etablissement_formation ===
-- =============================================

CREATE SEQUENCE tb04_campagne_etablissement_formation_id_seq;


CREATE TABLE tb04_campagne_etablissement_formation (
    id                            bigint      NOT NULL DEFAULT nextval('tb04_campagne_etablissement_formation_id_seq') PRIMARY KEY,
    id_campagne                   smallint NOT NULL,
    id_etablissement_beneficiaire bigint   NOT NULL,
    id_formation                  bigint   NULL);

ALTER TABLE tb04_campagne_etablissement_formation ADD CONSTRAINT fk_tb04_id_campagne_tb01_id FOREIGN KEY (id_campagne) REFERENCES tb01_campagne (id);
ALTER TABLE tb04_campagne_etablissement_formation ADD CONSTRAINT fk_tb04_id_etablissement_beneficiaire_tb02_id FOREIGN KEY (id_etablissement_beneficiaire) REFERENCES tb02_etablissement_beneficiaire (id);
ALTER TABLE tb04_campagne_etablissement_formation ADD CONSTRAINT fk_tb04_id_formation_tb03_id FOREIGN KEY (id_formation) REFERENCES tb03_formation (id);

-- ================================================
-- === tbhis01_liste_etablissement_beneficiaire ===
-- ================================================

CREATE SEQUENCE tbhis01_liste_etablissement_beneficiaire_id_seq;

CREATE TABLE tbhis01_liste_etablissement_beneficiaire
(
	id bigint not null DEFAULT nextval('tbhis01_liste_etablissement_beneficiaire_id_seq') PRIMARY KEY,
	date_import timestamp,
	nom_fichier varchar(255),
	numero_sequentiel integer,
	id_campagne integer,
	id_fournisseur_liste bigint,
	id_type_liste bigint
);

ALTER TABLE tbhis01_liste_etablissement_beneficiaire ADD CONSTRAINT fk_tb01_campagne_id FOREIGN KEY (id_campagne) REFERENCES tb01_campagne (id);
ALTER TABLE tbhis01_liste_etablissement_beneficiaire ADD CONSTRAINT fk_tbref01_fournisseur_liste_id FOREIGN KEY (id_fournisseur_liste) REFERENCES tbref01_fournisseur_liste (id);
ALTER TABLE tbhis01_liste_etablissement_beneficiaire ADD CONSTRAINT fk_tbref03_type_liste_id FOREIGN KEY (id_type_liste) REFERENCES tbref03_type_liste (id);

-- ================================================
-- === wrk01_etablissement ===
-- ================================================


CREATE SEQUENCE wrk01_etablissement_id_seq;

create table wrk01_etablissement (
                                     id bigint not null DEFAULT nextval('wrk01_etablissement_id_seq') PRIMARY KEY,
                                     annee_campagne varchar(255),
                                     code_rncp varchar(255),
                                     dispense_formation varchar(255),
                                     intitule_formation varchar(255),
                                     code_fournisseur_liste varchar(255),
                                     mail varchar(255),
                                     niveau_formation varchar(255),
                                     numero_sequentiel varchar(255),
                                     raison_sociale varchar(255),
                                     ligne1_adresse varchar(255),
                                     ligne2_adresse varchar(255),
                                     ligne3_adresse varchar(255),
                                     ligne4_adresse varchar(255),
                                     ligne5_adresse varchar(255),
                                     ligne6_adresse varchar(255),
                                     sigle varchar(255),
                                     siret varchar(255),
                                     telephone varchar(255),
                                     type_diplome varchar(255),
                                     type_liste varchar(255),
                                     uai varchar(255),
                                     erreur_traitement varchar(1) default 'N',
                                     id_etablissement bigint);

ALTER TABLE wrk01_etablissement ADD CONSTRAINT fk_twrk01_etablissement_id FOREIGN KEY (id_etablissement) REFERENCES tb02_etablissement_beneficiaire (id);

CREATE SEQUENCE wrk02_error_id_seq;

create table wrk02_error( id bigint not null DEFAULT nextval('wrk02_error_id_seq') PRIMARY KEY,
code_erreur varchar(50) NOT NULL ,
message_erreur varchar(255),
nom_donnee varchar(50),
valeur_rejetee varchar(255),
id_etablissement bigint);

-- ================================================
-- === TABLES SPRING BATCH ===
-- ================================================

-- Autogenerated: do not edit this part

CREATE TABLE BATCH_JOB_INSTANCE  (
                                     JOB_INSTANCE_ID BIGINT  NOT NULL PRIMARY KEY ,
                                     VERSION BIGINT ,
                                     JOB_NAME VARCHAR(100) NOT NULL,
                                     JOB_KEY VARCHAR(32) NOT NULL,
                                     constraint JOB_INST_UN unique (JOB_NAME, JOB_KEY)
) ;

CREATE TABLE BATCH_JOB_EXECUTION  (
                                      JOB_EXECUTION_ID BIGINT  NOT NULL PRIMARY KEY ,
                                      VERSION BIGINT  ,
                                      JOB_INSTANCE_ID BIGINT NOT NULL,
                                      CREATE_TIME TIMESTAMP NOT NULL,
                                      START_TIME TIMESTAMP DEFAULT NULL ,
                                      END_TIME TIMESTAMP DEFAULT NULL ,
                                      STATUS VARCHAR(10) ,
                                      EXIT_CODE VARCHAR(2500) ,
                                      EXIT_MESSAGE VARCHAR(2500) ,
                                      LAST_UPDATED TIMESTAMP,
                                      JOB_CONFIGURATION_LOCATION VARCHAR(2500) NULL,
                                      constraint JOB_INST_EXEC_FK foreign key (JOB_INSTANCE_ID)
                                          references BATCH_JOB_INSTANCE(JOB_INSTANCE_ID)
) ;

CREATE TABLE BATCH_JOB_EXECUTION_PARAMS  (
                                             JOB_EXECUTION_ID BIGINT NOT NULL ,
                                             TYPE_CD VARCHAR(6) NOT NULL ,
                                             KEY_NAME VARCHAR(100) NOT NULL ,
                                             STRING_VAL VARCHAR(250) ,
                                             DATE_VAL TIMESTAMP DEFAULT NULL ,
                                             LONG_VAL BIGINT ,
                                             DOUBLE_VAL DOUBLE PRECISION ,
                                             IDENTIFYING CHAR(1) NOT NULL ,
                                             constraint JOB_EXEC_PARAMS_FK foreign key (JOB_EXECUTION_ID)
                                                 references BATCH_JOB_EXECUTION(JOB_EXECUTION_ID)
) ;

CREATE TABLE BATCH_STEP_EXECUTION  (
                                       STEP_EXECUTION_ID BIGINT  NOT NULL PRIMARY KEY ,
                                       VERSION BIGINT NOT NULL,
                                       STEP_NAME VARCHAR(100) NOT NULL,
                                       JOB_EXECUTION_ID BIGINT NOT NULL,
                                       START_TIME TIMESTAMP NOT NULL ,
                                       END_TIME TIMESTAMP DEFAULT NULL ,
                                       STATUS VARCHAR(10) ,
                                       COMMIT_COUNT BIGINT ,
                                       READ_COUNT BIGINT ,
                                       FILTER_COUNT BIGINT ,
                                       WRITE_COUNT BIGINT ,
                                       READ_SKIP_COUNT BIGINT ,
                                       WRITE_SKIP_COUNT BIGINT ,
                                       PROCESS_SKIP_COUNT BIGINT ,
                                       ROLLBACK_COUNT BIGINT ,
                                       EXIT_CODE VARCHAR(2500) ,
                                       EXIT_MESSAGE VARCHAR(2500) ,
                                       LAST_UPDATED TIMESTAMP,
                                       constraint JOB_EXEC_STEP_FK foreign key (JOB_EXECUTION_ID)
                                           references BATCH_JOB_EXECUTION(JOB_EXECUTION_ID)
) ;

CREATE TABLE BATCH_STEP_EXECUTION_CONTEXT  (
                                               STEP_EXECUTION_ID BIGINT NOT NULL PRIMARY KEY,
                                               SHORT_CONTEXT VARCHAR(2500) NOT NULL,
                                               SERIALIZED_CONTEXT TEXT ,
                                               constraint STEP_EXEC_CTX_FK foreign key (STEP_EXECUTION_ID)
                                                   references BATCH_STEP_EXECUTION(STEP_EXECUTION_ID)
) ;

CREATE TABLE BATCH_JOB_EXECUTION_CONTEXT  (
                                              JOB_EXECUTION_ID BIGINT NOT NULL PRIMARY KEY,
                                              SHORT_CONTEXT VARCHAR(2500) NOT NULL,
                                              SERIALIZED_CONTEXT TEXT ,
                                              constraint JOB_EXEC_CTX_FK foreign key (JOB_EXECUTION_ID)
                                                  references BATCH_JOB_EXECUTION(JOB_EXECUTION_ID)
) ;

CREATE SEQUENCE BATCH_STEP_EXECUTION_SEQ MAXVALUE 9223372036854775807 NO CYCLE;
CREATE SEQUENCE BATCH_JOB_EXECUTION_SEQ MAXVALUE 9223372036854775807 NO CYCLE;
CREATE SEQUENCE BATCH_JOB_SEQ MAXVALUE 9223372036854775807 NO CYCLE;
