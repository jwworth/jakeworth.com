Feature: Visitor views homepage

  Scenario: And sees links and copyright information
    Given I am a visitor
    When I visit the homepage
    Then I see links
    And I see project information

  Scenario: And sees the header as a link
    Given I am a visitor
    When I visit the homepage
    Then I see the header as a link

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

  @javascript
  Scenario: And can hide older posts
    Given I am a visitor
    And 11 posts exist
    When I visit the homepage
    Then I see 10 post titles
    And I see a link to "More"
    And I do not see a link to "Less"
    When I click "More"
    Then I see 11 post titles
    And I do not see a link to "More"
    And I see a link to "Less"
    When I click "Less"
    Then I see 10 post titles
    And I do not see a link to "Less"
    And I see a link to "More"

  Scenario: Visitor sees Atom feed
    Given I am a visitor
    And a post exists
    And I visit the homepage
    When I visit the Atom feed page
    Then I see an Atom feed
