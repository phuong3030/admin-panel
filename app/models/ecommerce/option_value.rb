class Ecommerce::OptionValue < Ecommerce::Base

  belongs_to :option_type

  has_and_belongs_to_many :variants

end
