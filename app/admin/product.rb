#ActiveAdmin.register FoodStore::Product, :as => "Product" do
  #permit_params :name, :description, :category_id, :slug

  ## scope_to :current_user
  ## scope :test
  #menu :priority => 3

  #filter :name 
  #filter :description 
  #filter :category_id

  ##batch_action :custom, :if => proc { can?( :destroy, Product ) } do |selection|
    ##redirect_to collection_path, :alert => "Didn't really delete these!"
  ##end

  #index do 
    #selectable_column
    #column :name, :sortable => :name do |product|
      #link_to product.name, admin_product_path(product)
    #end
    #column :description
    #actions
  #end

  #form do |f|
    #f.inputs :name 
    #f.inputs :description
    #f.inputs :category, :as => :select, :collection => FoodStore::Category.all

    #f.actions
  #end

#end
