Given(/^I'm not logged in user$/) do
  # Clear all cookies 
  page.driver.browser.reset
end

When(/^I visit to \/admin path$/) do
  visit admin_root_path
end

Then(/^I should be redirected to \/admin\/login$/) do
  expect(current_path).to eq(admin_login_path)
end

Given(/^I'm a exist user$/) do
    # Clear all cookies 
  page.driver.browser.reset
end

When(/^I fill the login form with the valid admin user$/) do
  visit admin_login_path
  fill_in 'email', with: 'admin@example.com'
  fill_in 'password', with: 'password'
  page.find('#login-submit').click
end

Then(/^I should be logged in as admin user$/) do
  page.driver.network_traffic.each do |request|
    request.response_parts.uniq(&:url).each do |response|
      puts "\n Responce URL #{response.url}: \n Status #{response.status}"
    end
  end
end

