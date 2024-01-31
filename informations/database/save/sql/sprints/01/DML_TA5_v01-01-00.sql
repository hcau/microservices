-- ===================================
-- === tbref01_service_instructeur ===
-- ===================================

INSERT INTO tbref01_fournisseur_liste (code, libelle) VALUES ('N01','Ministère');
INSERT INTO tbref01_fournisseur_liste (code, libelle) VALUES ('R01','Guadeloupe');
INSERT INTO tbref01_fournisseur_liste (code, libelle) VALUES ('R02','Martinique');
INSERT INTO tbref01_fournisseur_liste (code, libelle) VALUES ('R03','Guyane');
INSERT INTO tbref01_fournisseur_liste (code, libelle) VALUES ('R04','La Réunion');
INSERT INTO tbref01_fournisseur_liste (code, libelle) VALUES ('R06','Mayotte');
INSERT INTO tbref01_fournisseur_liste (code, libelle) VALUES ('R11','Île-de-France');
INSERT INTO tbref01_fournisseur_liste (code, libelle) VALUES ('R24','Centre-Val de Loire');
INSERT INTO tbref01_fournisseur_liste (code, libelle) VALUES ('R27','Bourgogne-Franche-Comté');
INSERT INTO tbref01_fournisseur_liste (code, libelle) VALUES ('R28','Normandie');
INSERT INTO tbref01_fournisseur_liste (code, libelle) VALUES ('R32','Hauts-de-France');
INSERT INTO tbref01_fournisseur_liste (code, libelle) VALUES ('R44','Grand Est');
INSERT INTO tbref01_fournisseur_liste (code, libelle) VALUES ('R52','Pays de la Loire');
INSERT INTO tbref01_fournisseur_liste (code, libelle) VALUES ('R53','Bretagne');
INSERT INTO tbref01_fournisseur_liste (code, libelle) VALUES ('R75','Nouvelle-Aquitaine');
INSERT INTO tbref01_fournisseur_liste (code, libelle) VALUES ('R76','Occitanie');
INSERT INTO tbref01_fournisseur_liste (code, libelle) VALUES ('R84','Auvergne-Rhône-Alpes');
INSERT INTO tbref01_fournisseur_liste (code, libelle) VALUES ('R93','Provence-Alpes-Côte d''Azur');
INSERT INTO tbref01_fournisseur_liste (code, libelle) VALUES ('R94','Corse');

-- ================================
-- === tbref02_niveau_formation ===
-- ================================

INSERT INTO tbref02_niveau_formation (code, libelle) VALUES ('1', 'Niveau 7 (BAC +5)');
INSERT INTO tbref02_niveau_formation (code, libelle) VALUES ('2', 'Niveau 6 (BAC +3 ou 4)');
INSERT INTO tbref02_niveau_formation (code, libelle) VALUES ('3', 'Niveau 5 (BAC +2)');
INSERT INTO tbref02_niveau_formation (code, libelle) VALUES ('4', 'Niveau 4 (BAC)');
INSERT INTO tbref02_niveau_formation (code, libelle) VALUES ('5', 'Niveau 3 (CAP, BEP)');

-- ================================
-- === tbref03_type_liste ===
-- ================================
INSERT INTO tbref03_type_liste (code, libelle) VALUES ('N1', 'Liste nationale des organismes agissant au plan national pour la promotion de la formation technologique, et professionnelle initiale et des métiers');
INSERT INTO tbref03_type_liste (code, libelle) VALUES ('R2', 'Liste des organismes et de leurs formations dispensées par les établissements habilités à bénéficier des dépenses libératoires (régionale)');
INSERT INTO tbref03_type_liste (code, libelle) VALUES ('R3', 'Liste, communiquée par le président du conseil régional des organismes participant au service public de l’orientation tout au long de la vie et de leurs formations (régionale)');

-- =====================
-- === tb01_campagne ===
-- =====================

INSERT INTO tb01_campagne (annee, active) VALUES (2023, true);
INSERT INTO tb01_campagne (annee, active) VALUES (2024, false);
INSERT INTO tb01_campagne (annee, active) VALUES (2025, false);