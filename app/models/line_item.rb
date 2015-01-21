class LineItem < ActiveRecord::Base
	self.primary_key = :id
	belongs_to :order
end