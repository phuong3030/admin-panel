module Frontend
  class ProductsController < Frontend::StoreController

    # Get product in detail page
    before_actions(
      :get_product, 
      :only => [:product_category_detail, :product_supplier_detail]
    )

    # GET /products/
    def index
    end

    # get /categories/category_name/products
    def products_of_category
    end

    # get /categories/category_name/products/product_name
    def product_category_detail
      show_product
    end

    # GET /suppliers/supplier_name/products
    def products_of_supplier
    end

    # GET /suppliers/supplier_name/products/product_name
    def product_supplier_detail
      show_product
    end

    private

    def show_product
      # render
    end

    def get_product
      #@product = Product.friendly.find(params[:id])
    end

  end
end
