require 'rails_helper'

describe API::V1::User, :type => :request do

  before :each do 
    stub_authenticate!
  end

  it 'get my information' do 
    get '/api/v1/user/my_info'
    expect(response.status).to eq(200)
  end
end
