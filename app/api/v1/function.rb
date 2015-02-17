module API
  module V1
    class Function < Grape::API

      include API::V1::Defaults
      helpers API::Auth

      before do
        authenticated_user
      end

      resource :functions do
        desc 'Get navbar menu by user role'
        get '/navbar' do
          Admin::Function.first.descendants.arrange_serializable #.map { |f| { :name => f.name, :url => f.url } } }
        end

        desc 'Get header menu by user role'
        get '/header-menu' do
        end
      end

    end
  end
end
