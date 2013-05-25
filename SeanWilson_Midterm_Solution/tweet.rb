class Tweet
  attr_accessor :user, :user_name, :tweet_text, :time
  def initialize (user, user_name, tweet_text, time)
    @user = user
    @user_name = user_name
    @tweet_text = tweet_text
    @time = Time.parse(time)
  end
  def to_s
    "\n#{time.strftime("%m/%d/%Y: #{user}(#{user_name}) tweeted at %I:%M%p")}\n#{tweet_text}" # .strftime is a ruby method that lets you display the time in a more readable way, but only works on a "time" object
  end
end