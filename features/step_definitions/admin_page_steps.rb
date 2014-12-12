### UTILITY METHODS ###
def create_admin_user
  admin_user = FactoryGirl.create(:user_admin_role)
end

def login
  fill_in 'email', with: 'email1@example.com'
  fill_in 'password', with: 'password'
  page.find('#login-submit').click
end

### GIVEN | WHEN | THEN ###
Given(/^I'm a guest user$/) do
  # Clear all cookies 
  page.driver.browser.reset
end

When(/^I visit to \/admin path$/) do
  visit admin_root_path
end

Then(/^I should be redirected to \/admin\/login$/) do
  expect(current_path).to eq(admin_login_path)
end

Given(/^I exist as a admin user$/) do 
  create_admin_user
end

Given(/^I'm not logged in$/) do
  visit admin_login_path
end

When(/^I login with the valid credentials$/) do
  login
end

Then(/^I should be logged in as admin user$/) do
  #page.driver.network_traffic.each do |request|
    #request.response_parts.uniq(&:url).each do |response|
      #puts "\n Responce URL #{response.url}: \n Status #{response.status}"
    #end
  #end
  #puts page.driver.cookies
  expect(current_path).to eq(admin_root_path)
end
