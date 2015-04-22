Feature: Developer edits post

  Scenario: With valid information
    Given I am a signed in developer
    And a post exists
    When I visit the homepage
    And I click edit post
    Then I see the post edit page
    When I enter new valid information into that form
    Then I see my edited post
