class Ecommerce::ProductsOptionTypes < ActiveRecord::Base
  belongs_to :product
  belongs_to :option_type
end
