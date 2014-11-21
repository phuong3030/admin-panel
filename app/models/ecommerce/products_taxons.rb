class Ecommerce::ProductsTaxons < Ecommerce::Base
  belongs_to :product
  belongs_to :taxon
end
