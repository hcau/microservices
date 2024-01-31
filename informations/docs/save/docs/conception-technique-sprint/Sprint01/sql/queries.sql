/*
 * ==================================
 * === REFERENCEMENT DES REQUETES ===
 * ==================================
 */

# tag::query-etablissements-campagne[]
SELECT DISTINCT tb02.id,
                tb02.siret,
	            tb02.uai,
	            tb02.raison_sociale
FROM tb02_etablissement_beneficiaire tb02
INNER JOIN tb04_campagne_etablissement_formation tb04
        ON tb04.id_etablissement_beneficiaire = tb02.id
INNER JOIN tb01_campagne tb01
        ON tb01.id = tb04.id_campagne
       AND tb01.annee = 2023
ORDER BY tb02.siret;
# end::query-etablissements-campagne[]


# tag::query-formations-etablissement-campagne[]
SELECT tb03.ID,
       tb03.code_rncp,
	   tb03.formation_dispensee,
	   tb03.type_diplome
FROM tb03_formation tb03
INNER JOIN tb04_campagne_etablissement_formation tb04
        ON tb04.id_formation = tb03.id
INNER JOIN tb01_campagne tb01
        ON tb01.id = tb04.id_campagne
       AND tb01.annee = 2023
INNER JOIN tb02_etablissement_beneficiaire tb02
        ON tb02.id = tb04.id_etablissement_beneficiaire
       AND tb02.siret = '26670602700015'
ORDER BY tb03.ID;
# end::query-formations-etablissement-campagne[]


# tag::query-count-formations-etablissement-campagne[]
SELECT DISTINCT tb02.siret,
	            tb02.raison_sociale,
				count(*)
FROM tb02_etablissement_beneficiaire tb02
INNER JOIN tb04_campagne_etablissement_formation tb04
        ON tb04.id_etablissement_beneficiaire = tb02.id
INNER JOIN tb01_campagne tb01
        ON tb01.id = tb04.id_campagne
       AND tb01.annee = 2023
INNER JOIN tb03_formation tb03
        ON tb03.id = tb04.id_formation
GROUP BY tb02.siret,
         tb02.raison_sociale
ORDER BY tb02.siret;
# end::query-count-formations-etablissement-campagne[]
