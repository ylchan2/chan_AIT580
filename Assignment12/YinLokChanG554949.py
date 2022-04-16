###--------------------------------------
#Student Name: Yin Lok Chan 
#GNumber: G00554949 
# python 2.7
###--------------------------------------
import ssl
import pandas as pd
from bs4 import BeautifulSoup
from six.moves import urllib
import matplotlib.pyplot as plt

url = 'https://repo.vse.gmu.edu/ait/AIT580/580books.html'

ctx = ssl.create_default_context()
ctx.check_hostname = False
ctx.verify_mode = ssl.CERT_NONE

result = urllib.request.urlopen(url, context=ctx)
 #print(result)

soup = BeautifulSoup(result, 'html.parser')

books = []

array = soup.find_all('li')

for tag in array:
    book = []
    book.append(tag.find('booktitle').string)
    book.append(tag.find('author').string)
    book.append(tag.find('publisher').string)
    release = tag.find('release').string
    book.append(release)
    length = len(release)
    book.append(release[length - 4 :])
    
    books.append(book)

df = pd.DataFrame(books,columns=['booktitle','author','publisher','release','year'])


# question 1
df.to_csv('csv.csv')


# question 2 a. Print the frequency count for publishers (that is, how many books for each publisher).
print(df['publisher'].value_counts())

# b. Visualize the output of (a) using a chart of your own choice. 
print(df['publisher'].value_counts()).plot(kind='barh')

# c. Print the frequency count for year of publication. 
print(df['year'].value_counts())

# d. Visualize the output of (b) using a chart of your own choice
print(df['year'].value_counts()).plot(kind='barh')








    
