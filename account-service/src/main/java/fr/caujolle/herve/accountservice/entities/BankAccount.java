package fr.caujolle.herve.accountservice.entities;

import fr.caujolle.herve.accountservice.enums.AccountType;
import fr.caujolle.herve.accountservice.model.Customer;
import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate;

//@Data // ajoute les getters et les setters mais aussi d'autres méthodes : toString(), hashCode(), equals()
// à éviter car peut générer des conflits avec JPA
@Getter @Setter @ToString @NoArgsConstructor @AllArgsConstructor @Builder
@Entity
public class BankAccount {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long accountId;
    private double balance; // solde
    private LocalDate createAt;
    private String currency;
    @Enumerated(EnumType.STRING) // pas optimisé, mais plus explicite qu'ordinal
    private AccountType type;

    // clé étrangère : id d'un autre service
    // On envoie une requête à customer-service pour récupérer le modèle Customer
    // ça complique la procédure pour l'intégration référentielle.
    // C'est au niveau du service qu'il faudra vérifier les contraintes d'intégrité référentielle.
    private Long customerId;
    // Dans une application monolithique, on aurait écrit :
    @Transient // ignore l'attribut customer
    private Customer customer;
    // mais ce n'est pas une entité JPA, Customer est géré
    // par un autre service. Customer est un modèle.
}
