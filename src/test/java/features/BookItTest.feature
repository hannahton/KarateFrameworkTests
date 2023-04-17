Feature: BookIt feature Tests

  Background:
    * def baseUrl = 'https://cybertek-reservation-api-qa3.herokuapp.com/'
    # call another feature file and use response data

  * def AuthFeature = call read('classpath:features/BookItAuth.feature')
    * def accessToken = AuthFeature.token
    * def expectedStudent =
    """
{
    "id": 140,
    "firstName": "Ase",
    "lastName": "Norval",
    "role": "student-team-leader"
}
    """
    * print accessToken
    * print AuthFeature.name


    Scenario: Get user info
      Given url baseUrl
   And path 'api/users/me'
   And header authorization = 'Bearer '+accessToken
   When method GET
   Then match response == expectedStudent

  @wip
  Scenario: Get campuses info and verify info
    Given url baseUrl
    And path 'api/campuses'
    And header authorization = 'Bearer '+accessToken
    When method GET
    # when we are reading from a regular file we don't need "call" function
    And def expectedCampuses = read('classpath:data/campuses.json')
    Then match response == expectedCampuses
