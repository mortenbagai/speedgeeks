require 'benchmark'

class VarnishController < ApplicationController
	def index
		redirect_to :controller => :varnish, :action => :slow
	end

	def slow
		send_data Slow.rotate_and_resize, :filename => "jelly_fish.png", :type => "image/png", :disposition => 'inline'
	end

	def fast
		headers['Cache-Control'] = 'public; max-age=2592000'
		send_data Slow.rotate_and_resize, :filename => "jelly_fish.png", :type => "image/png", :disposition => 'inline'
	end
end
