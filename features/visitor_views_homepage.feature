Feature: Visitor views homepage

  Scenario: And sees links and copyright information
    Given I am a visitor
    When I visit the homepage
    Then I see links
    And I see copyright information
    And I see project information

  @javascript
  Scenario: And sees the ten newest posts
    Given I am a visitor
    And 11 posts exist
    When I visit the homepage
    Then I see 10 post titles

  @javascript
  Scenario: And can load older posts
    Given I am a visitor
    And 11 posts exist
    When I visit the homepage
    Then I see 10 post titles
    When I click "More"
    Then I see 11 post titles
    And I do not see a link to "More"
