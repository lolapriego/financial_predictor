# This class take the sentiment dataset and generates an array with a sentiment score

class SentimentAnalyzer

	# Takes the all the log files from the dataset_sentiment folder and runs the score method for each file
	# It collects the output into an array
	def run
		sentiment_score = Hash.new

		Dir["../dataset/sentiment/*"].each do |file|
			date = file.gsub(/[^0-9]/, '')
			sentiment_score[date] = score(file)
		end

		p sentiment_score
	end

	def score(relative_path)
		poms = Hash.new(0)
		poms['tense'] = 2
		poms['shaky'] = 10
		poms['on edge'] = 16
		poms['panicky'] = 20
		poms['uneasy'] = 26
		poms['restless'] = 27
		poms['nervous'] = 34
		poms['anxious'] = 41

		text = File.open(File.expand_path( relative_path, File.dirname(__FILE__)), "r:iso-8859-1:utf-8")
		tweets = text.read().split('}')
		score = 0

		# Scoring each tweet
		tweets.each do |tweet|
			poms.keys.each do |adj|
				if(tweet.match(Regexp.new(adj, Regexp::EXTENDED | Regexp::IGNORECASE)))
					score += poms[adj]
				end
			end
		end

		return score
	end
end





