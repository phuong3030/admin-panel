### GIVEN ###
Given(/^I exist as an admin user$/) do 
  create_admin_user
end

Given(/^I'm not logged in$/) do
  #page.driver.browser.clear_cookies
end

Given(/^I'm logged in$/) do
  visit admin_login_path
  login(@admin_user)
end

### WHEN ###
When(/^I try to visit to \/admin area$/) do
  visit admin_root_path
end

When(/^I login with the valid credentials$/) do
  visit admin_login_path
  login(@admin_user)
end

When(/^I login with a wrong email$/) do
  visit admin_login_path
  @admin_user.email = 'wrongemail@email.com'
  login(@admin_user)
end

When(/^I login with a wrong password$/) do
  visit admin_login_path
  login(
    Core::User.new(
      :email => @admin_user.email,
      :password => 'wrongpass'
    )
  )
end

When(/^I sign out$/) do
  page.has_css?('.navbar-bottom-widget a')
  find('.navbar-bottom-widget a').click
end

### THEN ###
Then(/^I should be redirected to \/admin\/login page$/) do
  sleep 2
  expect(current_path).to eq(admin_login_path)
end

Then(/^I should be redirected to admin area$/) do
  expect(current_path).to eq(admin_root_path)
end

Then(/^I see my info in header bar$/) do
  page.should have_content(@admin_user.username)
end

Then(/^I see an invalid login message$/) do
  expect(current_path).to eq(admin_login_path)
  page.should have_content('Oh snap! Change a few things up and try submitting again.')
end

Then(/^I should see \/admin\/logout page$/) do
  sleep 1
  expect(current_path).to eq(admin_logout_path)
end
