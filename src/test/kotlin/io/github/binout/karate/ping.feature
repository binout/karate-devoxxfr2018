Feature: demo reading files and using in a test

  Background:
    * url 'http://localhost:8080'

Scenario: ping returns 200 with pong

Given path 'ping'
When method get
Then status 200
And match response == 'pong'