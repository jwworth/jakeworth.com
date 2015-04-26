Feature: Visitor views homepage

  Scenario: And sees links and copyright information
    Given I am a visitor
    And I visit the homepage
    Then I see links
    And I see copyright information
    And I see project information
