class CreateEcommerceTaxonomies < ActiveRecord::Migration
  def change
    create_table :ecommerce_taxonomies do |t|
      t.string :name

      t.timestamps
    end
  end
end
