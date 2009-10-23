class CreateRssFeeds < ActiveRecord::Migration
	def self.up
		create_table :rss_feeds do |t|
			t.text :url, :null => false
			t.timestamps
		end
	end

	def self.down
		drop_table :rss_feeds
	end
end
