Feature: Developer edits project

  Scenario: With valid information
    Given I am a signed in developer
    And a project exists
    When I visit the project page
    And I click edit project
    Then I see the edit project page
    When I edit the project
    Then I see my updated project

  Scenario: With URL hacking
    Given I am a visitor
    And a project exists
    When I try to visit the edit project path
    Then I see the homepage

  Scenario: With missing information
    Given I am a signed in developer
    And a project exists
    When I visit the project page
    And I click edit project
    Then I see the edit project page
    When I edit the project with no title
    Then I see a message "Title can't be blank"
