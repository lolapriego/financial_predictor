require 'tweetstream'

TweetStream.configure do |config|
  config.consumer_key       = '8mSEPPqvafhGYRJAFfMRg'
  config.consumer_secret    = 'Ng20mUfJrrOCACUmFqPTndb3Op1ShEokz8f2Jcnk'
  config.oauth_token        = '278150155-Kf5Ua00a7nfaYGZOLeICtIIJWZsS5tXFYFYrmAmW'
  config.oauth_token_secret = 'QOBNp897FhdJnpVuEprpIGHmLOdfXJO09zjgJbAqiS9tv'
  config.auth_method        = :oauth
end

# Use 'track' to track a list of single-word keywords
TweetStream::Client.new.track('i feel', 'lola') do |status|
  puts "#{status.text}"
end