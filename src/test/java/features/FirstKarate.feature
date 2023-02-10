Feature: Welcome to Karate

  Scenario: How to print
    Given print "Hello World"
  When print "another print"
  Then print "more print"


  Scenario: more printing
    * print "B-27", "is learning Karate Framework"
    # ---> concat two strings and adding +1 white space
  * print 2+2
    # ---> this one is doing arithmetic operation

  @wip
  Scenario: variable
    * def name = 'Mike'
    # single or double quotation does not matter
    * print 'My name is'+name
    * def age = 20
    * print name, "is", age, "years old"


    Scenario: json variable
      * def student = {'name' : 'Oscar', 'owes-tuition': false}
      * print student
      * print student.name
      * print student.owes-tuition


    Scenario: json variable second way
      * def employee =
      """
      {
      "firstName" : "Steven",
      "lastName" : "King",
      "salary" : 3000
      }
      """
    * print employee.lastName
    * print employee.salary


    Scenario:  array json objects
      * def spartans =
      """
     [
      {
    "id": 103,
    "name": "Sergei",
    "gender": "Male",
    "phone": 12345667890
  },
  {
    "id": 104,
    "name": "issaa",
    "gender": "Male",
    "phone": 9293331111
  }
  ]
      """
  * print spartans
  * print spartans[0].name
  * print spartans[1].phone