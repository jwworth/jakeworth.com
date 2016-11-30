Feature: Developer views projects

  Scenario: With valid information
    Given I am a signed in developer
    And 3 projects exists
    When I visit the projects page

  Scenario: Via a subheader link
    Given I am a visitor
    Given I am a signed in developer
    And 3 projects exists
    When I click "about"
    And I click "Projects"
    Then I see 3 projects

  Scenario: With URL hacking
    Given I am a visitor
    And a project exists
    When I try to visit the edit project path
    Then I see the homepage
