@regresion @store
Feature: Store API - Petstore

  Background:
    * url baseUrl

  @STORE-HP-01 @happypath @smoke
  Scenario: Consultar inventario
    Given path 'store', 'inventory'
    When method get
    Then status 200
    And match response != {}

  @STORE-HP-02 @happypath
  Scenario: Crear orden correctamente
    * def orderId = Math.floor(Math.random() * 100000)
    * def body = read('classpath:examples/data/store/createOrder.json')
    * set body.id = orderId
    * set body.petId = 1

    Given path 'store', 'order'
    And request body
    When method post
    Then status 200
    And match response.id == orderId

  @STORE-HP-03 @happypath
  Scenario: Consultar orden por ID existente
    * def orderId = Math.floor(Math.random() * 100000)
    * def body = read('classpath:examples/data/store/createOrder.json')
    * set body.id = orderId
    * set body.petId = 1

  # Crea la orden y acepta de 200 o 405
    Given path 'store', 'order'
    And request body
    When method post
    Then assert responseStatus == 200 || responseStatus == 405

  # Consultar la orden
    Given path 'store', 'order', orderId
    When method get
    Then status 200
    And match response.id == orderId

  @STORE-HP-04 @happypath
  Scenario: Eliminar orden existente
    * def orderId = Math.floor(Math.random() * 100000)
    * def body = read('classpath:examples/data/store/createOrder.json')
    * set body.id = orderId
    * set body.petId = 1

  # Crear la orden
    Given path 'store', 'order'
    And request body
    When method post
    Then assert responseStatus == 200 || responseStatus == 405

  # Eliminar la orden
    Given path 'store', 'order', orderId
    When method delete
    Then status 200

    Given path 'store', 'order', orderId
    When method get
    Then status 404

  @STORE-UHP-01 @unhappypath
  Scenario: Consultar orden inexistente
    Given path 'store', 'order', 999999999
    When method get
    Then status 404

  @STORE-UHP-02 @unhappypath
  Scenario: Eliminar orden inexistente
    Given path 'store', 'order', 999999999
    When method delete
    Then status 404