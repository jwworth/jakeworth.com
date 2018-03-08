Feature: Visitor views post

  Scenario: Visitor views post
    Given I am a visitor
    And posts exist
    Given I visit the homepage
    When I click the newest post
    Then I see the page for that post

  Scenario: Visitor views old post
    Given I am a visitor
    And posts exist from 2 years ago
    Given I visit the homepage
    When I click the newest post
    Then I see the page for that post
    And I see a deprecation warning

  Scenario: Visitor views a deleted post
    Given I am a visitor
    Given I visit the homepage
    And I visit "/technology-what-is-it-good-for"
    Then I see the homepage
