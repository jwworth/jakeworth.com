Feature: Developer logs in

  Scenario: With valid credentials
    Given a developer exists
    And I go to the login link
    When I enter valid credentials into the form
    Then I am logged in

  Scenario: With invalid credentials
    Given a developer exists
    And I go to the login link
    When I enter invalid credentials into the form
    Then I am not logged in
