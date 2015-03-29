module API
  module V1
    class User < Grape::API

      include API::V1::Defaults
      include Grape::Rails::Cache
      helpers API::Auth

      before do
        authenticated_user
      end

      resource :user do
        desc 'Get current user information'
        get '/info' do
          cache(key: "api:users:information", etag: current_user.updated_at, expires_in: 2.hours) do
            { username: current_user.username }
          end
        end

        desc 'Get navbar of current user by his roles'
        get '/ui' do
          current_user.group.get_func_by_role(params[:type])
        end
      end

    end
  end
end
