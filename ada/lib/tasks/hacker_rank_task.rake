namespace :hacker_rank_task do
	request = Typhoeus::Request.new(
	  "api.hackerrank.com/checker/submission.json",
	  method: :post,
	  params: { source: "print 1",
	  			lang: "5",
	  			testcases: "[\"1\"]",
	  			api_key: "hackerrank|258009-281|b2f5f21b0e34585da262983af2119a651bb26419"
	  		  }	
	)

	request.on_complete do |response|
	  if response.success?
	  	p response
	    # hell yeah
	  elsif response.timed_out?
	  	p response
	    # aw hell no
	    #log("got a time out")
	  elsif response.code == 0
	  	p response
	    # Could not get an http response, something's wrong.
	    #log(response.return_message)
	  else
	  	p response
	    # Received a non-successful http response.
	    #log("HTTP request failed: " + response.code.to_s)
	  end
	end

	request.run
end
