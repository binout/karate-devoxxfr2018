Feature: creates a movie

  Background:
    * url 'http://localhost:8080'

  Scenario: create a movie and retrieve it

    Given path 'movies'
    And request { title: 'Karate Kid' }
    When method post
    Then status 201
    And match header Location contains 'http://localhost:8080/movies'
    And match response contains { id: '#notnull' }

    Given path 'movies', response.id
    When method get
    Then status 200
    And match response contains { id: '#(response.id)', title: 'Karate Kid' }
    And assert response.actors.length == 0