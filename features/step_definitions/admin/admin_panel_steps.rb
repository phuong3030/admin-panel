Given(/^I'm logged in as admin user$/) do
  create_admin_user
  visit admin_login_path
  login(@admin_user)
end

When(/^I click to "(.*?)" button$/) do |button_class|
  page.find(button_class).click
end

Then(/^I should see left sidebar change to medium size$/) do
  page.should have_css('.left-sidebar-medium')
end

Then(/^I should see top mega list collapsed$/) do
  page.should have_css('.mega-menu-wrapper.hidden.slide')
end

Then(/^I should see left sidebar change to small size$/) do
  pending
  page.should have_css('.left-sidebar-small')
end

Then(/^I shouldn't see left sidebar$/) do
  pending
  page.should have_css('.left-sidebar-hide')
end

Then(/^I shouldn't see top header$/) do
  pending
  page.should have_css('.header-hide')
end
