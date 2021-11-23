from bs4 import BeautifulSoup
from selenium import webdriver
import time
from urllib.parse import quote_plus



baseUrl = "https://www.youtube.com/results?search_query="
#"https://www.google.com/search?q="

plusUrl = input('검색어를 입력하세요 :')
url = baseUrl + quote_plus(plusUrl)

print(url)

driver = webdriver.Chrome()
driver.get(url)

html = driver.page_source
soup = BeautifulSoup(html, 'html.parser')

titleLists = soup.select('#video-title')
#soup.select('div a')
# # class = .

for title in titleLists:
    print(title.get('title') + " : " + title.get('href'))
    print('--------------------------------------------------------')

time.sleep(2)
driver.close()

f = open("sample.txt", "w")

for title in titleLists:
    data = title.get('title') + " : " + title.get('href') + "\n"
    f.write(data)
f.close()



#f = open("sample.txt", "w")
#data = f.read()
#f.wirte(data)
#f.close()