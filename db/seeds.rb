admin_role = Admin::Role.create(:name => 'admin')
moderator_role = Admin::Role.create(:name => 'moderator')

Admin::User.create! do |user|
  user.email      = 'admin@example.com'
  user.username   = 'Admin'
  user.password   = '123123123'
  user.roles << admin_role
end

Admin::User.create! do |u|
  u.email      = 'moderator@example.com'
  u.username   = 'Moderator'
  u.password   = '123123123'
  u.roles << moderator_role
end

ActiveRecord::Base.transaction do
  # Sidebar functions sample
  root = Admin::Sidebar.create(:url => '/', :name => 'home', :display => true)

  dashboard = root.children.create(:url => '/dashboard', :name => 'Dashboard', :display => true, :icon => 'dashboard', :type => 'Admin::Sidebar')

  parent1 = root.children.create(:url => '/parent1', :name => 'Parent1', :display => true, :icon => 'dashboard', :type => 'Admin::Sidebar')
  child1 = parent1.children.create(:url => '/child1', :name => 'Child1', :display => true, :icon => 'dashboard', :type => 'Admin::Sidebar')
  child2 = parent1.children.create(:url => '/child2', :name => 'Child2', :display => true, :icon => 'dashboard', :type => 'Admin::Sidebar')
  child3 = parent1.children.create(:url => '/child3', :name => 'Child3', :display => true, :icon => 'dashboard', :type => 'Admin::Sidebar')
  grandchild1 = child1.children.create(:url => '/grandchild1', :name => 'Grandchild1', :display => true, :icon => 'dashboard', :type => 'Admin::Sidebar')
  grandchild2 = child1.children.create(:url => '/grandchild2', :name => 'Grandchild2', :display => true, :icon => 'dashboard', :type => 'Admin::Sidebar')
  grandchild3 = child1.children.create(:url => '/grandchild3', :name => 'Grandchild3', :display => true, :icon => 'dashboard', :type => 'Admin::Sidebar')

  parent2 = root.children.create(:url => '/parent2', :name => 'Parent2', :display => true, :icon => 'dashboard', :type => 'Admin::Sidebar')
  child4 = parent2.children.create(:url => '/child4', :name => 'Child4', :display => true, :icon => 'dashboard', :type => 'Admin::Sidebar')
  child5 = parent2.children.create(:url => '/child5', :name => 'Child5', :display => true, :icon => 'dashboard', :type => 'Admin::Sidebar')
  child6 = parent2.children.create(:url => '/child6', :name => 'Child6', :display => true, :icon => 'dashboard', :type => 'Admin::Sidebar')
  grandchild4 = child5.children.create(:url => '/grandchild4', :name => 'Grandchild4', :display => true, :icon => 'dashboard', :type => 'Admin::Sidebar')
  grandchild5 = child5.children.create(:url => '/grandchild5', :name => 'Grandchild5', :display => true, :icon => 'dashboard', :type => 'Admin::Sidebar')

  # Add function items to roles
  admin_role.sidebars << [dashboard, parent1, child1, child2, child3, grandchild1, grandchild2, 
                           grandchild3, parent2, child4, child5, child6, grandchild4, grandchild5]
  moderator_role.sidebars << [dashboard, parent1, child1, child2, grandchild1, grandchild2, 
                               parent2, child4, child5, grandchild5]

  admin_role.save!
  moderator_role.save!
end

