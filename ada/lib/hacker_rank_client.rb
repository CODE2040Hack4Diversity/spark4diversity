class HackerRankClient
  API_KEY = "hackerrank|258009-281|b2f5f21b0e34585da262983af2119a651bb26419"
  URL = "api.hackerrank.com/checker/submission.json"

  def initialize()
  end

  def submit_code(source, language_number, test)
    request = Typhoeus::Request.new(
        URL,
        method: :post,
        body: {
          source: source,
          lang: language_number,
          testcases: test,
          api_key: API_KEY
        }
      )


    request.on_complete do |response|
      if response.success?
        result = JSON.parse(response.body)
        pp result
        # pp result['result']['message']

      elsif response.timed_out?
        # p response
        p response
        result = JSON.parse(response.body)
        pp result['result']['message']
      elsif response.code == 0
        # p response
        result = JSON.parse(response.body)
        pp result['result']['message']
      else
        # p response
        result = JSON.parse(response.body)
        pp result['result']['message']
      end
    end
    request.run
  end
end
