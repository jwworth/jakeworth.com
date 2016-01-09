Feature: Visitor views post

  Scenario: Visitor views post
    Given I am a visitor
    And posts exist
    Given I visit the homepage
    When I click the newest post
    Then I see the page for that post
    And I see a footer call to action
