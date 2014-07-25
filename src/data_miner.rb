require 'json'
require 'csv'

# This class takes the news dataset and generates an array that represents alarms for important news.
# If there is no important news the output of that day will be 0.
# The score will correspond with the number of alarms found on a day.
# Each day is scored

class DataMiner
	# Takes the all the log files from the dataset_news folder and runs the score method for each file
	# It collects the output into an array
	# TODO: it receives the period time to analyze
	def run
		features_day_vector = Hash.new

		Dir["../dataset/news/training/financial*.txt"].each do |file|
			date = file.gsub(/[^0-9]/, '')
			features_day_vector[date] = score(file)
		end
		features_day_vector
	end

	# Given a file containing financial tweets it returns a feature vector
	def score(relative_path)
		# We are going to open the file 
		text = File.open(File.expand_path( relative_path, File.dirname(__FILE__)), "r:iso-8859-1:utf-8")
		text_splitted = text.read().split('}')

		dictionary = init_dictionary
		tweets = []
		total_words = 0

		text_splitted.each do |tweet|
			tweets << tweet.split('"')[9]
		end

		# Update dictionary with each tweet
		tweets.each do |tweet|
			if tweet != nil
				tweet.gsub!(/(?:f|ht)tps?:\/[^\s]+/, '')
				words = tweet.split(/\W+/)
				words = words.map { |x| x.gsub(/\?|,|\.|\-/,'') }
				words.each do |word|
					if dictionary[word.upcase] != nil
						dictionary[word.upcase] += 1
					end
					total_words += 1
				end
			end
		end

		#dictionary.keys.each do |key| For now we leave it this way. With more data we could run this
		#	dictionary[key] /= total_words
		#end
		return dictionary
	end

	def init_dictionary
		# HashMap with financial words as keys
	    @dictionary = Hash.new()
		Dir["../dataset/Loughran*"].each do |file|
			reader = CSV.open(file, 'r')
			row1 = reader.shift
			while row1 != nil
				word = row1[0]
				@dictionary[word] = 0
				row1 = reader.shift
			end
			reader.close
		end
		@dictionary
	end
end
