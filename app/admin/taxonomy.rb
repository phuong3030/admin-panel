ActiveAdmin.register Ecommerce::Taxonomy, :as => "Taxonomy" do

  permit_params(
    :name, 
    :taxons_attributes => [
      :id, 
      :name, 
      :description, 
      :position, 
      :parent_id, 
      :_destroy
    ]
  )

  filter :name
  menu :priority => 2
  config.batch_actions = false
  config.paginate = false

  controller do
  end

  index do
    @new_taxonomy = Ecommerce::Taxonomy.new
    @taxonomies = Ecommerce::Taxonomy.tree

    render(
      'admin/taxonomy/index', 
      :new_taxonomy => @new_taxonomy,
      :taxonomies => @taxonomies
    )
  end

end
