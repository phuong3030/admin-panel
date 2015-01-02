Given(/^I'm logged in as admin user$/) do
  create_admin_user
  visit admin_login_path
  login(@admin_user)
end

Given(/^Sidebar is on "(.*?)"$/) do |state|
  find(".nav-#{state}-button").click unless state == 'normal'
end

When(/^I click to "(.*?)"$/) do |button|
  find(button).click
end

Then(/^I should find "(.*?)" sidebar class$/) do |sidebar_class|
  page.should have_css("#left-sidebar-wrapper#{sidebar_class}")
end

Then(/^I should find "(.*?)" top mega list class$/) do |mega_class|
  page.should have_css(".menu-container#{mega_class}")
end

#####
Given(/^Sidebar is "(.*?)"$/) do |state|
  pending # express the regexp above with the code you wish you
end

Given(/^Header is "(.*?)"$/) do |state1|
  pending # express the regexp above with the code you wish you
end

When(/^I click to "(.*?)" button$/) do |button|
  pending # express the regexp above with the code you wish you
end

Then(/^I should see "(.*?)" sidebar class$/) do |sidebar_class|
  pending # express the regexp above with the code you wish you
end

Then(/^I should see "(.*?)" header class$/) do |header_class|
  pending # express the regexp above with the code you wish you
end
