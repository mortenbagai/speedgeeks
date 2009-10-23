class MemcachedController < ApplicationController
	def index
		redirect_to :action => :slow
	end

	def slow
		@feeds = RSSFeed.all
		render :feeds
	end

	def fast
		@feeds = RSSFeed.all
		render :cached_partial
	end
end
