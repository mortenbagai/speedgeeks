class MemcachedSlowController < ApplicationController
  def index
		@feeds = RSSFeed.all
		render :feeds
	end
end
