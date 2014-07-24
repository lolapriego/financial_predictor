# Financial Predictor
Recent research studies have shown that Twitter’s mood correlates somehow to DJIA closing values. For more infomation look at Bollen's paper.
Using machine learning algorithms related to SVM, I am trying to demonstrate that you need more than Twitter mood to predict stock market. The interesting part is the financial information that you can retrieve from Twitter. This system run the same algorithm over sentiment and financial data separately so  it can determine which one have more correlation with the stock market.

Bollen’s research claimed close to 90 percent accuracy (...) in predicting the stock’s daily changes. When people seemed calm, the Dow went up. When they became anxious, it went down. His paper had a lot of media impact, and a lot of financial institutions started to pay attention to social media tools. I am going to use a similar technique but focused only in calm dimension.

With a little of research I found a startup that recently received 30M dollars of investment. Dataminr ’s algorithms mine tweets that contain information that can affect the stock market. This is not the only one. You can also check http://www.thestocksonar.com or [this article](http://www.fastcoexist.com/1681873/twitter-can-predict-the-stock-market-if-youre-reading-the-right-tweets) or [SNTMNT startup](http://www.sntmnt.com/products/).

- For information about how the system works check [this post](http://lolapriego.com/blog/can-twitter-predict-the-stock-market/)
- If you want to collaborate you are more than welcome.

Thanks to Aron Culotta, he is this project's mentor.

# Install
First you need to install the following tools
- [Json tool](https://github.com/zpoley/json-command)
- [Ruby language bindings for LIBSVM](https://github.com/febeling/rb-libsvm)
- [A ruby gem that retrieves stock quotes from Yahoo](https://github.com/nas/yahoo_stock)

# Dataset format
- You will need this part
- For the sentiment classification
	- You need to store your files at dataset/sentiment . 
	- Each file will store tweets of a day prefiltered as the Filter.txt at the Twitter API folder says. The format should separate each tweet with JSON format (separated by '{}'). There is an example at this repo.
	
- For mining relevant news
	- You need to store your files at dataset/news
	- Each file will store tweets of a day prefiltered as the Filter.txt at the Twitter API folder says. The format should separate each tweet with JSON format (separated by '{}'). There is an example at this repo.
	- Each tweet should be formatted exactly as the example of this repo, for now. This way the script will be able to parse only the text of the tweet

- ##### There is a helper to know how to separate a .log or a .txt file with a lot of tweets from a period bigger than a day at the dataset folder

# Usage
Please do not forget to look at the Dataset section
- Go to src folder and run the script finance_predictor.rb. You need to give it two arguments: start date and end date. 
- It will show the sentiment score, the news alarms score and finally the Dow Jones Closing values for that period
- DO NOT FORGET to previously sort your files at the dataset folder. This should correspond with the period of the arguments.
- Example: $ ruby finance_predictor.rb "2013-11-02" "2013-11-10"

# More info
For more information, like how to collect the data check my blog:
- [How To Collect Tweets, Step By Step.](http://lolapriego.com/blog/how-to-collect-tweets-step-by-step/)
- [General Info](http://lolapriego.com/blog/can-twitter-predict-the-stock-market/)
