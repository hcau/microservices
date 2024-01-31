package fr.caujolle.herve.accountservice.web;

import fr.caujolle.herve.accountservice.client.CustomerRestClient;
import fr.caujolle.herve.accountservice.entities.BankAccount;
import fr.caujolle.herve.accountservice.model.Customer;
import fr.caujolle.herve.accountservice.repository.BankAccountRepository;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@AllArgsConstructor
@RestController
//@RequestMapping("/api")
public class AccountRestController {
    private final BankAccountRepository accountRepository;

    // OpenFeign : injection de dépendance par le constructeur.
    private final CustomerRestClient customerRestClient;



    @GetMapping("/accounts")
    public List<BankAccount> accountList(){
        List<BankAccount> accountList = accountRepository.findAll();
        accountList.forEach(account ->{
            account.setCustomer(customerRestClient.findCustomerById(account.getCustomerId()));
        });
        return accountList;
    }

    @Operation(summary = "Get an account by its id")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Found the account",
                    content = { @Content(mediaType = "application/json",
                            schema = @Schema(implementation = BankAccount.class)) }),
            @ApiResponse(responseCode = "400", description = "Invalid id supplied",
                    content = @Content),
            @ApiResponse(responseCode = "404", description = "Account not found",
                    content = @Content) })

    @GetMapping("/accounts/{accountId}")
    public BankAccount bankAccountById(@PathVariable Long accountId){
        BankAccount bankAccount = accountRepository.findById(accountId).get();
        Customer customer = customerRestClient.findCustomerById(bankAccount.getCustomerId());
        bankAccount.setCustomer(customer);
        return bankAccount;
    }

}
