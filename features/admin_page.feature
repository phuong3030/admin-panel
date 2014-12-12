Feature: Admin Page
  Admin area page

  Scenario: Redirect to /admin/login path if not logged in
    Given I'm a guest user
    When I visit to /admin path
    Then I should be redirected to /admin/login

  Scenario: User login successful
    Given I exist as a admin user 
    And I'm not logged in
    When I login with the valid credentials
    Then I should be logged in as admin user
