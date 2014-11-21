class Ecommerce::StockItem < ActiveRecord::Base
  belongs_to :variant
  belongs_to :stock_location
end
