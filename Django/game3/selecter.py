import random
import time


# # 랜덤 값 출력하기
# a = random.random()
# print(a)
#
# # 정수 값 출력하기
# for i in range(1, 11):
#     num = random.randint(1, 2)
#     #1부터 2까지
#     print(num)
#
# for i in range(1, 11):
#     num = random.randrange(1, 2)
#     #1부터 1까지
#     print(num)
#
# # 실수 값 출력하기
# for i in range(1, 11):
#     num = random.uniform(1, 2)
#     print(num)

# lunch = ['중식', '한식', '일식', '기타']
# for i in range(1, 5):
#     menu = random.choice(lunch)
#     print(menu)

# lotto = []
# for i in range(1, 51):
#     lotto.append(i)
#
# for i in range(1, 6):
#     menu = random.choice(lotto)
#     print(menu)


# 1. 랜덤으로 숫자를 생성합니다.
# 2. 유저가 숫자를 입력합니다.
# 3. 큰지 작은지 알려줍니다.
# 4. 유저가 정답을 맞출 때까지 반복합니다.
# 5. 정답이면 정답이라고 출력합니다.

# num = random.randint(1, 100)
# for i in range(100):
#     a = int(input('숫자를 입력해서 맞춰 보세요. :'))
#     if a == num:
#         print('정답입니다!')
#         break
#     elif a > num:
#         print('입력한 숫자보다 작습니다.')
#         print('숫자를 다시 입력해주세요 :')
#         continue
#     elif a < num:
#         print('입력한 숫자보다 큽니다.')
#         print('숫자를 다시 입력해주세요 :')
#         continue
#
# def hello(count):
#     hello(count)
#     if count == 0:
#         return
#     print('hello, world!', count)
#     count -= 1
#     hello(count)
# hello(5)
#ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
# def game(level):
#     lv = level
#     check = 1
#     numlist = []
#     for x in range(1,lv+5):
#         numlist.append(x)
#     random.shuffle(numlist)
#
#     for num in numlist:
#         print(num)
#
#     time.sleep(2)
#     for item in range(30):
#         print()
#
#     # a, b, c, d, e = map(int, input('숫자를 입력하세요 :').split())
#     # if a == numlist[0] and b == numlist[1] and c == numlist[2] and d == numlist[3] and e == numlist[4]:
#     #     print('맞았습니다.')
#     # else:
#     #     print('틀렸습니다.')
#
#     for num in numlist:
#         checkNum = int(input('입력하세요 :'))
#         if checkNum == num:
#             continue
#         else:
#             print('틀렸습니다.')
#             check = 0
#             break
#
#     if check:
#         print('다음 단계로 진행하겠습니다.')
#         time.sleep(1)
#         game(level+1)
#     else:
#         print(f"END. 당신의 레벨은 {lv}입니다.")
#
#
# game(1)

import re

#txt = "The rain in Spain"
# x = re.search("^The.*Spain$", txt)
# x = re.findall("[a-c]", txt)
#a에서 c까지 찾아줘
#x = re.findall("[^A-Z]", txt)
#A에서 Z까지 제외하고 출력
#print(x[1])
#
# p = re.compile('[a-z]+')
# m = p.findall('python123abcde')
# print(m)