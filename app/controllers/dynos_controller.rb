class DynosController < ApplicationController
	def index
		slow
	end

	def slow
		sleep 0.3
		render :text => "Why is this so slow?"
	end
end
