Feature: Visitor views projects

  Scenario:
    Given I am a visitor
    And a project exists
    And a non-featured project exists
    When I visit the homepage
    And I click "Projects"
    Then I see the project
    And I do not see the non-featured project
