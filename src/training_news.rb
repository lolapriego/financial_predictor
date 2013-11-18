# The best way to create a training dataset would be to use ruby to accomplish
# the task.
# Let take our documents and create word vectors out of them.
# This include news from 2009 to 2010, hand labeled to see if after the new a spike on
# Dow Jones closing values was produced.
# I've included labels for these already.  1 signifies that
# the new was relevant, 0 means that it wasn't.
#
documents = [[1, "news JPMorgan Chase to pay $4.5 billion in mortgage security deal"],
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
         	 [1, "Government shutdown prompts acts of defiance across U.S."],
         	 [1, "Government shutdown prompts acts of defiance across U.S."],
         	 [1, "Government shutdown prompts acts of defiance across U.S."],
         	 [1, "Government shutdown prompts acts of defiance across U.S."],
         	 [1, "Government shutdown prompts acts of defiance across U.S."],
         	 [1, "Government shutdown prompts acts of defiance across U.S."],
         	 [1, "Government shutdown prompts acts of defiance across U.S."],
         	 [1, "Government shutdown prompts acts of defiance across U.S."],
         	 [1, "Government shutdown prompts acts of defiance across U.S."],
         	 [1, "Government shutdown prompts acts of defiance across U.S."],
         	 [1, "Government shutdown prompts acts of defiance across U.S."],
         	 [1, "Government shutdown prompts acts of defiance across U.S."],
         	 [1, "Government shutdown prompts acts of defiance across U.S."],
         	 [1, "Government shutdown prompts acts of defiance across U.S."],
         	 [1, "Government shutdown prompts acts of defiance across U.S."],
         	 [1, "Government shutdown prompts acts of defiance across U.S."],
         	 [1, "Government shutdown prompts acts of defiance across U.S."],
         	 [1, "Government shutdown prompts acts of defiance across U.S."],
         	 [1, "Government shutdown prompts acts of defiance across U.S."],
         	 [1, "Government shutdown prompts acts of defiance across U.S."],
         	 [1, "Government shutdown prompts acts of defiance across U.S."],
         	]

# Lets create a dictionary of unique words and then we can
# create our vectors. We are going to remove the punctuation.  
dictionary = documents.map(&:last).map(&:split).flatten.uniq
dictionary = dictionary.map { |x| x.gsub(/\?|,|\.|\-/,'') }

# Build binary feature vectors for each document
#  - If a word is present in document, it is marked as '1', otherwise '0'
#  - Each word has a unique ID as defined by 'dictionary'
feature_vectors = documents.map(&:last) { |doc| dictionary.map{|x| doc.include?(x) ? 1 : 0} }