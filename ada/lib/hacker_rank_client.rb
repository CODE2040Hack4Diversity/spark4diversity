class HackerRankClient
  API_KEY = "hackerrank|258009-281|b2f5f21b0e34585da262983af2119a651bb26419"
  URL = "api.hackerrank.com/checker/submission.json"

  def initialize()
  end

  def submit_code(source, test)
    request = Typhoeus::Request.new(
        URL,
        method: :post,
        body: {
          source: source,
          lang: 5,
          testcases: test,
          api_key: API_KEY
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
end
