require './data_miner.rb'
require './sentiment_analyzer.rb' # TODO: this should be properly done
require 'yahoo_stock'

class FinancePredictor
	def run
		DataMiner.new.run
		SentimentAnalyzer.new.run

		closing_values = []
		history = YahooStock::History.new(:stock_symbol => "DJIA", :start_date => Date.today-20, :end_date => Date.today-2)

		history.results(:to_array).output.each do |day_values|
			closing_values << day_values[4]
		end

		p closing_values
	end

end