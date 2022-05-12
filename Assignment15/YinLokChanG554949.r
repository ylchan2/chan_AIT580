#install.packages("selectr")
#install.packages("xml2")
#install.packages("rvest")
#install.packages("plyr")
library("selectr")
library("xml2")
library("rvest")
library("plyr")

url <- "https://nytimes.com"
webpage <- read_html(url)
print(webpage)
# Just sample code. 
titles <- html_nodes(webpage, ".css-1pvrrwb")
titles_notag <- gsub("<.*?>", "", titles) 


news <- html_nodes(webpage,".summary-class")
news_notag <- gsub("<.*?>", "", news) 

# Assignment 15 Task 1: write scripts that extract "titles" and "news summary" of articles out of the scrapped data. 
# Then, print them out using "print()" statement. 
print(titles_notag)
print(news_notag)


# Assignment 15 Task 2: write scripts that oraganize your data as dataframe with column names, "title" and "news summary", respectively.
# Then, save this dataframe as a CSV file. Name it as "NYT_titles.csv". 
length(titles_notag) <- length(news_notag)

dd=data.frame(title=c(titles_notag),news_summary=c(news_notag))

print(dd)


write.csv(dd,file="C:/VMShared/b.csv")


# Assignment 15 Task 3: once you save the CSV file, commit and push it back to your repository (no R scripts involved for Task 3). 
