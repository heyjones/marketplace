class AdminController < ApplicationController
	around_filter :shopify_session
	def index
	    @vendors = Vendor.all
	end
end