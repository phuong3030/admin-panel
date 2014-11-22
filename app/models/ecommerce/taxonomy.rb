class Ecommerce::Taxonomy < Ecommerce::Base

  has_many :taxons, :inverse_of => :taxonomy, :dependent => :destroy

  # Get taxonomy and taxon by tree
  scope :tree, -> { 
    includes(:taxons)
    .order("#{table_name}.id asc")
    .order("ecommerce_taxons.taxonomy_id asc, ecommerce_taxons.parent_id asc")
  }

end
