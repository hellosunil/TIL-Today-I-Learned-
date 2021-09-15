from selenium import webdriver
import time
from selenium.webdriver.common.keys import keys
from bs4 import BeautifulSoup


driver = webdriver.Chrome()
# driver.get("https://game.naver.com/esports/record/lck/team/lck_2021_summer") #사이트 열기
driver.get("https://www.youtube.com")
#텍스트 자료 가져오기
# e = driver.find_elements_by_class_name("record_list_wrap__A8cnT")[0].text
# print(e)

#이미지 자료 가져오기
# e = driver.find_elements_by_class_name("record_list_thumb_logo__1s1BT")[0].get_attribute('src')
# print(e)
#
# e = driver.find_elements_by_class_name("style-scope yt-img-shadow")[0].get_attribute('src')
# print(e)




# e = driver.find_elements_by_class_name('nav')[9]
# e.click()
# e = driver.find_elements_by_class_name("snb_related_service")[0]
# e.click()

# 로그인 막혀있음
# e = driver.find_elements_by_class_name('gb_3.gb_4.gb_9d.gb_3c')[0]
# e.click()
# e = driver.find_elements_by_class_name('whsOnd.zHQkBf')[0]
# e.send_keys('')
# e = driver.find_elements_by_class_name('VfPpkd-vQzf8d')[0]
# e.click()


# e = driver.find_elements_by_class_name('int')[1]
# e.click()
# e.send_keys('')
# e = driver.find_elements_by_class_name('btn_global')[0]
# e.click()

# e.send_keys(keys.)
# time.sleep(3)
# driver.close()
