class Ecommerce::Taxon < ActiveRecord::Base
  belongs_to :parent
  belongs_to :taxonomy
end
