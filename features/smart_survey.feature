Feature: Smart Survey page

  Scenario: Smart Survey at the end of the application
    Given that I'm an appellant on the home page
    When I complete my appeal and wants to give feedback
    Then this should link me to a smart survey link

  Scenario: Smart Survey at the home page
    Given that I'm on the home page and wants to give feedback
    Then there should be a smart survey link at the top
