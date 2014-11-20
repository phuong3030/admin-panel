class Ecommerce::Variant < Ecommerce::Base

  belongs_to :product

  has_many :image, as: :viewable

  has_and_belongs_to_many :option_values

  has_many :image, :as => :viewable

end
