class Ecommerce::ProductsProperties < ActiveRecord::Base
  belongs_to :product
  belongs_to :property
end
