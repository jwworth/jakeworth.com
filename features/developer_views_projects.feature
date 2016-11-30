Feature: Developer views projects

  Scenario: With valid information
    Given I am a signed in developer
    And 3 projects exists
    When I visit the projects page
    Then I see 3 projects

  Scenario: With URL hacking
    Given I am a visitor
    And a project exists
    When I try to visit the edit project path
    Then I see the homepage
