Feature: Visitor views homepage

  Scenario: And sees links and copyright information
    Given I am a visitor
    When I visit the homepage
    Then I see links
    And I see copyright information
    And I see project information

  Scenario: And sees the ten newest posts
    Given I am a visitor
    And 11 posts exist
    When I visit the homepage
    Then I see 10 post titles
