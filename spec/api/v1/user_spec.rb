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

    context 'get user notifications' do
      it 'with valid quantity' do 
        get '/api/v1/user/notifications?quantity=5'

        expect(response.body).to eq(user.mailbox.notifications.first(5).to_json)
      end

      it 'with invalid quantity' do

        get '/api/v1/user/notifications?quantity=-1'

        expect(response.body).to eq({
          status: 400,
          message: 'Invalid params',
          errors: ['Wrong quantity param']
        }.to_json)
      end

      it 'by valid page' do
        get '/api/v1/user/notifications?page=1'

        expect(response.body).to eq(user.mailbox.notifications.page(1).per(25).to_json)
      end

      it 'by invalid page' do
        get '/api/v1/user/notifications?page=-1'

        expect(response.body).to eq({
          status: 400,
          message: 'Invalid params',
          errors: ['Wrong page param']
        }.to_json)
      end
      it 'by invalid page' do
        get '/api/v1/user/notifications?page=-1'

        expect(response.body).to eq({
          status: 400,
          message: 'Invalid params',
          errors: ['Wrong page param']
        }.to_json)
      end
    end

    it 'get user dashboard info' do
      get '/api/v1/user/dashboard-info'

      expect(response.body).to eq({
        username: user.username,
        email: user.email,
        fullname: user.fullname,
        navbars: group.get_func_by_role('sidebars'),
        notifications: user.mailbox.notifications.first(5)
      }.to_json)
    end
  end
end
