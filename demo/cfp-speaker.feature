Feature: demo with API of cfp.devoxx.fr

  Background:
    * url 'http://cfp.devoxx.fr/api/conferences/DevoxxFR2018'

  Scenario: should return a Lectra speaker

    Given path 'speakers', '06526149853bd11db7f30a2391594deefbacd805'
    When method get
    Then status 200
    And match response contains { company: Lectra }
