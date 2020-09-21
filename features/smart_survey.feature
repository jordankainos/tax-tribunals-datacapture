Feature: Smart Survey page

  Scenario: Smart Survey at the home page
    Given that I'm on the home page and wants to give feedback
    Then there should be a smart survey link at the top of the home page

  Scenario: Smart Survey at the decision page
    Given that I'm on the taxpayer details page and wants to give feedback
    Then there should be a smart survey link at the top of the taxpayer details page

  Scenario: Smart Survey at the
    Given that I'm on the dispute type page and wants to give feedback
    Then there should be a smart survey link at the top of the dispute type page