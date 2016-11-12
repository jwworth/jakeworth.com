Feature: Developer creates speaking engagement

  Scenario: With valid information
    Given I am a signed in developer
    And I click create speaking engagement
    Then I see the speaking engagement create page

  Scenario: With URL hacking
    Given I am a visitor
    And I try to visit the new speaking engagement path
    Then I see the homepage
