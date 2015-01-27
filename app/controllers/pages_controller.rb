class PagesController < ApplicationController
	around_filter :shopify_session, :except => 'index'
	def index
		current_host = "#{request.host}#{':' + request.port.to_s if request.port != 80}"
		@callback_url = "http://#{current_host}/login"
  end
end