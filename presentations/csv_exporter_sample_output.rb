# File for export the first output to a csv file
# Copy paste your script's output
# For the presentation
require 'csv'

sentiment = {"1028"=>3241, "1029"=>936, "1030"=>0, "1031"=>0, "1101"=>0, "1102"=>0, "1104"=>11480, "1105"=>1303, "1106"=>33379, "1107"=>1402, "1108"=>43494, "1109"=>1162, "1110"=>26, "1111"=>25, "1112"=>26, "1113"=>26, "1114"=>26, "1115"=>0, "1116"=>0, "1117"=>25, "1118"=>25}
news = {"1028"=>4, "1029"=>0, "1030"=>2, "1031"=>0, "1101"=>0, "1102"=>1, "1103"=>0, "1104"=>2, "1105"=>0, "1106"=>2, "1107"=>2, "1108"=>1, "1109"=>0, "1110"=>1, "1111"=>3, "1112"=>5, "1113"=>4, "1114"=>3, "1115"=>1, "1117"=>2, "1118"=>4}
dow = {"2013-11-18"=>"15976.02", "2013-11-15"=>"15961.70", "2013-11-14"=>"15876.22", "2013-11-13"=>"15821.63", "2013-11-12"=>"15750.67", "2013-11-11"=>"15783.10", "2013-11-08"=>"15761.78", "2013-11-07"=>"15593.98", "2013-11-06"=>"15746.88", "2013-11-05"=>"15618.22", "2013-11-04"=>"15639.12", "2013-11-01"=>"15615.55", "2013-10-31"=>"15545.75", "2013-10-30"=>"15618.76", "2013-10-29"=>"15680.35", "2013-10-28"=>"15568.93"}

s = CSV.generate do |csv|
  		for i in 0 ... news.keys.length do
  			row = []
  			if dow.keys[i] != nil
  				row << dow.keys[i]
  				row << dow.values[i]
  			end
  			row << sentiment.values[i]
  			row << news.values[i]
  			 csv << row
  		end
		end
File.write('output.csv', s)
