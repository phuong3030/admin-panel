module API
  module V1
    class Taxonomy < Grape::API

      include API::V1::Defaults
      helpers API::Auth

      #before do
        #authenticated_user
      #end

      resource :taxonomies do
        desc 'Get All taxonomies'
        get do
          Ecommerce::Taxonomy.all
        end

        desc 'Get spec taxonomy'
        params do
          requires :id, :type => Integer, desc: 'Taxonomy ID'
        end
        get ':id' do
          Ecommerce::Taxonomy.find(params[:id])
        end
      end

    end
  end
end
