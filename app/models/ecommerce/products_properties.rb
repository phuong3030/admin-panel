class Ecommerce::ProductsProperties < Ecommerce::Base
  belongs_to :product
  belongs_to :property
end
