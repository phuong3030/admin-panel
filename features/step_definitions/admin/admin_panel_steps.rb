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
Given(/^Collapse items: "(.*?)"$/) do |state|
  find('.remove-header-button').click if state == 'header'
  find('.remove-sidebar-button').click if state == 'sidebar'
  find('.fullscreen-button').click if state == 'fullscreen'
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

##### 
When(/^I go to "(.*?)"$/) do |page|
  visit admin_root_path(:anchor => page)
end

Then(/^I should see "(.*?)"$/) do |heading|
  page.should have_content(heading)
end
