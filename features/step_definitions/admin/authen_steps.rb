### UTILITY METHODS ###
def create_admin_user
  admin_user = FactoryGirl.create(:user_admin_role)
end

def login
  fill_in 'email', with: 'email1@example.com'
  fill_in 'password', with: 'password'
  page.find('#login-submit').click
end

### GIVEN ###

Given(/^I exist as a admin user$/) do 
  create_admin_user
end

Given(/^I'm not logged in$/) do
  page.driver.browser.reset
end

Given(/^I'm logged in$/) do
  visit admin_login_path
  login
end

### WHEN ###
When(/^I try to visit to \/admin area$/) do
  visit admin_root_path
end

When(/^I login with the valid credentials$/) do
  visit admin_login_path
  login
end

When(/^I login with a wrong email$/) do
    pending # express the regexp above with the code you wish you had
end

When(/^I login with a wrong password$/) do
    pending # express the regexp above with the code you wish you had
end

When(/^I sign out$/) do
    pending # express the regexp above with the code you wish you had
end

### THEN ###
Then(/^I should be redirected to \/admin\/login$/) do
  expect(current_path).to eq(admin_login_path)
end

Then(/^I should be redirected to admin area$/) do
  #page.driver.network_traffic.each do |request|
    #request.response_parts.uniq(&:url).each do |response|
      #puts "\n Responce URL #{response.url}: \n Status #{response.status}"
    #end
  #end
  #puts page.driver.cookies
  expect(current_path).to eq(admin_root_path)
end

Then(/^I should be redirected to \/admin\/login page$/) do
    pending # express the regexp above with the code you wish you had
end

Then(/^I see an invalid login message$/) do
    pending # express the regexp above with the code you wish you had
end

Then(/^I should see \/admin\/logout page$/) do
    pending # express the regexp above with the code you wish you had
end
