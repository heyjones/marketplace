class Order < ActiveRecord::Base
	self.primary_key = :id
	has_many :line_items
end