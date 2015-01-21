class Order < ActiveRecord::Base
	self.primary_key = :id
	belongs_to :shop
	has_many :line_items
end