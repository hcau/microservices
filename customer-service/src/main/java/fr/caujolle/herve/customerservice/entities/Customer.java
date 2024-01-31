package fr.caujolle.herve.customerservice.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.*;

//@Data // ajoute les getters et les setters mais aussi d'autres méthodes : toString(), hashCode(), equals()
// à éviter car peut générer des conflits avec JPA
@Getter @Setter @ToString @NoArgsConstructor @AllArgsConstructor @Builder
@Entity
public class Customer {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String firstName;
    private String lastName;
    private  String email;

}
