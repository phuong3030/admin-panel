Feature: Authentication 
  In order to get access to admin sections of the site
  A user
  Should be able to sign in and sign out

  Scenario: Redirect to /admin/login path if not logged in
    Given I'm not logged in
    When I try to visit to /admin area
    Then I should be redirected to /admin/login

  Scenario: User logins successful
    Given I exist as a admin user 
    And I'm not logged in
    When I login with the valid credentials
    Then I should be redirected to admin area

  Scenario: User enters wrong email
    Given I exist as a admin user
    And I'm not logged in
    When I login with a wrong email
    Then I should be redirected to /admin/login page
    And I see an invalid login message

  Scenario: User enters wrong password
    Given I exist as a admin user
    And I'm not logged in
    When I login with a wrong password
    Then I should be redirected to /admin/login page
    And I see an invalid login message

  Scenario: User signs out
    Given I exist as a admin user 
    And I'm logged in
    When I sign out
    Then I should see /admin/logout page
