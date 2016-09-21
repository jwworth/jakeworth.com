Feature: Developer creates speaking engagement

  Scenario: With valid information
    Given I am a signed in developer
    And I click create speaking_engagement
    Then I see the speaking_engagement create page

  Scenario: With URL hacking
    Given I am a visitor
    And I try to visit the new speaking_engagement path
    Then I see the homepage
