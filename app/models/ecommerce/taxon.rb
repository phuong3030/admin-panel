class Ecommerce::Taxon < Ecommerce::Base
  belongs_to :parent
  belongs_to :taxonomy

  has_and_belongs_to_many :products
end
