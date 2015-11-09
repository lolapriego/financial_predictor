require 'tweetstream'

TweetStream.configure do |config|
  config.consumer_key       = '$SECRET-CKEY'
  config.consumer_secret    = '$SECRET-KEY'
  config.oauth_token        = '278150155-$TOKEN'
  config.oauth_token_secret = 'QOBNp897FhdJnpVuEprpIGHmLOdfXJO09zjgJbAqiS9tv'
  config.auth_method        = :oauth
end

# Use 'track' to track a list of single-word keywords
TweetStream::Client.new.track('i feel', 'lola') do |status|
  puts "#{status.text}"
end
