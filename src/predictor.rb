## Class for mining important news for the DJIA closing values
## DEPRECATED

require 'libsvm'

class Predictor
	# The best way to create a training dataset would be to use ruby to accomplish
	# the task.
	# Let take our documents and create word vectors out of them.
	# This include news from 2009 to 2010, hand labeled to see if after the new a spike on
	# Dow Jones closing values was produced.
	# I've included labels for these already.  1 signifies that
	# the new was relevant, 0 means that it wasn't.
	#
	Documents = [[1, "news JPMorgan Chase to pay $4.5 billion in mortgage security deal"],
	             [1, "news Government shutdown: Obama says he will negotiate when Republicans end 'threats'"],
	         	 [1, "news China warns U.S. against attack on Syria"],
	         	 [1, "news U.S. gives up on U.N. Security Council in Syria crisis, blames Russia"],
	         	 [0, "news international federation of people who can t get laid says that sex generally is overrated"],
	         	 [0, "breaking news about k fed kevin federline in miami pretty sure he pregnant it all makes perfect sense webaddress"],
	         	 [1, "the house has voted on a procedural vote to cut off all federal funding to acorn politico breaking news"],
	         	 [1, "news federal prop case heads to trial bay area reporter"],
	         	 [0, "news pa to try again for feds ok on plan"],
	         	 [0, "news feds mass man planned terror attacks on malls ap hashtagpolitics hashtagnews "],
	         	 [0, "msnbc breaking news fed sees housing manufacturing improving thanks fed you have always been right subprime problem has been contained"],
	         	 [0, "rt breaking news zorn just had his parking spot at fed ex taken away he had seattle tags on his car"],
	         	 [1, "news stryker indicted on federal charges prosecutors allege improper promotion of bone growth products hashtagfb "],
	         	 [0, "news the middle class is getting fed up webaddress"],
	         	 [0, "news police investigate suspicious package at federal building in downtown cleveland"],
	         	 [0, "news federal government to legislate for cigarettes to be sold in plain packaging according to"],
	         	 [1, "Hijacked jets destroy twin towers and hit pentagon in day of terror"],
	         	 [1, "news Thousands dead as Hijacked planes strike NYC, Pentagon"],
	         	 [0, "news study says babies lives health costs saved if percent of us women breast fed for months"],
	         	 [0, "news flood warning for"],
	         	 [1, "breaking news from the white house obama outraged by star wars hate"],
	         	 [1, "Syria's civil war far from over despite US-Russia deal"],
	         	 [0, "rt breaking news warrants executed in brian betts murder case "],
	         	 [0, "breaking news exclamationpoint my geek friends tell me today is star wars day"],
	         	 [0, "breaking news ruling gives state redevelopment cash gov arnold schwarzenegger on tuesday won the right to raid"],
	         	 [0, "rt rt breaking news tornado warning issued southeastern charles county and all of st mary co webaddress"],
	         	 [0, "action news cleveland oh breaking news weather launches new priority club rewards iphone app"],
	         	 [0, "news fed govt warns parents across australia not to give kids under the seasonal flu vaccination until further"],
	         	 [0, "breaking news obama has us buying for private busses for vermont"],
	         	 [0, "rt breaking news rachel maddow diagnosed with testicular cancer hashtagobamafail hashtagtcot lmfao happyemoticon"],
	         	 [1, "rt breaking news obama sending more troops to afghanistan official tells ap"],
	         	 [1, "breaking news obama to send more troops to afghanistan this is going to piss off the libs exclamationpoint"],
	         	 [1, "cnn breaking news obama intends to end afghanistan war within three years according to senior administration officials"],
	         	 [1, "breaking news cnn senior white house officials pres obama plans to end the war within three years"],
	         	 [0, "breaking news tv ad shows obama promised a public option said mandates are wrong"],
	         	 [0, "rt breaking news pres obama leaves golf in hawaii abruptly for personal matter ambulance speeds to first family"],
	         	 [0, "how does obama golf buddy kid begin injured on the beach count as breaking news"],
	             [0, "cnn breaking news president obama mix of human and systemic failures allowed terror suspect to board airliner in failed bombing"],
	             [0, "rt breaking news obama not aware people from other countries could fly into us condemns bush policies"],
	             [1, "obama announces new proposed banking regulations visit msnbc com for breaking news world news and news about th"],
	             [1, "breaking news obama announces crackdown on banks making risky bets w taxpayer if these folks want a fight a fight i m ready to hav"],
	             [1 , "its like every time the breaking news comes on cnbc the market sheds a couple points people are ready to pull the trigger on obama news"],
	             [0, "twitter breaking news obama says white house no "],
	             [0, "dear politico you calling obama feisty is not breaking news"],
	             [0, "breaking news email from says obama will use the state of the union to show a feisty side wonder what that means"],
	             [0, "breaking news closed door dem healthcare sessions postponed by illness bird brain flu outbreak hashtagtcot hashtagobama hashtagdem"],
	             [0, "breaking news obama wants to freeze spending"],
	             [0, "breaking news president obama welcomes the los angeles lakers at white house"],
	             [0, "breaking news iranian official uses racial slur against obama quote iranian official mohammad"],
	             [0, "finally exclamationpoint breaking news obama to seek repeal of military don t ask don t tell policy in state of the union speech tonight top off"],
	             [0, "breaking news moby is doing a post vic dj set in tonight tix are from free after rt exclamationpoint"],
	             [0, "princeton mn breaking news exclamationpoint blog"],
	             [0, "yahoo breaking news top officials and obama advisers study afghan war ap"],
	             [0, "nfl breaking news pft hasselbeck jones likely out again for seahawks"],
	             [0, "mobile breaking news report on cop killer inmate death to be released by alabama hashtagalnews rt"],
	             [0, "breaking news alex o loughlin moonlight mick has been laid to rest sorry moonlight fans"],
	             [0, "breaking news bad accident on harlem and archer just drove past a guy on the ground bleeding firetrucks and ambulances everywhere sademoticon"],
	             [0, "breaking news primetime emmys"],
	             [0, "yahoo breaking news obama health insurance mandate no tax increase ap"],
	             [0, "with celebs twittering breaking news is there no longer a need for publicists"],
	             [0, "breaking news iran sog sources have confirmed over phone that karoubi is in police cus webaddress former usmc"],
	             [0, "news thehill surprisedemoticon bama is open to newspaper bailout quote i am concerned that if "],
	             [1, "yahoo breaking news bank of america ceo lewis leaving by year end ap"],
	             [0, "rt sex predators offenders get halloween warning breaking news"],
	             [1, "rt breaking news president obama speaking live right now about shootings at fort hood"],
	             [0, "breaking news obama health care is dead exclamationpoint bank cnbc cnn fox bbc msnbc abc nbc cbs dobbs oprah at t news hashtagtcot"],
	             [1, "breaking news obama signs homebuyer tax credit extension president barack obama has approved the first time"],
	             [1, "it official breaking news obama signs homebuyer tax credit extension"],
	             [1, "breaking news moody confirm fiji government bankrupt real fiji news pic "],
	             [0, "gwen stefani breaking news the a list awards hosted by kathy griffin are "],
	             [1, "breaking news john edwards admits paternity i am quinn father"],
	             [0, "breaking news trojan condom company in talks with former sen john edwards for a commercial deal"],
	             [1, "doh exclamationpoint cnn breaking news former sen john edwards admits that he fathered a baby with his mistress something he earlier denied"],
	             [1, "obama announces new proposed banking regulations visit msnbc com for breaking news world news and news about th "],
	             [1, "trinidad bank stocks drop on obama plans european banking shares drop following pr breaking news story"],
	             [1, "breaking news update goldman executives defend their actions in senate hearing webaddress"],
	             [1, "breaking news goldman executive denies all wrongdoing hashtagnews"],
	             [0, "breaking news obama administration asks gov paterson ny first black gov not to seek"],
	             [0, "breaking news stadiums hotels warned to watch for terrorists ap"],
	             [0, "breaking news warren miller entertainment sues over namesake appearance elsewhere webaddress"],
	             [0, "rt breaking news barack obama wins the oscar for best picture at the academy awards"]
	         	]


	def initialize 
		# Lets create a dictionary of unique words and then we can
		# create our vectors. We are going to remove the punctuation.  
		@dictionary = Documents.map(&:last).map(&:split).flatten.uniq
		@dictionary = @dictionary.map { |x| x.gsub(/\?|,|\.|\-/,'') }

		# TODO: maybe, eliminate news word

		# Build binary feature vectors for each document
		#  - If a word is present in document, it is marked as '1', otherwise '0'
		#  - Each word has a unique ID as defined by 'dictionary'
		training_set = []
		Documents.map.each do |doc| 
		   features_array = @dictionary.map{|x| doc[1].include?(x) ? 1 : 0} 
		   training_set << [doc.first, Libsvm::Node.features(features_array)]
	  end

	  # Let's set the parameters for the svm algorithm
	  problem = Libsvm::Problem.new
		parameter = Libsvm::SvmParameter.new

		parameter.cache_size = 5 # in megabytes
		parameter.eps = 0.0001
		parameter.c   = 2
		parameter.kernel_type = 0 # This was chosen because of the accuracy of the ouputs. Tested with news.

		# Train classifier using training set
		problem.set_examples(training_set.map(&:first), training_set.map(&:last))
		@model = Libsvm::Model.train(problem, parameter)

	end

	# Returns 1 if the tweet contains a relevant new, O if not
	def predict (tweet)
		tweet_formated = tweet.split.map{ |x| x.gsub(/\?|,|\.|\-/,'') }
		features = @dictionary.map{|x| tweet_formated.include?(x) ? 1 : 0 }

		pred = @model.predict(Libsvm::Node.features(features))

		return pred
	end


end



































