class RSSFeed < ActiveRecord::Base
	validates_uniqueness_of :url

	class Unavailable < RuntimeError; end

	def items
		feed.xpath("//rss/channel/item").collect do |item|
			{
				:title => item.at("title").text.strip,
				:link => item.at("link").text.strip
			}
		end.slice(0, 5)
	rescue Unavailable
		[]
	end

	def feed
		begin
			res = RestClient.get(url)
			Nokogiri.XML(res)
		rescue Object => e
			raise Unavailable, e.message
		end
	end
end
