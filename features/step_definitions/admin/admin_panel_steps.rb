Given(/^I'm logged in as admin user$/) do
  create_admin_user
  visit admin_login_path
  login(@admin_user)
end

Given(/^Left sidebar is on "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^I click to "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should find "(.*?)" left sidebar class$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should find "(.*?)" top mega list class$/) do |arg1|
  pending # express the regexp above with the code you wish you had
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
