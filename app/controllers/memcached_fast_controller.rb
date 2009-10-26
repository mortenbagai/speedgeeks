class MemcachedFastController < ApplicationController
  def index
		@feeds = RSSFeed.all
		render :cached_partial
	end
end
