from selenium import webdriver
from bs4 import BeautifulSoup
from urllib.parse import quote_plus # 한글 검색 url

#장고에 접근하기
import os
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'config.settings')
import django
django.setup()


from shop.models import Category



def search():
    baseUrl = 'https://www.youtube.com/results?search_query='
    plusUrl = input('search :')
    url = baseUrl + quote_plus(plusUrl)
    driver = webdriver.Chrome()
    driver.get(url)
    html = driver.page_source
    soup = BeautifulSoup(html, 'html.parser')


    list = soup.select('#video-title')
    data = {}
    for i in list:
        data[i.text] = i.get('href')

    driver.close()

    return data

if __name__ == '__main__':
    shop_data = search()
    for title, k in shop_data.items():
        Category(name=title, meta_description=k, slug=k).save()
