Feature: Visitor views projects

  Scenario: With appropriate projects shown
    Given I am a visitor
    And a project exists
    And a non-featured project exists
    When I visit the homepage
    And I click "projects"
    Then I see the project
    And I see a footer call to action
    And I see a back link
    And I do not see the non-featured project
