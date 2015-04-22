Feature: Developer logs in

  Scenario: With valid credentials
    Given a developer exists
    And I go to the login link
    When I enter valid credentials into the form
    Then I am logged in
