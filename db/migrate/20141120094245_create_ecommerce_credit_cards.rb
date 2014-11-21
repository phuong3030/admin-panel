class CreateEcommerceCreditCards < ActiveRecord::Migration
  def change
    create_table :ecommerce_credit_cards do |t|
      t.string :month
      t.string :year
      t.string :cc_type
      t.string :last_digits
      t.string :firstname
      t.string :lastname
      t.string :start_month
      t.string :start_year
      t.string :issue_number
      t.string :gateway_customer_profile_id
      t.string :gateway_payment_profile_id
      t.references :address, index: true

      t.timestamps
    end
  end
end
