class Ecommerce::TaxRate < ActiveRecord::Base
  belongs_to :zone
  belongs_to :tax_category
end
