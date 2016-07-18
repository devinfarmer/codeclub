require "marky_markov"
require "twitter"


client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "cLT8HfqDNKUNkmYw0mb6w3CaH"
  config.consumer_secret     = "rOH6AqcC4bYcBn03GP7y8euRWI82IxTKXuvb8CgcJRQqF9Jnjb"
  config.access_token        = "2529015336-80kIDjdUiG8QfHRUwSVb6MR5c9VoUKb4iT2TZQf"
  config.access_token_secret = "h0Ls8fZypLBn0hzBTxt3LfP7rgG9yfJCsimqW5KKOldrM"
end

markov = MarkyMarkov::TemporaryDictionary.new
# kanyes_tweets = client.user_timeline("kanyewest")
# kanyes_tweets_collected = ""
# for tweet in kanyes_tweets
# 	kanyes_tweets_collected = kanyes_tweets_collected + tweet.text
# end

# markov.parse_string kanyes_tweets_collected
markov.parse_file "speed.txt"

tweet_number = 1
while tweet_number <= 3 do
	markov_tweet = markov.generate_n_sentences 3
	sentence = markov_tweet[0..100]
	puts "Tweet #{tweet_number}: #{sentence}"
	client.update(sentence)
	tweet_number += 1
end