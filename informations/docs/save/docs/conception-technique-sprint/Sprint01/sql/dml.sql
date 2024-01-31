-- ===================================
-- === tbref01_service_instructeur ===
-- ===================================

INSERT INTO tbref01_service_instructeur (nom) VALUES ('ARS');
INSERT INTO tbref01_service_instructeur (nom) VALUES ('DREETS');
INSERT INTO tbref01_service_instructeur (nom) VALUES ('DRAAF');
INSERT INTO tbref01_service_instructeur (nom) VALUES ('DRAC');
INSERT INTO tbref01_service_instructeur (nom) VALUES ('DRAJES-DREETS');
INSERT INTO tbref01_service_instructeur (nom) VALUES ('RECTORAT NANCY METZ');
INSERT INTO tbref01_service_instructeur (nom) VALUES ('RECTORAT REIMS');
INSERT INTO tbref01_service_instructeur (nom) VALUES ('RECTORAT STRASBOURG');
INSERT INTO tbref01_service_instructeur (nom) VALUES ('UNIVERSITE HAUTE ALSACE');
INSERT INTO tbref01_service_instructeur (nom) VALUES ('UNIVERSITE LORRAINE');
INSERT INTO tbref01_service_instructeur (nom) VALUES ('UNIVERSITE STRASBOURG');
INSERT INTO tbref01_service_instructeur (nom) VALUES ('UNIVERSITE CH ARDENNES');


-- ================================
-- === tbref02_niveau_formation ===
-- ================================

INSERT INTO tbref02_niveau_formation (code, libelle) VALUES ('1', 'Niveau 7 (BAC +5)');
INSERT INTO tbref02_niveau_formation (code, libelle) VALUES ('2', 'Niveau 6 (BAC +3 ou 4)');
INSERT INTO tbref02_niveau_formation (code, libelle) VALUES ('3', 'Niveau 5 (BAC +2)');
INSERT INTO tbref02_niveau_formation (code, libelle) VALUES ('4', 'Niveau 4 (BAC)');
INSERT INTO tbref02_niveau_formation (code, libelle) VALUES ('5', 'Niveau 3 (CAP, BEP)');


-- =====================
-- === tb01_campagne ===
-- =====================

INSERT INTO tb01_campagne (annee, active) VALUES (2023, true);
INSERT INTO tb01_campagne (annee, active) VALUES (2024, false);
INSERT INTO tb01_campagne (annee, active) VALUES (2025, false);


-- =======================================
-- === tb02_etablissement_beneficiaire ===
-- =======================================

INSERT INTO tb02_etablissement_beneficiaire (siret, uai, sigle, raison_sociale, mail, telephone) VALUES ('26670004600011', '0672694P', null, 'CENTRE HOSPITALIER DEPARTEMENTAL BISCHWILLER', 'test1@test.fr', '0600000001');
INSERT INTO tb02_etablissement_beneficiaire (siret, uai, sigle, raison_sociale, mail, telephone) VALUES ('26670602700015', '0672339D', null, 'ETS PUBLIC DE SANTE ALSACE-NORD', 'test2@test.fr', '0600000002');
INSERT INTO tb02_etablissement_beneficiaire (siret, uai, sigle, raison_sociale, mail, telephone) VALUES ('26670031900012', '0672981B', null, 'CENTRE HOSPITALIER D''ERSTEIN', 'test3@test.fr', '0600000003');
INSERT INTO tb02_etablissement_beneficiaire (siret, uai, sigle, raison_sociale, mail, telephone) VALUES ('26670011100013', '0672337B', null, 'CENTRE HOSPITALIER DE HAGUENAU', 'test4@test.fr', '0600000004');


-- ======================
-- === tb03_formation ===
-- ======================

INSERT INTO tb03_formation (code_rncp, type_diplome, formation_dispensee, id_niveau_formation) VALUES ('35830', 'DEAS', 'DIPLOME D''ETAT D''AIDE-SOIGNANT', 4);
INSERT INTO tb03_formation (code_rncp, type_diplome, formation_dispensee, id_niveau_formation) VALUES ('8940', 'DEI', 'DIPLOME D''ETAT D''INFIRMIER', 2);
INSERT INTO tb03_formation (code_rncp, type_diplome, formation_dispensee, id_niveau_formation) VALUES ('35830', 'DEAS', 'DIPLOME D''ETAT D''AIDE-SOIGNANT', 4);
INSERT INTO tb03_formation (code_rncp, type_diplome, formation_dispensee, id_niveau_formation) VALUES ('8940', 'DEI', 'DIPLOME D''ETAT D''INFIRMIER', 2);
INSERT INTO tb03_formation (code_rncp, type_diplome, formation_dispensee, id_niveau_formation) VALUES ('8940', 'DEI', 'DIPLOME D''ETAT D''INFIRMIER', 2);
INSERT INTO tb03_formation (code_rncp, type_diplome, formation_dispensee, id_niveau_formation) VALUES ('35830', 'DEAS', 'DIPLOME D''ETAT D''AIDE-SOIGNANT', 4);


-- =============================================
-- === tb04_campagne_etablissement_formation ===
-- =============================================

-- Campagne 2023
INSERT INTO tb04_campagne_etablissement_formation (id_campagne, id_etablissement_beneficiaire, id_formation) VALUES (1, 1, 1);
INSERT INTO tb04_campagne_etablissement_formation (id_campagne, id_etablissement_beneficiaire, id_formation) VALUES (1, 2, 2);
INSERT INTO tb04_campagne_etablissement_formation (id_campagne, id_etablissement_beneficiaire, id_formation) VALUES (1, 2, 3);
INSERT INTO tb04_campagne_etablissement_formation (id_campagne, id_etablissement_beneficiaire, id_formation) VALUES (1, 3, 4);
INSERT INTO tb04_campagne_etablissement_formation (id_campagne, id_etablissement_beneficiaire, id_formation) VALUES (1, 4, 5);
INSERT INTO tb04_campagne_etablissement_formation (id_campagne, id_etablissement_beneficiaire, id_formation) VALUES (1, 4, 6);

-- Campagne 2024
INSERT INTO tb04_campagne_etablissement_formation (id_campagne, id_etablissement_beneficiaire, id_formation) VALUES (2, 1, 1);
INSERT INTO tb04_campagne_etablissement_formation (id_campagne, id_etablissement_beneficiaire, id_formation) VALUES (2, 2, 2);
INSERT INTO tb04_campagne_etablissement_formation (id_campagne, id_etablissement_beneficiaire, id_formation) VALUES (2, 2, 3);
INSERT INTO tb04_campagne_etablissement_formation (id_campagne, id_etablissement_beneficiaire, id_formation) VALUES (2, 3, 4);
INSERT INTO tb04_campagne_etablissement_formation (id_campagne, id_etablissement_beneficiaire, id_formation) VALUES (2, 4, 5);
INSERT INTO tb04_campagne_etablissement_formation (id_campagne, id_etablissement_beneficiaire, id_formation) VALUES (2, 4, 6);
