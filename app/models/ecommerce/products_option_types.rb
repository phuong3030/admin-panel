class Ecommerce::ProductsOptionTypes < Ecommerce::Base
  belongs_to :product
  belongs_to :option_type
end
