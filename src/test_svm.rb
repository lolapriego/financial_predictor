## Test (rude, not with proper tests!) the predictor that mines relevant news for the DJIA closing values

require './Predictor'

p = Predictor.new

puts p.predict('playstation fw update is live update source sademoticon breaking news firmware for the is already out exclamationpoint webaddress')
puts p.predict('breaking news obama to address all students across america september why he bypassing ')
puts p.predict('breaking news the government has an opinion gordon brown didn t want the lockerbie bomber to die in jail but')
puts p.predict('US backed plan to launch chemical weapon attack on Syria, blame it on Assad govt')





