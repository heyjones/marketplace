class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items, {:id => false} do |t|
      t.integer :order_id
      t.integer :id, {:options => 'PRIMARY KEY'}
      t.string :name
      t.string :sku
      t.integer :quantity
      t.decimal :price
      t.integer :grams
      t.string :fulfillment_status
    end
  end
end
