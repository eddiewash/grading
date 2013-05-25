require 'json'
require 'rest-client'
require 'time' # This is an additional gem that will let you parse the json "tweet["created_at"]"
              # and turn it into a time object in order to format it in a nicer way
require_relative 'tweet'
require_relative 'search'



class TwitterSearchResult
  def self.get
    search_result_as_json = RestClient.get("http://search.twitter.com/search.json?q=#{@@searching}")
    search_result = JSON.load(search_result_as_json)
    search_result["results"].map do |tweet|
      Tweet.new tweet["from_user_name"], tweet["from_user"], tweet["text"], tweet["created_at"]
    end
  end
end


# parsing
# search_result["results"].first
# User Name = search_result["results"].first["from_user"]
# User Display Name = search_result["results"].first["from_user_name"]
# User Tweet = search_result["results"].first["text"]
# Tweet Time = search_result["results"].first["created_at"]