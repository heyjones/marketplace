class RenameOrderProvinceToProvinceCode < ActiveRecord::Migration
  def change
	  rename_column :orders, :province, :province_code
  end
end
