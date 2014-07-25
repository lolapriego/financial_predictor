require './data_miner.rb'
require './sentiment_analyzer.rb' # TODO: this should be properly done
require './writer.rb'

# Take the output as input of writer
#sentiment_output = SentimentAnalyzer.new.run
financial_ouput = DataMiner.new.run

start = ARGV[0]
endd = ARGV[1]

writer = Writer.new
#writer.create_svr_input_sent(sentiment_output, Date.parse(start), Date.parse(endd))
writer.create_svr_input_fin(financial_ouput, Date.parse(start), Date.parse(endd))



