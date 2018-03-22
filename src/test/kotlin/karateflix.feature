Feature: create data for tests needs

  Background:
    * url baseUrl

  Scenario: add actors to several movies

    #La Furie Du Dragon

    Given path 'movies'
    And request { title: 'La Furie Du Dragon' }
    When method post
    Then status 201

    * def movieId = response.id

    Given path 'movies', movieId, 'actors'
    And request { firstName: 'Bruce', lastName: 'Lee' }
    When method post
    Then status 200

    Given path 'movies', movieId, 'actors'
    And request { firstName: 'Nora', lastName: 'Miao' }
    When method post
    Then status 200

    Given path 'movies', movieId, 'actors'
    And request { firstName: 'Chuck', lastName: 'Norris' }
    When method post
    Then status 200

    # Ip Man

    Given path 'movies'
    And request { title: 'Ip Man' }
    When method post
    Then status 201

    * def movieId = response.id

    Given path 'movies', movieId, 'actors'
    And request { firstName: 'Donnie', lastName: 'Yen' }
    When method post
    Then status 200

    Given path 'movies', movieId, 'actors'
    And request { firstName: 'Simon', lastName: 'Yam' }
    When method post
    Then status 200

    Given path 'movies', movieId, 'actors'
    And request { firstName: 'Siu-Wong', lastName: 'Fan' }
    When method post
    Then status 200

    Given path 'movies', movieId, 'actors'
    And request { firstName: 'Ka Tung', lastName: 'Lam' }
    When method post
    Then status 200

    # Karate Cop

    Given path 'movies'
    And request { title: 'Karate Cop' }
    When method post
    Then status 201

    * def movieId = response.id

    Given path 'movies', movieId, 'actors'
    And request { firstName: 'Ron', lastName: 'Marchini' }
    When method post
    Then status 200

    Given path 'movies', movieId, 'actors'
    And request { firstName: 'Carrie', lastName: 'Chambers' }
    When method post
    Then status 200

    Given path 'movies', movieId, 'actors'
    And request { firstName: 'Dana', lastName: 'Bentley' }
    When method post
    Then status 200

    # Kickboxer

    Given path 'movies'
    And request { title: 'Kickboxer' }
    When method post
    Then status 201

    * def movieId = response.id

    Given path 'movies', movieId, 'actors'
    And request { firstName: 'Jean-Claude', lastName: 'Van Damme' }
    When method post
    Then status 200

    Given path 'movies', movieId, 'actors'
    And request { firstName: 'Michel', lastName: 'Qissi' }
    When method post
    Then status 200

    Given path 'movies', movieId, 'actors'
    And request { firstName: 'Denis', lastName: 'Chan' }
    When method post
    Then status 200

    Given path 'movies', movieId, 'actors'
    And request { firstName: 'Denis', lastName: 'Alexio' }
    When method post
    Then status 200

    # Kill Bill

    Given path 'movies'
    And request { title: 'Kill Bill' }
    When method post
    Then status 201

    * def movieId = response.id

    Given path 'movies', movieId, 'actors'
    And request { firstName: 'Uma', lastName: 'Thurman' }
    When method post
    Then status 200

    Given path 'movies', movieId, 'actors'
    And request { firstName: 'Lucy', lastName: 'Liu' }
    When method post
    Then status 200

    Given path 'movies', movieId, 'actors'
    And request { firstName: 'Michael', lastName: 'Madsen' }
    When method post
    Then status 200

    Given path 'movies', movieId, 'actors'
    And request { firstName: 'Daryl', lastName: 'Hannah' }
    When method post
    Then status 200

