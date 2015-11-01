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

  Scenario: With valid credentials
    Given I am a signed in developer
    And I go to the login link
    Then I see the homepage

  Scenario: With a button
    Given a developer exists
    And I visit the homepage
    And I click "Login"
    When I enter valid credentials into the form
    Then I see the homepage
