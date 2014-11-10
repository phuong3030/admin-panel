ActiveAdmin.register FoodStore::Product, :as => "Product" do
  permit_params :name, :description, :available_on, :category_id, :slug

  # scope_to :current_user
  # scope :test
  menu :priority => 3

  filter :name 
  filter :description 
  filter :category_id

  #batch_action :custom, :if => proc { can?( :destroy, Product ) } do |selection|
    #redirect_to collection_path, :alert => "Didn't really delete these!"
  #end

  # Index page 
  index do 
    selectable_column
    column :name, :sortable => :name do |product|
      link_to product.name, admin_product_path(product)
    end
    column :description
    actions
  end

  # Custom form 
  form :partial => "/admin/products/form"

  # Sidebar
  sidebar 'Product Details' do
    ul do
      li link_to(
        'Images gallery'
        #:controller => 'images',
        #:action => 'index',
        #'q[product_id_equals]' => "#{product.id}"
      )
      li link_to(
        'Variants'
        #:controller => 'images',
        #:action => 'index',
        #'q[product_id_equals]' => "#{product.id}"
      )
      li link_to(
        'Product Properties'
        #:controller => 'images',
        #:action => 'index',
        #'q[product_id_equals]' => "#{product.id}"
      )
    end
  end

end
