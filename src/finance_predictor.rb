require './data_miner.rb'
require './sentiment_analyzer.rb' # TODO: this should be properly done
require 'yahoo_stock'

DataMiner.new.run
SentimentAnalyzer.new.run

start = ARGV[0]
endd = ARGV[1]

start_date = Date.parse(start)
end_date = Date.parse(endd)

closing_values = []
history = YahooStock::History.new(:stock_symbol => "DJIA", :start_date => start_date, :end_date => end_date)

history.results(:to_array).output.each do |day_values|
	closing_values << day_values[4]
end

p closing_values

