package fr.caujolle.herve.accountservice.repository;

import fr.caujolle.herve.accountservice.entities.BankAccount;
import org.springframework.data.jpa.repository.JpaRepository;




// @RepositoryRestResource
// Pour créer un web service RestFull, sans écrire le code au niveau du contrôleur
// Attention, ce n'est pas une bonne pratique, Utile pour créer un POC.
// SpringDataRest a déjà un web service générique.


import fr.caujolle.herve.accountservice.entities.BankAccount;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BankAccountRepository extends JpaRepository<BankAccount, Long>{
}

