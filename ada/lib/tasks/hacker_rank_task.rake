require 'hacker_rank_client'

namespace :hacker_rank_task do
	task :send_request => :environment do
		client = HackerRankClient.new
		response = client.submit_code("print 1\nprint 2", 5,'["1\n2\n"]')
		pp response.handled_response[:message]
	end
end
