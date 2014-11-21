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

  collection_action :custom_page, :method => :get do
    @a = 1
    render 'admin/taxonomy/custom_page', :a => @a
  end

  controller do
    def cus
      @a = 1
      render 'admin/taxonomy/custom_page', :a => @a
    end
  end

  index do
    @new_taxonomy = Ecommerce::Taxonomy.new

    render 'admin/taxonomy/index', :new_taxonomy => @new_taxonomy
  end

end
