Feature: Admin header and sidebar function
  In order to get right client effect in admin area
  A admin user
  Should be able to use items effect in header and sidebar

  @dev
  Scenario: Resize to medium left sidebar effect
    Given I'm logged in as admin user
    When I click to ".nav-medium-button" button
    Then I should see left sidebar change to medium size
    And I should see top mega list collapsed

  Scenario: Resize small left sidebar effect 
    Given I'm logged in as admin user
    When I click to ".nav-small-button" button
    Then I should see left sidebar change to small size 
    And I should see top mega list collapsed

  Scenario: Hide left sidebar
    Given I'm logged in as admin user
    When I click to ".remove-sidebar" button
    Then I shouldn't see left sidebar

  Scenario: Hide top header
    Given I'm logged in as admin user
    When I click to ".remove-header" button
    Then I shouldn't see top header
  
  Scenario: Hide left sidebar and header
    Given I'm logged in as admin user
    When I click to ".remove-all" button
    Then I shouldn't see left sidebar
    And I shouldn't see top header
