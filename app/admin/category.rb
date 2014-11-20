#ActiveAdmin.register FoodStore::Category, :as => "Category" do

  #permit_params :name, :description, :products_attributes => [:id, :name, :description, :_destroy]

  #filter :name
  #menu :priority => 2

  #sidebar 'Products', only: [:show, :edit] do
    #ul do
      #li link_to(
        #'View products in this category', 
        #:controller => 'products', 
        #:action => 'index', 
        #'q[category_id_equals]' => "#{category.id}"
      #).html_safe
    #end
  #end

  #index do 
    #selectable_column
    #column :name, :sortable => :name do |category|
      #link_to category.name, admin_category_path(category)
    #end
    #column :description

    #actions 
  #end

  #form do |f|
    #f.inputs :name 
    #f.inputs :description
    #f.inputs do
      #f.has_many :products, :allow_destory => true do |cf|
        #cf.input :name
        #cf.input :description
      #end
    #end

    #f.actions
  #end
#end
