package fr.caujolle.herve.accountservice;

import fr.caujolle.herve.accountservice.client.CustomerRestClient;
import fr.caujolle.herve.accountservice.entities.BankAccount;
import fr.caujolle.herve.accountservice.enums.AccountType;
import fr.caujolle.herve.accountservice.repository.BankAccountRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.Bean;

import java.time.LocalDate;
import java.util.UUID;


@SpringBootApplication
@EnableFeignClients // activation d'openFeign
public class AccountServiceApplication {

	public static void main(String[] args) {
		SpringApplication.run(AccountServiceApplication.class, args);
	}

	// @Bean méthode qui s'exécute au démarrage
	@Bean
	CommandLineRunner commandLineRunner(BankAccountRepository accountRepository,
										CustomerRestClient customerRestClient) {
		return args -> {
			// Pour chaque customer, je crée deux comptes : compte courant et compte d'épargne.
			customerRestClient.allCustomers().forEach(customer -> {
				BankAccount bankAccount1 = BankAccount.builder()
						.accountId(UUID.randomUUID().getMostSignificantBits() & Long.MAX_VALUE)
						.currency("€")
						.balance(Math.random()*8000)
						.createAt(LocalDate.now())
						.type(AccountType.CURRENT_ACCOUNT)
						.customerId(customer.getId())
						.build();
				BankAccount bankAccount2 = BankAccount.builder()
						.accountId(UUID.randomUUID().getMostSignificantBits() & Long.MAX_VALUE)
						.currency("€")
						.balance(Math.random()*8000)
						.createAt(LocalDate.now())
						.type(AccountType.SAVING_ACCOUNT)
						.customerId(customer.getId())
						.build();
				accountRepository.save(bankAccount1);
				accountRepository.save(bankAccount2);
			});
		};
	}
}
