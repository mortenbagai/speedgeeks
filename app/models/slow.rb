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

	def self.rotate_and_resize(file = nil, opts={})
		opts[:resize_to] ||= [800, 600]
		opts[:rotate] ||= 45

		file ||= JELLY_FISH

		x, y = opts[:resize_to]
		degrees = opts[:rotate]

		new_file = "#{RAILS_ROOT}/tmp/jelly_fish_#{x}x#{y}_r#{degrees}.png"
		cmd = "convert #{file} -rotate #{degrees} -resize #{x}x#{y} #{new_file}"
		logger.info "running #{cmd}"
		system(cmd)
		data = File.read(new_file)
		File.delete(new_file) rescue nil
		data
	end
end
