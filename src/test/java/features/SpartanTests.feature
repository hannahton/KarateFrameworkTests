Feature: Testing Different Spartans API End Points


  Background: Define Global Variable
    * def spartanUrl = 'http://3.85.201.5:8000'
@smoke
  Scenario: Get all spartans and verify status code
    Given url spartanUrl
    * path "api/spartans"
    And path 103
    And header Accept = 'application/JSON'
    When method GET
    Then status 200

    * print response


  Scenario: Get  spartans with query param and verify status code
    Given url spartanUrl
    And path "api/spartans/search"
    And param nameContains = 'J'
    And param gender = 'Female'
    And header Accept = 'application/JSON'
    When method GET
    Then status 200
    * print response

    # verify each content has gender = Female
  Then match each response.content[*].gender == 'Female'
    # verify each phone number is in number format
  Then match each response.content[*].phone == '#number'


 Scenario:  POST a spartan object created randomly by a JAVA file
# point that file using JAVA.Type syntax and assign it to a variable

  * def SDG = Java.type('utilities.SpartanDataGenerator')
  * def newSpartan = SDG.createSpartan()
    * print newSpartan
    Given url spartanUrl
    And path '/api/spartans'
    And header Accept = 'application/JSON'
    And header Content-Type = 'application/JSON'
    And request newSpartan
    When method POST
    Then status 201
    And print response

  @wip
  Scenario: POST a spartan object created randomly by a JAVA file
      # point that file with Java.type syntax and assign it to a variable
    * def SDG = Java.type('utilities.SpartanDataGenerator')
    * def newSpartan = SDG.createSpartan()
    # even though object is created as a MAP object, Karate Framework do the serialization for you
    Given url spartanUrl
    And path '/api/spartans'
    And header Accept = 'application/json'
    And header Content-Type = 'application/json'
    And request newSpartan
    When method POST
    Then status 201
    And print response
    And match response.success == 'A Spartan is Born!'
    And match response.data.name == newSpartan.name



  Scenario: Delete the Spartan after we post the spartan
       # point that file with Java.type syntax and assign it to a variable
    * def SDG = Java.type('utilities.SpartanDataGenerator')
    * def newSpartan = SDG.createSpartan()
    # even though object is created as a MAP object, Karate Framework do the serialization for you
    Given url spartanUrl
    And path '/api/spartans'
    And header Accept = 'application/json'
    And header Content-Type = 'application/json'
    And request newSpartan
    When method POST
    Then status 201
    And def idForDeleting = response.data.id
    Given url spartanUrl
    And path '/api/spartans',idForDeleting
    When method DELETE
    Then status 204

   # optional task: do API testing with HR API end points, path and query parameter GET requests and verify response







