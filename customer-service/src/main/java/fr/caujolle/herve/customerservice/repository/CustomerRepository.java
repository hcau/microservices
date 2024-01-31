package fr.caujolle.herve.customerservice.repository;

import fr.caujolle.herve.customerservice.entities.Customer;
import org.springframework.data.jpa.repository.JpaRepository;


// @RepositoryRestResource
// Pour créer un web service RestFull, sans écrire le code au niveau du contrôleur
// Attention, ce n'est pas une bonne pratique, Utile pour créer un POC.
// SpringDataRest a déjà un web service générique.


public interface CustomerRepository extends JpaRepository<Customer, Long> {
}
