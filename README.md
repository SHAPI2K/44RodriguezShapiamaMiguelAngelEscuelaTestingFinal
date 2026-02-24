# 44RodriguezShapiamaMiguelAngelEscuelaTestingFinal

## Descripción
Proyecto de automatización 
- Store API
- User API

Se incluyen casos Happy Path y Unhappy Path con ejecución por tags configuración centralizada en karate-config.js y uso de archivos JSON para la data.

Tecnologías
- Java 17
- Maven
- Karate (JUnit5)

Estructura
- `src/test/java/StoreRunner/`       feature y runner de Store
- `src/test/java/userRunner/`        feature y runner de User
- `src/test/java/examples/data/`     data en JSON (store/user)
- `src/test/java/karate-config.js`   configuración baseUrl del ambiente

Configuración (karate-config.js)
La URL base se configura en:
- `baseUrl = https://petstore.swagger.io/v2`

Puedes ejecutar el Store y el User por los tags con estos comandos:

STORE
- mvn test -Dkarate.options="classpath:StoreRunner/store.feature --tags @STORE-HP-01"
- mvn test -Dkarate.options="classpath:StoreRunner/store.feature --tags @STORE-HP-02"
- mvn test -Dkarate.options="classpath:StoreRunner/store.feature --tags @STORE-HP-03"
- mvn test -Dkarate.options="classpath:StoreRunner/store.feature --tags @STORE-HP-04"

- mvn test -Dkarate.options="classpath:StoreRunner/store.feature --tags @STORE-UHP-01"
- mvn test -Dkarate.options="classpath:StoreRunner/store.feature --tags @STORE-UHP-02"


USER
- mvn test -Dkarate.options="classpath:userRunner/user.feature --tags @USER-HP-01"
- mvn test -Dkarate.options="classpath:userRunner/user.feature --tags @USER-HP-02"
- mvn test -Dkarate.options="classpath:userRunner/user.feature --tags @USER-HP-03"
- mvn test -Dkarate.options="classpath:userRunner/user.feature --tags @USER-HP-04"
- mvn test -Dkarate.options="classpath:userRunner/user.feature --tags @USER-HP-05"

- mvn test -Dkarate.options="classpath:userRunner/user.feature --tags @USER-UHP-01"
