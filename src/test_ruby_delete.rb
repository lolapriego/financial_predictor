require 'csv'
require 'json'
class DataMiner
	# HashMap with financial words as keys
	Dictionary = Hash.new()

	def self.run
		init_dictionaryI
		# Dir["../dataset/news/*"].each do |file|
		#date = file.gsub(/[^0-9]/, '')
		p scoreIt("../dataset/news/data_f_1211.txt")
			#reset_dictionary_values
		#end
	end

	# Given a file containing financial tweets it returns a feature vector
	def self.scoreIt(relative_path)
		# We are going to open the file 
		text = File.open(File.expand_path( relative_path, File.dirname(__FILE__)), "r:iso-8859-1:utf-8")
		text_splitted = text.read().split('}')

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
					if Dictionary[word.upcase] != nil
						Dictionary[word.upcase] += 1
					end
					total_words += 1
				end
			end
		end

		return Dictionary
	end

	def self.reset_dictionary_values
		Dictionary.keys.each do |key|
			Dictionary[key] = 0
		end
	end

	def self.init_dictionaryI
		Dir["../dataset/Loughran*"].each do |file|
			reader = CSV.open(file, 'r')
			row1 = reader.shift
			while row1 != nil
				word = row1[0]
				Dictionary[word] = 0
				row1 = reader.shift
			end
			reader.close
		end
	end


end