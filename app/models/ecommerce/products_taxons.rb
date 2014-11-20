class Ecommerce::ProductsTaxons < ActiveRecord::Base
  belongs_to :product
  belongs_to :taxon
end
