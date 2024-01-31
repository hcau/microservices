package fr.caujolle.herve.accountservice.model;


import lombok.*;

//@Data // ajoute les getters et les setters mais aussi d'autres méthodes : toString(), hashCode(), equals()
// à éviter car peut générer des conflits avec JPA
@Getter
@Setter
@ToString
public class Customer {
    private Long id;
    private String firstName;
    private String lastName;
    private String email;
}
