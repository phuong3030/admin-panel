describe Admin::User, :type => :model do
  it { should respond_to(:role_array) }
  it { should respond_to(:role?) }
  it { should respond_to(:add_role) }
  it { should respond_to(:remove_role) }
end
