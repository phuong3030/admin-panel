Admin::User.create! do |user|
  user.email      = 'admin@example.com'
  user.username   = 'Admin'
  user.password   = 'password'
  user.roles << Admin::Role.create(:name => 'admin')
end

ActiveRecord::Base.transaction do
  root = Admin::Function.create(:url => '/', :name => 'home', :display => true)

  dashboard = root.children.create(:url => '/dashboard', :name => 'Dashboard', :display => true, :icon => 'dashboard')
  parent1 = root.children.create(:url => '/parent1', :name => 'Parent1', :display => true, :icon => 'dashboard')
  child1 = parent1.children.create(:url => '/child1', :name => 'Child1', :display => true, :icon => 'dashboard')
  child2 = parent1.children.create(:url => '/child2', :name => 'Child2', :display => true, :icon => 'dashboard')
  child3 = parent1.children.create(:url => '/child3', :name => 'Child3', :display => true, :icon => 'dashboard')
  grandchild1 = child1.children.create(:url => '/grandchild1', :name => 'Grandchild1', :display => true, :icon => 'dashboard')
  grandchild2 = child1.children.create(:url => '/grandchild2', :name => 'Grandchild2', :display => true, :icon => 'dashboard')
  grandchild3 = child1.children.create(:url => '/grandchild3', :name => 'Grandchild3', :display => true, :icon => 'dashboard')
end
