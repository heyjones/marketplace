class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders, {:id => false} do |t|
      t.integer :shop_id
      t.integer :id
      t.string :name
      t.string :first_name
      t.string :last_name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :province
      t.string :zip
      t.string :country_code
      t.datetime :created_at
    end
  end
end
