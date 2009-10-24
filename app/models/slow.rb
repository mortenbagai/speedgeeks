class Slow
	def self.calculate_pi(iterations = 10000000)
		num = 4.0
		pi = 0
		op = 1

		den = 1
		while den < 10000000
			pi = pi + (op * num / den)
			op *= -1
			den = den + 2
		end
		pi
	end

	JELLY_FISH = "#{RAILS_ROOT}/public/jelly_fish.png"

	def self.logger
		Rails.logger
	end

	def self.rotate_and_resize(file = nil, opts={})
		opts[:resize_to] ||= [800, 600]
		opts[:rotate] ||= 45

		file ||= JELLY_FISH

		x, y = opts[:resize_to]
		degrees = opts[:rotate]

		cmd = "convert #{file} -rotate #{degrees} -resize #{x}x#{y} png:-"
		logger.info "running #{cmd}"
		data = `#{cmd}`
	end
end
