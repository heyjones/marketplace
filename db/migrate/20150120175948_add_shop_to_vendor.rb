class AddShopToVendor < ActiveRecord::Migration
  def change
	  add_column :vendors, :shop_id, :integer
  end
end
