class AddVendorToLineItems < ActiveRecord::Migration
  def change
	  add_column :line_items, :vendor_id, :integer
  end
end