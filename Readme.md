# Financial Predictor
Recent research studies have shown that Twitter’s mood correlates somehow to DJIA closing values. For me, everything started when, at my course of Social Media and Machine Learning, I had to analyze one of the Bollen et al. research papers about this topic. Twitter mood predicts the stock market.

Bollen’s research claimed close to 90 percent accuracy in predicting the stock’s daily changes. When people seemed calm, the Dow went up. When they became anxious, it went down.

This paper had a lot of media impact, and a lot of financial institutions started to pay attention to social media tools. I had to present the algorithm that made this possible, so if you want, you can take a look at my Prezi

With a little of research I found a startup that recently received 30M dollars of investment. Dataminr ’s algorithms mine tweets that contain information that can affect the stock market. So, what comes to my mind is, why not mixing the two systems and see what happens? I am working on analyzing Twitter mood’s (based on Bollen paper I am focused on calm dimension) and at the same time mining Twitter data looking for relevant information for DJIA closing values. After that let’s see what is the correlation (Granger correlation) and how can an efficient system be built using machine learning techniques! So here is my research project proposal

 

Anyone who wants to join is more than welcome, specially for the finance area. Right now I am talking with a CME contact and professors for mining important news that can affect the Dow, but definitely I need some help here! Also, thanks to Aron Culotta, I have a great twitter dataset to test the mining techniques.

# Install
First you need to install the following tools
- [Json tool](https://github.com/zpoley/json-command)
- [Ruby language bindings for LIBSVM](https://github.com/febeling/rb-libsvm)

# Dataset format
- For the sentiment classification
	- You need to store your files at dataset/sentiment . 
	- Each file will store tweets of a day prefiltered as the Filter.txt at the Twitter API folder. The format should separate each tweet with JSON format (separated by '{}'). There is an example at this section.
	- There is a helper to know how to separate a .log or a .txt file with a lot of tweets from a period bigger than a day at the dataset folder

# More info
For more information, like how to collect the data check my blog:
- [How To Collect Tweets, Step By Step.](http://lolapriego.com/blog/how-to-collect-tweets-step-by-step/)
- [General Info](http://lolapriego.com/blog/can-twitter-predict-the-stock-market/)
