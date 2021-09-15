from bs4 import BeautifulSoup
from selenium import webdriver
import time
from urllib.parse import quote_plus

baseUrl = "https://www.google.com/search?q="
inputUrl = input("검색어를 입력하세요 :")
url = baseUrl + quote_plus(inputUrl)

print(url)

driver = webdriver.Chrome()
driver.get(url)

html = driver.page_source
soup = BeautifulSoup(html, 'html.parser')

sources = soup.select('div > div> div> a > h3')

for source in sources:
    print(source.text)
    print('--------------------------------------------------------')

f = open("sample2.txt", "w")

f.write(inputUrl + '의 구글 검색 결과' + "\n" + "\n")

for source in sources:
    data = source.text + "\n"
    f.write(data)
f.close()

time.sleep(2)
driver.close()