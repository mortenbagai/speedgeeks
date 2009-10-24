require 'benchmark'

class VarnishController < ApplicationController
	def index
		redirect_to :controller => :varnish, :action => :slow
	end

	def slow
		render :text => "PI is #{Slow.calculate_pi} after 10 million iterations"
	end

	def fast
		headers['Cache-Control'] = 'public; max-age=300'
		render :text => "PI is #{Slow.calculate_pi} after 10 million iterations"
	end

	def img_slow
		send_data Slow.rotate_and_resize, :filename => "jelly_fish.png", :type => "image/png", :disposition => 'inline'
	end

	def img_fast
		headers['Cache-Control'] = 'public; max-age=2592000'
		send_data Slow.rotate_and_resize, :filename => "jelly_fish.png", :type => "image/png", :disposition => 'inline'
	end
end
