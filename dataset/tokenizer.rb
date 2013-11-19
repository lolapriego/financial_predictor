txt = File.open(File.expand_path( "./mydata_sentiment_20131117-0608", File.dirname(__FILE__)), "r:iso-8859-1:utf-8")
text_splitted = txt.read().split('}')

f = File.new('data_s_1711.txt', 'w')

text_splitted.each do |tweet|
	tweet.gsub!("\n",'')
  		f.puts "#{tweet}\n"
end