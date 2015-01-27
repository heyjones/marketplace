class Shop < ActiveRecord::Base
	has_many :vendors
	has_many :orders
	def self.store(session)
		shop = Shop.find_or_create_by(domain: session.url)
		shop.token = session.token
		shop.save!
		shop.id
	end
	def self.retrieve(id)
		shop = Shop.find(id)
		ShopifyAPI::Session.new(shop.domain, shop.token)
	end
end