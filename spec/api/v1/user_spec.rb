require 'rails_helper'

describe API::V1::User, :type => :request do
  context 'as admin user' do 
    let!(:admin_user) { FactoryGirl.create(:user_admin_role) }

    before :each do 
      stub_authenticate!(admin_user)
    end

    it 'get my information' do 
      get '/api/v1/user/info'
      expect(response.status).to eq(200)
      expect(json_response['username']).to eq(admin_user.username)
    end

    it 'get my navbar' do
      get '/api/v1/user/ui?type=sidebar'
      expect(response.status).to eq(200)
      expect(response.body).to be_kind_of(Object)
    end
  end
end
