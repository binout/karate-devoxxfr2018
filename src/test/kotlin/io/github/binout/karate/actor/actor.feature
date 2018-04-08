Feature: retrieve all actors

  Background:
    * url baseUrl
    * call read('classpath:karateflix.feature')

  Scenario: get on actors

    Given path 'actors'
    When method get
    Then status 200
    And assert response.length > 0
    And match response contains { firstName: 'Chuck', lastName: 'Norris' }
