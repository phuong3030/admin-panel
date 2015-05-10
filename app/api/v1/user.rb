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
            { 
              username: current_user.username,
              email: current_user.email,
              fullname: current_user.fullname
            }
          end
        end

        desc 'Get navbar of current user by his roles'
        get '/ui' do
          current_user.group.get_func_by_role(params[:type])
        end

        desc 'Get user notifications'
        get '/notifications' do 
          quantity, page = params[:quantity].to_i, params[:page].to_i

          if quantity > 0 && quantity < 20
            current_user.mailbox.notifications.first(quantity)
          elsif quantity == 0
            if page > 0
              current_user.mailbox.notifications.page(page).per(25)
            else
              error!({ 
                status: 400, 
                message: "Invalid params",
                errors: ['Wrong page param']
              }, 400)
            end
          else
            error!({ 
                status: 400, 
                message: "Invalid params",
                errors: ['Wrong quantity param']
              }, 400)
          end
        end

        desc 'Get user info for dashboard'
        get '/dashboard-info' do
          {
            username: current_user.username,
            email: current_user.email,
            fullname: current_user.fullname,
            navbars: current_user.group.get_func_by_role('sidebars'),
            notifications: current_user.mailbox.notifications.first(5)
          }
        end
      end
    end
  end
end
