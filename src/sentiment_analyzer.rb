# This class take the sentiment dataset and generates an array with a sentiment score

class SentimentAnalyzer

	# Takes the all the log files from the dataset_sentiment folder and runs the score method for each file
	# It collects the output into an array
	# TODO: it receives the period time to analyze
	def run
		sentiment_score = Hash.new

		Dir["../dataset/sentiment/*"].each do |file|
			date = file.gsub(/[^0-9]/, '')
			sentiment_score[date] = score(file)
		end

		p "This is the score to know how tense is the people \nfrom the sentimen classifier"

		p sentiment_score
	end

	def score(relative_path)
		# From POMS model. Tense mood dimension
		poms = ['tense', 'shaky', 'on edge', 'panicky', 'relaxed', 'uneasy', 'restless', 'nervous', 'anxious']
		wordNet = ['suspense', 'alarmed', 'fearful', 'afraid', 'presage', 'afraid', 'hysterical', 'intimidate']

		text = File.open(File.expand_path( relative_path, File.dirname(__FILE__)), "r:iso-8859-1:utf-8")
		tweets = text.read().split('}')
		score = 0

		# Scoring each tweet
		tweets.each do |tweet|
			poms.each do |adj|
				if(tweet.match(Regexp.new(adj, Regexp::EXTENDED | Regexp::IGNORECASE)))
					score += 2
				end
			end
			wordNet.each do |adj|
				if(tweet.match(Regexp.new(adj, Regexp::EXTENDED | Regexp::IGNORECASE)))
					score += 1
				end
			end
		end

		return score
	end
end





