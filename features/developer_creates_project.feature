Feature: Developer creates project

  Scenario: With valid information
    Given I am a signed in developer
    And I click create project
    Then I see the project create page
    When I enter valid information into the project form
    Then I see my project

  Scenario: With valid information, not-featured
    Given I am a signed in developer
    And I click create project
    Then I see the project create page
    When I enter valid information into the project form but don't feature it
    Then I do not see my project

  Scenario: With URL hacking
    Given I am a visitor
    And I try to visit the new project path
    Then I see the homepage

  Scenario: With missing information
    Given I am a signed in developer
    And I click create project
    Then I see the project create page
    When I enter invalid information into the project form
    Then I see a message "Title can't be blank"
