Feature: Developer views post

  Scenario: Developer views post
    Given I am a signed in developer
    And posts exist
    Given I visit the homepage
    When I click the newest post
    Then I see the page for that post
    And I see an edit button
