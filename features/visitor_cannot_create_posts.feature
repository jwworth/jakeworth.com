Feature: Visitor cannot create posts

  Scenario: With URL hacking
    Given I am a visitor
    When I visit the new post path
    Then I see the homepage
    Then I see a message "Access denied"
