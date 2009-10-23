require 'benchmark'

class DemoController < ApplicationController
	def index
		render :text => "hello world"
	end

	def slow_request
		render :text => "PI is #{Slow.calculate_pi} after 10,000,000 million iterations"
	end

	def slow_request_cached
		headers['Cache-Control'] = 'public; max-age=300'
		render :text => "PI is #{Slow.calculate_pi} after 10,000,000 million iterations"
	end

	def slow_unknown
		sleep 3
		render :text => "Why is this so slow?"
	end
end
