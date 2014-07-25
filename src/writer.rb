require 'yahoo_stock'


class Writer
	def create_svr_input_sent(sentiment_score, start, endd)
		closing_values = Hash.new 
		target = open('sentiment_input_svr.txt', 'w')
		target.truncate(0) # in case it existed, we erased it

		history = YahooStock::History.new(:stock_symbol => "DJIA", :start_date => start, :end_date => endd)
		history.results(:to_array).output.each do |day_values|
			aux = day_values[0].split("-")
			key = aux[1] + aux[2]
			p key
			closing_values[day_values[0]] = day_values[4]
		end

		closing_values.keys.each do |date|
			if sentiment_score[date] != nil
				target.puts "#{closing_values[date]} :" + sentiment_score[date]
			end
		end
	end

	def create_svr_input_fin(financial_score, start, endd)		
		closing_values = Hash.new 
		target = open('financial_input_svr.txt', 'w')
		target.truncate(0) # in case it existed, we erased it

		history = YahooStock::History.new(:stock_symbol => "DJIA", :start_date => start, :end_date => endd)
		history.results(:to_array).output.each do |day_values|
			aux = day_values[0].split("-")
			key = aux[1] + aux[2]
			closing_values[key] = (day_values[4].to_f)/1000
		end

		i = 1
		fin_a = financial_score.keys
		closing_values.keys.each do |date|
			features = financial_score[date]			
			if features != nil 
				target.write("#{closing_values[date]} ")
				features.keys.each do |feature|
					target.write("#{i}:#{features[feature]} ")
					i += 1
				end
			target.puts
			end
			i = 1
		end
	end
end