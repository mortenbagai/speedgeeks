class DashboardController < ApplicationController
	def index
		feeds
	end

	def feeds
		@feeds = RSSFeed.all
		render :feeds
	end
end
