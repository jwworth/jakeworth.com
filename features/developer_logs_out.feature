Feature: Developer logs out

  Scenario: With valid credentials
    Given a developer exists
    And I go to the login link
    When I enter valid credentials into the form
    Then I am logged in
    When I click log out
    Then I am not logged in
    And I see a message "Logged out"

  Scenario: With a button
    Given I am a signed in developer
    And I visit the homepage
    And I click "Logout"
    Then I am not logged in
    And I see a message "Logged out"
