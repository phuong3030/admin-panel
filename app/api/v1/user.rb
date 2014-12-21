module API
  module V1
    class User < Grape::API

      include API::V1::Defaults
      helpers API::Auth

      before do
        authenticated_user
      end

      resource :user do
        desc 'Get current user information'
        get '/my_info' do
          { username: current_user.username }
        end
      end

    end
  end
end
