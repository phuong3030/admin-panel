### UTILITY METHODS ###
module AuthUser
  def create_admin_user
    @admin_user = FactoryGirl.create(:user, :admin_role)
  end

  def login(user)
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    page.find('#login-submit').click
  end
end

World(AuthUser)
