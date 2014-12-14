### UTILITY METHODS ###
def create_admin_user
  admin_user = FactoryGirl.create(:user_admin_role)
end

# Default is valid credentials
def login(user = FactoryGirl.create(:user_admin_role))
  fill_in 'email', with: user.email
  fill_in 'password', with: user.password
  page.find('#login-submit').click
end

### GIVEN ###

Given(/^I exist as a admin user$/) do 
  create_admin_user
end

Given(/^I'm not logged in$/) do
  #page.driver.browser.clear_cookies
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
  pending
  visit admin_login_path
  login({ :email => 'abc@email.com', :password => 'password' })
end

When(/^I login with a wrong password$/) do
  pending
  login({ :email => 'email1@email.com', :password => 'password1' })
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
  #page.driver.network_traffic.each do |request|
    #request.response_parts.uniq(&:url).each do |response|
      #puts "\n Responce URL #{response.url}: \n Status #{response.status}"
    #end
  #end
  #puts page.driver.cookies
  response.should redirect_to(admin_root_path)
end

Then(/^I see an invalid login message$/) do
    pending # express the regexp above with the code you wish you had
end

Then(/^I should see \/admin\/logout page$/) do
  expect(current_path).to eq(admin_logout_path)
end
