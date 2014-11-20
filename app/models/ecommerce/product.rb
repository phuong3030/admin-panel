class Ecommerce::Product < ActiveRecord::Base
  belongs_to :tax_category
  belongs_to :shipping_category
end
