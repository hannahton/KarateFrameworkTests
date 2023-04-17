Feature: Data Driven Tests
@wip
  Scenario Outline: GET tokens for more than one user
    Given url 'https://cybertek-reservation-api-qa3.herokuapp.com/'
    And path 'sign'
    And header Accept = 'Application/JSON'
    And param email = '<email>'
    And param password = '<password>'
    When method GET
    And def token = response.accessToken

    * print token

    Examples:
    |email| password|
    | sbirdbj@fc2.com             | asenorval          |
    | htwinbrowb4@blogspot.com    | kanyabang          |
    | dfrederickb5@yellowbook.com | engraciahuc        |
    | apainb6@google.co.jp        | rosettalightollers |
    | fbawmeb7@studiopress.com    | sherilyngohn       |


  Scenario Outline: GET tokens for more than one user with CSV file
    Given url 'https://cybertek-reservation-api-qa3.herokuapp.com/'
    And path 'sign'
    And header Accept = 'Application/JSON'
    And param email = '<email>'
    And param password = '<password>'
    When method GET
    And def token = response.accessToken

    * print token

    Examples:
    |read(data/users.csv)|
