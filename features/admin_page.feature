Feature: Admin Page
  Admin area page

  Scenario: Redirect to /admin/login path if not logged in
    Given I'm not logged in user
    When I visit to /admin path
    Then I should be redirected to /admin/login

  Scenario: User login successful
    Given I'm a guest user
    When I fill the login form with the valid admin user
    Then I should be logged in as admin user
