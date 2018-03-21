Feature: creates a movie

  Background:
    * url 'http://localhost:8080'

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

  Scenario: add an actor to a movie

    Given path 'movies'
    And request { title: 'Karate Tiger' }
    When method post
    Then status 201

    * def movieId = response.id

    Given path 'movies', movieId
    When method get
    Then status 200
    And match response contains { title: 'Karate Tiger' }

    Given path 'movies', movieId, 'actors'
    And request { firstName: 'JC', lastName: 'VD' }
    When method post
    Then status 200

    Given path 'movies', movieId
    When method get
    Then status 200
    And match response.actors contains { firstName: 'JC', lastName: 'VD' }