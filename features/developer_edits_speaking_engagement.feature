Feature: Developer edits speaking engagement

  Scenario: With valid information
    Given I am a signed in developer
    And a speaking engagement exists with title "Old Title"
    When I visit the about page
    And I click edit speaking engagement
    Then I see the edit speaking enagement page
    When I edit the speaking engagement
    Then I see my updated speaking engagement

  Scenario: With URL hacking
    Given I am a visitor
    And a speaking engagement exists
    When I try to visit the edit speaking engagement path
    Then I see the homepage
