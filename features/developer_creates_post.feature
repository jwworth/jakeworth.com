Feature: Developer creates post

  Scenario: With valid information
    Given I am a signed in developer
    And I click create post
    Then I see the post create page
    When I enter valid information into that form
    Then I see my post
