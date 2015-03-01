Admin::User.create! do |user|
  user.email      = 'admin@example.com'
  user.username   = 'Admin'
  user.password   = 'password'
  user.roles << Admin::Role.create(:name => 'admin')
end

ActiveRecord::Base.transaction do
  root = Admin::Sidebar.create(:url => '/', :name => 'home', :display => true)

  dashboard = root.children.create(:url => '/dashboard', :name => 'Dashboard', :display => true, :icon => 'dashboard', :role_id => 1, :type => 'Admin::Sidebar')

  parent1 = root.children.create(:url => '/parent1', :name => 'Parent1', :display => true, :icon => 'dashboard', :role_id => 1, :type => 'Admin::Sidebar')
  child1 = parent1.children.create(:url => '/child1', :name => 'Child1', :display => true, :icon => 'dashboard', :role_id => 1, :type => 'Admin::Sidebar')
  child2 = parent1.children.create(:url => '/child2', :name => 'Child2', :display => true, :icon => 'dashboard', :role_id => 1, :type => 'Admin::Sidebar')
  child3 = parent1.children.create(:url => '/child3', :name => 'Child3', :display => true, :icon => 'dashboard', :type => 'Admin::Sidebar')
  grandchild1 = child1.children.create(:url => '/grandchild1', :name => 'Grandchild1', :display => true, :icon => 'dashboard', :role_id => 1, :type => 'Admin::Sidebar')
  grandchild2 = child1.children.create(:url => '/grandchild2', :name => 'Grandchild2', :display => true, :icon => 'dashboard', :role_id => 1, :type => 'Admin::Sidebar')
  grandchild3 = child1.children.create(:url => '/grandchild3', :name => 'Grandchild3', :display => true, :icon => 'dashboard', :role_id => 1, :type => 'Admin::Sidebar')
  
  parent2 = root.children.create(:url => '/parent2', :name => 'Parent2', :display => true, :icon => 'dashboard', :role_id => 1, :type => 'Admin::Sidebar')
  child4 = parent2.children.create(:url => '/child4', :name => 'Child4', :display => true, :icon => 'dashboard', :role_id => 1, :type => 'Admin::Sidebar')
  child5 = parent2.children.create(:url => '/child5', :name => 'Child5', :display => true, :icon => 'dashboard', :role_id => 1, :type => 'Admin::Sidebar')
  child6 = parent2.children.create(:url => '/child6', :name => 'Child6', :display => true, :icon => 'dashboard', :type => 'Admin::Sidebar')
  grandchrld4 = child5.children.create(:url => '/grandchild4', :name => 'Grandchild4', :display => true, :icon => 'dashboard', :role_id => 1, :type => 'Admin::Sidebar')
  grandchild5 = child5.children.create(:url => '/grandchild5', :name => 'Grandchild5', :display => true, :icon => 'dashboard', :role_id => 1, :type => 'Admin::Sidebar')

end
