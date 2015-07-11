require 'hacker_rank_client'

namespace :hacker_rank_task do
	task :send_request => :environment do
		client = HackerRankClient.new
		client.submit_code("print 1", 5,'["1"]')
	end
end
