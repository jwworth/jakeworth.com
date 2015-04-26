Feature: Developer creates post

  Scenario: With valid information
    Given I am a signed in developer
    And I click create post
    Then I see the post create page
    When I enter valid information into that form
    Then I see my post

  Scenario: With missing information
    Given I am a signed in developer
    And I click create post
    Then I see the post create page
    When I enter invalid information into that form
    Then I see a message "Body can't be blank"

  Scenario: With markdown
    Given I am a signed in developer
    And I click create post
    Then I see the post create page
    When I enter markdown into that form
    Then I see my markdown post
