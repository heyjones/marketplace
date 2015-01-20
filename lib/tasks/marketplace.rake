namespace :marketplace do

	task vendors: :environment do
		shops = Shop.all
		shops.each do |shop|
			session = ShopifyAPI::Session.new(shop.domain, shop.token)
			ShopifyAPI::Base.activate_session(session)
			products = ShopifyAPI::Product.find(:all, :params => { :limit => 250, :fields => 'vendor' })
			products.each do |product|
				vendor = Vendor.find_or_create_by(shop_id: shop.id, name: product.vendor)
			end
		end
	end

end