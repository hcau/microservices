package fr.caujolle.herve.customerservice;

import fr.caujolle.herve.customerservice.entities.Customer;
import fr.caujolle.herve.customerservice.repository.CustomerRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import java.util.List;

@SpringBootApplication
public class CustomerServiceApplication {

    public static void main(String[] args) {
        SpringApplication.run(CustomerServiceApplication.class, args);
    }

    // @Bean méthode qui s'exécute au démarrage
    @Bean

    CommandLineRunner commandLineRunner(CustomerRepository customerRepository) {
        return args -> {
            Customer customer1 = Customer.builder()
                    .firstName("Hervé")
                    .lastName("Caujolle")
                    .email("hcaujolle@groupeais.fr")
                    .build();
            Customer customer2 = Customer.builder()
                    .firstName("Georgette")
                    .lastName("Pedoya")
                    .email("gpedoya@groupeais.fr")
                    .build();
            List<Customer> customerList = List.of(customer1, customer2);
            customerRepository.saveAll(customerList);
        };
    }

}
