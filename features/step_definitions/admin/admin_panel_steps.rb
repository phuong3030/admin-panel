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
  find('.remove-sidebar').click unless state.empty?
end

Given(/^Header is "(.*?)"$/) do |state1|
  find('.remove-header').click unless state1.empty?
end

When(/^I click to "(.*?)" button$/) do |button|
  find(button).click
end

Then(/^I should see "(.*?)" sidebar class$/) do |sidebar_class|
  page.should have_css(".sidebar#{sidebar_class}")
end

Then(/^I should see "(.*?)" header class$/) do |header_class|
  page.should have_css("header#{header_class}")
end
