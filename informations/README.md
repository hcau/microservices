* lancer, en premier, Eureka, pour que les autres services puissent s'enregistrer

* lancer d'abord customer-service puis account-service (contient un circuit breaker sur custormer-service)

* lancer la gateway

# Addresses

* http://localhost:8761
* http://localhost:8088/ACCOUNT-SERVICE/accounts
* http://localhost:8088/ACCOUNT-SERVICE/accounts/1
* http://localhost:8088/CUSTOMER-SERVICE/customers
* http://localhost:8088/ACCOUNT-SERVICE/actuator/health
* http://localhost:8088/CUSTOMER-SERVICE/actuator/health

* http://localhost:8088/CUSTOMER-SERVICE/actuator

* http://192.168.0.12:8091/actuator/env


Toutes les classes, les beans, chargés en mémoire
* http://localhost:8088/CUSTOMER-SERVICE/actuator/beans

Toutes les variables d'environnement
* http://localhost:8088/CUSTOMER-SERVICE/actuator/metrics

* http://localhost:8091/swagger-ui/index.html
* http://localhost:8092/swagger-ui/index.html

