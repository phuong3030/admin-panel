class Ecommerce::Variant < ActiveRecord::Base
  belongs_to :product

  has_many :image, as: :viewable
end
