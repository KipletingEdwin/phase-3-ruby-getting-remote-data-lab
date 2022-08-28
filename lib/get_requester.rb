# Write your code here
require 'net/http'
require 'open-uri'
require 'json'

class GetRequester

    attr_accessor:url

    def initialize(url)
        @url = url

    end

    def get_response_body
        data = URI.parse(url)
        response = Net::HTTP.get_response(data)
        response.body

    end

    def parse_json
        res = JSON.parse(self.get_response_body)
        res.collect do |program|
            program["agency"]
        end
    end
end
