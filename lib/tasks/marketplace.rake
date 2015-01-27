namespace :marketplace do

	task vendors: :environment do
		shops = Shop.all
		shops.each do |shop|
			session = ShopifyAPI::Session.new(shop.domain, shop.token)
			ShopifyAPI::Base.activate_session(session)
puts session
			products = ShopifyAPI::Product.find(:all, :params => { :limit => 250, :fields => 'vendor' })
			products.each do |product|
puts product
				vendor = Vendor.find_or_create_by(:shop_id => shop.id, :name => product.vendor)
puts vendor
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
				#order
				order = Order.find_or_create_by!(:shop_id => shop.id, :id => shopifyOrder.id)
				order.name = shopifyOrder.name
				order.first_name = shopifyOrder.shipping_address.first_name
				order.last_name = shopifyOrder.shipping_address.last_name
				order.address1 = shopifyOrder.shipping_address.address1
				order.address2 = shopifyOrder.shipping_address.address2
				order.city = shopifyOrder.shipping_address.city
				order.zip = shopifyOrder.shipping_address.zip
				order.province_code = shopifyOrder.shipping_address.province_code
				order.country_code = shopifyOrder.shipping_address.country_code
				order.save
				#line_items
				shopifyOrder.line_items.each do |shopifyLineItem|
					#vendor
					vendor = Vendor.find_or_create_by(:shop_id => shop.id, :name => shopifyLineItem.vendor)
					#line_item
					line_item = LineItem.find_or_create_by!(:order_id => order.id, :id => shopifyLineItem.id)
					line_item.vendor_id = vendor.id
					line_item.product_id = shopifyLineItem.product_id
					line_item.name = shopifyLineItem.name
					line_item.sku = shopifyLineItem.sku
					line_item.quantity = shopifyLineItem.quantity
					line_item.price = shopifyLineItem.price
					line_item.grams = shopifyLineItem.grams
					line_item.fulfillment_status = shopifyLineItem.fulfillment_status
					line_item.save
				end
			end
		end
	end

end