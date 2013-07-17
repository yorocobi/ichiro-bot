require './tweet.rb'

task :scheduler do
  Tweet.new.daily_tweet
end