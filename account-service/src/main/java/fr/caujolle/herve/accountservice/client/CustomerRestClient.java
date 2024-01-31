package fr.caujolle.herve.accountservice.client;

import fr.caujolle.herve.accountservice.model.Customer;
import io.github.resilience4j.circuitbreaker.annotation.CircuitBreaker;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

/**
 * Création d’un package «client».
 * Ce package contiendra le code pour communiquer avec un autre micro-service.
 */

@FeignClient(name="CUSTOMER-SERVICE")
public interface CustomerRestClient {
    @GetMapping("/customers/{id}")
    // fallbackMethod = "getDefaultCustomer", si customer-service est inaccessible, alors
    // invoquer la méthode en local, en cas de panne, "getDefaultCustomer()".
    @CircuitBreaker(name="customerService",fallbackMethod = "getCustomerByDefault")
    Customer findCustomerById(@PathVariable Long id);

    @CircuitBreaker(name="customerService",fallbackMethod = "getAllCustomersByDefault")
    @GetMapping("/customers")
    List<Customer> allCustomers();

    // CircuitBreaker transmet l'exception à cette méthode.
    // Si on veut la traiter, on pourra la traiter.
    default Customer getCustomerByDefault(Long id, Exception exception){
        Customer customer = new Customer();
        customer.setId(id);
        customer.setFirstName("Not Vailable");
        customer.setLastName("Not Vailable");
        customer.setEmail("Not Vailable");
        return customer;
    }

    default List<Customer> getAllCustomersByDefault(Exception exception){
        // On retourne une liste vide.
        return List.of();
    }
}
