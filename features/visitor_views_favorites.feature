Feature: Visitor views favorites

  Scenario: Visitor views favorites
    Given I am a visitor
    And I visit the homepage
    And 3 posts exist
    And 3 favorited posts exist
    And I click "favorite"
    Then I see the 3 favorited posts
