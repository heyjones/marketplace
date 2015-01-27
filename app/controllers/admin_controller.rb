class AdminController < ApplicationController
	around_filter :shopify_session
	def index
	    @vendors = Vendor.all
	end
	def vendor
		vendor = Vendor.find_or_create_by(:shop_id => shop_session.shop.id, :name => params[:name])
		vendor.email = params[:email]
		vendor.address1 = params[:address1]
		vendor.address2 = params[:address2]
		vendor.city = params[:city]
		vendor.province = params[:province]
		vendor.zip = params[:zip]
		vendor.country = params[:country]
		vendor.save!
# 		product = ShopifyAPI::Product.new(
# 			:title => params[:name],
# 			:body_html => '',
# 			:vendor => params[:name],
# 			:product_type => params[:name],
# 			:published => false
# 		)
# 		product.save
		render status: 200, json: 'ok'
	end
end