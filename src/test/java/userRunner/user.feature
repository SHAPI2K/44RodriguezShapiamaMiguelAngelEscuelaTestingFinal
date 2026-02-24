@regresion @user
Feature: User API - Petstore

  Background:
    * url baseUrl

  @USER-HP-01 @happypath @smoke
  Scenario: Crear usuario OK
    * def username = 'user_' + java.util.UUID.randomUUID()
    * def body = read('classpath:examples/data/user/createUser.json')
    * set body.id = Math.floor(Math.random() * 100000)
    * set body.username = username
    * set body.password = 'pass123'

    Given path 'user'
    And request body
    When method post
    Then status 200

    * def result = { username: username, password: body.password }

  @USER-HP-02 @happypath
  Scenario: Consultar usuario existente
    * def r = call read('classpath:userRunner/user.feature@USER-HP-01')

    Given path 'user', r.username
    When method get
    Then status 200
    And match response.username == r.username

  @USER-HP-03 @happypath
  Scenario: Actualizar usuario existente
    * def r = call read('classpath:userRunner/user.feature@USER-HP-01')
    * def body = read('classpath:examples/data/user/createUser.json')
    * set body.id = Math.floor(Math.random() * 100000)
    * set body.username = r.username
    * set body.firstName = 'Updated'
    * set body.lastName = 'User'

    Given path 'user', r.username
    And request body
    When method put
    Then status 200

  @USER-HP-04 @happypath
  Scenario: Login y Logout OK
    * def r = call read('classpath:userRunner/user.feature@USER-HP-01')

    Given path 'user', 'login'
    And param username = r.username
    And param password = r.password
    When method get
    Then status 200

    Given path 'user', 'logout'
    When method get
    Then status 200

  @USER-HP-05 @happypath
  Scenario: Eliminar usuario existente
    * def r = call read('classpath:userRunner/user.feature@USER-HP-01')

    Given path 'user', r.username
    When method delete
    Then status 200

  @USER-UHP-01 @unhappypath
  Scenario: Consultar usuario inexistente
    Given path 'user', 'no_existe_' + java.util.UUID.randomUUID()
    When method get
    Then status 404