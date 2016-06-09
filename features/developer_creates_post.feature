Feature: Developer creates post

  Scenario: With valid information
    Given I am a signed in developer
    And I click create post
    Then I see the post create page
    When I enter valid information into that form
    And I click "Submit"
    Then I see my post

  Scenario: With favorite preference
    Given I am a signed in developer
    And I click create post
    Then I see the post create page
    When I enter valid information into that form
    And I check "Favorite"
    And I click "Submit"
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

  @javascript
  Scenario: With post preview
    Given I am a signed in developer
    And I click create post
    Then I see the post create page
    When I enter content into that form
    Then I see a live preview

  @javascript
  Scenario: With post preview and a filled-out slug
    Given I am a signed in developer
    And I click create post
    Then I see the post create page
    When I enter content into that form
    And I enter a slug "my-special-slug"
    Then I see a live preview with "my-special-slug" as the slug
    And I enter a slug ""
    Then I see a live preview with "awesome-title" as the slug
