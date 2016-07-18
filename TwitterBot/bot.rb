require "marky_markov"
require "twitter"


client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "consumerkey"
  config.consumer_secret     = "consumersecret"
  config.access_token        = "accesstoken"
  config.access_token_secret = "accesstokensecret"
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
