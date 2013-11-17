class Scorer
	def score(relative_path)
		# From POMS model. Tense mood dimension
		poms = ['tense', 'shaky', 'on edge', 'panicky', 'relaxed', 'uneasy', 'restless', 'nervous', 'anxious']
		wordNet = ['suspense', 'alarmed', 'fearful', 'afraid', 'presage', 'afraid', 'hysterical', 'intimidate']

		text = File.open(File.expand_path( Dir["./*"][1], File.dirname(__FILE__)), "r:iso-8859-1:utf-8")
		tweets = text.read().split('}')
		score = 0

		tweets.each do |tweet|
			poms.each do |adj|
				if(tweet.match(Regexp.new(adj, Regexp::EXTENDED | Regexp::IGNORECASE)))
					score += 2
				end
			end
			wordNet.each do |adj|
				if(tweet.match(Regexp.new(adj, Regexp::EXTENDED | Regexp::IGNORECASE)))
					score += 1
				end
			end
		end

		p score
	end
end





