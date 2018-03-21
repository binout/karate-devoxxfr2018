Feature: retrieve all actors

  Background:
    * url 'http://localhost:8080'
    * def data = call read('classpath:imdb.feature')

  Scenario:
    Given path 'actors'
    When method get
    Then status 200
    And assert response.length > 0
    And match response contains { firstName: 'Chuck', lastName: 'Norris' }
