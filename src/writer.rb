require 'yahoo_stock'


class Writer
	def create_svr_input_sent(sentiment_score, start, endd)
		closing_values = Hash.new 
		target = open('sentiment_input_svr', 'w')
		target.truncate(0) # in case it existed, we erased it

		history = YahooStock::History.new(:stock_symbol => "DJIA", :start_date => start_date, :end_date => end_date)
		history.results(:to_array).output.each do |day_values|
			closing_values[day_values[0]] = day_values[4]
		end

		closing_values.zip.sentiment_score.keys.each do |closing_value, key|
			target.puts closing_value + " 1:" + sentiment_score[key]
			# target.write('\n')
		end
	end

	def create_svr_input_fin(financial_score, start, endd)		
		closing_values = Hash.new 
		target = open('financial_input_svr', 'w')
		target.truncate(0) # in case it existed, we erased it

		history = YahooStock::History.new(:stock_symbol => "DJIA", :start_date => start, :end_date => endd)
		history.results(:to_array).output.each do |day_values|
			closing_values[day_values[0]] = (day_values[4].to_f)/1000
		end

		i = 1
		j = 0
		closing_a = closing_values.keys
		fin_a = financial_score.keys
		while j < closing_a.size do
			target.write("#{closing_values[closing_a[j]]} ")
			features = financial_score[fin_a[j]]
			features.keys.each do |feature|
				target.write("#{i}:#{features[feature]} ")
				i += 1
			end
			target.puts
			i = 1
			j += 1
		end
	end
end