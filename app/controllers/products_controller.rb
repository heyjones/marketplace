class ProductsController < ApplicationController
	around_filter :shopify_session
	def show
		@vendor = Vendor.find(params[:vendor_id])
		@product = ShopifyAPI::Product.find(params[:id])
	end
	def update
		product = ShopifyAPI::Product.find(params[:id])
		product.title = params[:title]
		if product.save
			redirect_to vendor_product_path(params[:vendor_id], params[:id])
		else
			redirect_to vendor_product_path(params[:vendor_id], params[:id])
		end
	end
end
