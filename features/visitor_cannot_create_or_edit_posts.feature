Feature: Visitor cannot create or edit posts

  Scenario: ULR hacking create
    Given I am a visitor
    When I visit the new post path
    Then I see the homepage

  Scenario: ULR hacking edit
    Given I am a visitor
    And a post exists
    When I visit the edit post path
    Then I see the homepage
