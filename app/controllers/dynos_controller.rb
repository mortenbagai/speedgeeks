class DynosController < ApplicationController
	def index
		slow
	end

	def slow
		sleep 0.3
		render :text => "<h1>Hello, I'm predictably slow.</h1>"
	end
end
