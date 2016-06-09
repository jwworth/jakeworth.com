Feature: Visitor views homepage

  Scenario: And sees links and project information
    Given I am a visitor
    When I visit the homepage
    Then I see links
    And I see project information

  Scenario: And sees the header as a link
    Given I am a visitor
    When I visit the homepage
    Then I see the header as a link

  Scenario: And sees the twenty newest posts
    Given I am a visitor
    And 20 posts exist
    When I visit the homepage
    Then I see 20 post titles

  Scenario: And sees favorite posts
    Given I am a visitor
    And a favorite post exists
    When I visit the homepage
    Then I see the favorited post

  Scenario: Visitor sees Atom feed
    Given I am a visitor
    And a post exists
    And I visit the homepage
    When I visit the Atom feed page
    Then I see an Atom feed
