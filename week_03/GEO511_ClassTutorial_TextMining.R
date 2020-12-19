#initialize

install.packages("rtweet")
install.packages("tibble")
install.packages("tidyverse")
install.packages("tidytext")
install.packages("tokenizers")

library(rtweet)
library(tibble)
library(tidyverse)
library(tokenizers)

#have to get setup with a twitter developer API
userTrump<-lookup_users("realDonaldTrump")
tweetTrump<-get_timelines("realDonaldTrump",n=100,include_rts=FALSE)

#tibble can been viewed as a cleaned up data frame creating function that helps with removing wonky feature conversions
tweetTextTrump<-tibble(1:56,tweetTrump$text)
write.csv(tweetTextTrump,"GEO511_TrumpTweet_Sample.csv")
#will upload csv to repo if anyone is interested in holding onto this example, however please don't share outside of class
#rename to make column titles more simple
names(tweetTextTrump)<-c("tweet","text")
#needed for unnesting tokens
str(tweetTextTrump)

library(tidytext)

#tokenization fundamentally is a sorting function, in this instance I will be splitting sentences into words.
#Also conveniently standardizes character cases and drops punctuation - very valuable for cleaning text
tweetTextTrump_unnestTokens<-tweetTextTrump %>%
  unnest_tokens(word,text)
#without removing stop words
wordFreqTweetTrump<-tweetTextTrump_unnestTokens%>%
  count(word, sort=TRUE)

tweetTextTrump_NoSW<-tweetTextTrump_unnestTokens %>%
  anti_join(stop_words)
#with removing stopwords
wordFreqTweetTrump_NoSW<-tweetTextTrump_NoSW%>%
  count(word, sort=TRUE)



