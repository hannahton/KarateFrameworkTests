Feature: GET token for a user


  Scenario: GET token
    Given url 'https://cybertek-reservation-api-qa3.herokuapp.com/'
    And path 'sign'
    And header Accept = 'Application/JSON'
    And param email = 'sbirdbj@fc2.com'
    And param password = 'asenorval'
    When method GET
    And def token = response.accessToken
    And def name = 'Hannah'
    * print response

    #Karate framework can call variables of another feature file