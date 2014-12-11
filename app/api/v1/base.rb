module API
  module V1
    class Base < Grape::API
      mount API::V1::User
      mount API::V1::Taxonomy
      mount API::V1::Taxon
    end
  end
end
