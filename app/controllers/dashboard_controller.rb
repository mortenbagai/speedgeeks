class DashboardController < ApplicationController
	def index
		feeds
	end

	def feeds
		@feeds = RSSFeed.all
		render :feeds
	end

	def cached_partial
		@feeds = RSSFeed.all
		render :cached_partial
	end

end
