Core::User.create! do |user|
  user.email      = 'admin@example.com'
  user.username       = 'Admin'
  user.password   = 'password'
  user.roles << Core::Role.create(:name => 'admin')
end
