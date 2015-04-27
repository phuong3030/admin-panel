require 'rails_helper'

describe API::V1::User do
  context 'as admin user' do 
    let!(:user) { FactoryGirl.create(:user) }
    let!(:group) { FactoryGirl.create(:admin_group) }

    before :each do 
      group.users << user
      stub_authenticate!(user)
    end

    it 'get user information' do 
      get '/api/v1/user/info'

      expect(response.status).to eq(200)
      expect(response.body).to eq({
        username: user.username,
        email: user.email,
        fullname: user.fullname
      }.to_json)
    end

    it 'get user navbar' do
      root = FactoryGirl.create(:sidebar, name: 'root')
      dashboard = FactoryGirl.create(:sidebar, name: 'dashboard', parent: root)
      navbar1 = FactoryGirl.create(:sidebar, name: 'dashboard', parent: dashboard)

      group.roles.first.sidebars << [dashboard, navbar1]

      get '/api/v1/user/ui?type=sidebars'

      expect(response.status).to eq(200)
      expect(response.body).to eq(group.get_func_by_role('sidebars').to_json)
    end

    it 'get user notification with quantity' do 
    end

    it 'get user dashboard info' do
    end
  end
end
