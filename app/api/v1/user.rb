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
        get '/info' do
          { username: current_user.username }
        end

        desc 'Get navbar of current user by his roles'
        get '/ui' do
          current_user.get_ui_by_role(params[:type])
        end
      end

    end
  end
end
