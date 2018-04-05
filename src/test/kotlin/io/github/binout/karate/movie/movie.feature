Feature: working with movies

  Background:
    * url baseUrl

  Scenario: create a movie and retrieve it

    Given path 'movies'
    And request { title: 'Karate Kid' }
    When method post
    Then status 201
    And match response contains { id: '#notnull' }
    And match header Location == 'http://localhost:8080/movies/' + response.id

    Given path 'movies', response.id
    When method get
    Then status 200
    And match response contains { title: 'Karate Kid' }

    Given path 'movies', '42'
    When method get
    Then status 404