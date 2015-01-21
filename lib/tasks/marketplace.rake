namespace :marketplace do

	task vendors: :environment do
		shops = Shop.all
		@shops.each do |shop|
			session = ShopifyAPI::Session.new(shop.domain, shop.token)
			ShopifyAPI::Base.activate_session(session)
			products = ShopifyAPI::Product.find(:all, :params => { :limit => 250, :fields => 'vendor' })
			products.each do |product|
				vendor = Vendor.find_or_create_by(:shop_id => shop.id, :name => product.vendor)
			end
		end
	end

	task orders: :environment do
		shops = Shop.all
		shops.each do |shop|
			session = ShopifyAPI::Session.new(shop.domain, shop.token)
			ShopifyAPI::Base.activate_session(session)
			orders = ShopifyAPI::Order.find(:all, :params => { :limit => 250 })
			orders.each do |shopifyOrder|
				order = Order.find_or_create_by!(:shop_id => shop.id, :id => shopifyOrder.id)
				order.name = shopifyOrder.name
				order.first_name = shopifyOrder.shipping_address.first_name
				order.last_name = shopifyOrder.shipping_address.last_name
				order.address1 = shopifyOrder.shipping_address.address1
				order.address2 = shopifyOrder.shipping_address.address2
				order.city = shopifyOrder.shipping_address.city
				order.province_code = shopifyOrder.shipping_address.province_code
				order.country_code = shopifyOrder.shipping_address.country_code
				order.save
			end
		end
	end

end