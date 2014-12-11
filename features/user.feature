Feature: User
  Test cucumber guard spork

  Scenario: User exist
    Given I am user
    When I go to home page
    And I click to login button
    Then I logged in
