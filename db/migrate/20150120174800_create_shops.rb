class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops, force: true do |t|
	    t.string "domain"
	    t.string "token"
	    t.datetime "created_at"
	    t.datetime "updated_at"
    end
  end
end
