class Ecommerce::TaxRate < Ecommerce::Base
  belongs_to :zone
  belongs_to :tax_category
end
