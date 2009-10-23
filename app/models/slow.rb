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
end
