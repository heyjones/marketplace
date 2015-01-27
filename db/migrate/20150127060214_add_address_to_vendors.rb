class AddAddressToVendors < ActiveRecord::Migration
  def change
	  add_column :vendors, :address1, :string
	  add_column :vendors, :address2, :string
	  add_column :vendors, :city, :string
	  add_column :vendors, :province, :string
	  add_column :vendors, :zip, :string
	  add_column :vendors, :country, :string
  end
end