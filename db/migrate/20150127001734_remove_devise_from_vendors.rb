class RemoveDeviseFromVendors < ActiveRecord::Migration
  def change
	  remove_column :vendors, :email
	  remove_column :vendors, :encrypted_password
	  remove_column :vendors, :reset_password_token
	  remove_column :vendors, :reset_password_sent_at
	  remove_column :vendors, :remember_created_at
	  remove_column :vendors, :sign_in_count
	  remove_column :vendors, :current_sign_in_at
	  remove_column :vendors, :last_sign_in_at
	  remove_column :vendors, :current_sign_in_ip
	  remove_column :vendors, :last_sign_in_ip
  end
end
