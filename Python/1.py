# a, b, c, d = map(int, input().split(' '))
# if 0 < a < 100 and 0 < b < 100 and 0 < c < 100 and 0 < d < 100 :
#     if a+b+c+d/4 >= 80 :
#         print('합격')
#     else:
#         print('불합격')
# else :
#     print('노인정')


# x = "awesome"
# def myfunc() :
#     x = "여기는 어디?"
#     print("python is " + x)
#
# print

# b = "    Hello, World   !"
# print(b.split(","))
#
# button = int(input())
#
# if button == 1:
#     print('콜라')
# elif button == 2:
#     print('사이다')
# elif button ==3:
#     print('사이다')
# else:
#     print('제공하지 않는 메뉴')

# #15-3 연습문제
#
# x=int(input())
#
# if 11<x<20 :
#     print('11~20')
# elif 21<x<30 :
#     print('21~30')
# else:
#     print('아무것도 해당하지 않음')

# age = int(input())
# balance = 9000
# if 7 <= age <=12 :
#     print(int(balance)-650)
# elif 13<= age <=18 :
#     print(int(balance)-1050)
# else:
#     print(int(balance)-1250)
#
# for i in range(10, 0, -1):
#     print('Hello, world!', i)

# count = int(input('반복할 횟수를 입력하세요 : '))
# for i in range(count):
#     print('H W', i)
#
# for letter in reversed('Python'):
#     print(letter, end=" ")

# count = int(input())
# for i in range(count):
#     print('i의 값은', end=' ')
#     print(i)
#
# x = [49, -17, 25, 102, 8, 62, 21]
# for i in x:
#     print(i*10, end=' ')

# # 구구단
# x = int(input())
# for i in range(1, 10):
#     print(x, "*", i, "=" , x*i)

# count = int(input())
# i = 0
# while i < count:
#     print('Hello world!')
#     i +=1
#(난수형태에서 주로 사용)

# list = [] 배열 형식 -> tuple, set, dictionary
# thelist = ["apple", 1, 2]
# thelist[-1] = "difndkf"
# thelist[1:3] = ["dnfkdf", 'dfee'] #1~2번에 추가
# thelist[0:2] =[]
# print(thelist[:])

#thelist.append("dkfjkd") 하면 뒷쪽으로 붙음
#thelist.insert(1,"orange") 끼워넣기 원하는 항에
# list1 = ["a", "b", "c"]
# list2 = ["d", "e", "f"]
# # list1 += list2
# # list1.extend(list2)
# tuple은 내용 변경 불가능

# list1.remove()
# list1.pop(0:2)
# del list1[0]
# list1.clear()
# list1 = []
# for x in list1:
#     print(x)

# fruits = [apple, banana, cherry, kiwi]
# newlist = []
#
# for x in fruits:
#     if "a" in x:
#         newlist.append(x)
#
# --> a가 들어있는 것만 newlist에 담는다.
# newlist = ['apple', 'banana']
#
# newlist = [x for x in fruits if x != "apple"]
# apple만 빼고 담겠다
# list1.sort()
# list1.sort(reverse = True) 차순의 역배열
# list1.reverse() 그냥 역순
#
# list1 = ["a", "b", "c"]
# list2 = ["d", "e", "f"]
# list3 = list1
# list3[0] = "h"
# print(list3)
# print(list1)
# list3 = list1.copy()
# print(list3)

# for x in list1:
#     list2.append(x)
# print(list2)

# list3 = list1 + list2
# print(list3)

# list4 = []
# list5 = list1 + list4
# print(list5)

# list5 = list1 + []
# print(list5)
#
# fruits = [1, 2, 3, 9, 4, 9, 9]
# x = 0
# for i in fruits:
#     if i == 9:
#         x += 1
# print(x)
#
# set1 = {"apple", "banana", "cherry", "apple"}
# set2 = {"apple", "cherry", "apple", 'pineapple'}
# # set3 = set1|set2
# # # set1.remove("apple")
# # print(set3)
# print(set1|set2)
#
# dict1 = {
#     "brand" : "ford",
#     "price" : 49.9,
#     "year" : 1964
# }
# print(dict1["brand"])
#
# i = 1
# while i < 6:
#     print(i)
#     if (i==3):
#         break
#     i += 1

# def my_function(country = "korea"):
#     print("dkfldf" + country)
# my_function("korea")
# my_function("Nor")
# my_function()

# minsoo = {
#     "영어" : 90,
#     "수학" : 80,
#     "과학" : 70,
#     "사회" : 60,
#     "국어" : 90
# }
# def sum(dict):
#     sum = 0
#     for i in minsoo:
#         sum += minsoo[i]
#     return sum
#
# def average(dict):
#     sum = 0
#     for i in minsoo:
#         sum+= minsoo[i]
#     return sum / len(minsoo)
#
# y = str(input())
# if y == "총점" :
#     print(sum(minsoo))
# if y == "평균" :
#     print(average(minsoo))
# 민수,
#
#
# scores = {
#     "학생1" : {
#     "이름" : "민수",
#     "수학" : 80,
#     "과학" : 70,
#     "사회" : 60,
#     "국어" : 90
#     },
#     "학생2" : {
#     "이름" : "수정",
#     "수학" : 80,
#     "과학" : 70,
#     "사회" : 20,
#     "국어" : 90
#     },
#     "학생3" : {
#     "이름" : "오이",
#     "수학" : 10,
#     "과학" : 70,
#     "사회" : 60,
#     "국어" : 90
#     }
# }
#
# def sum(dict):
#     sum = 0
#     for i in scores:
#         sum += scores[i][]
#         i가 충족되면, 근데 학생1, 학생2인데?
#         학생n 3개를 돌려야??
#         여기도 변수가 두 개, 반복문도 두개
#         break continue로 안되지 않나...?
#     return sum
#
# def average(dict):
#     sum = 0
#     for i in scores:
#         sum+= scores[i][]
#     return sum / len(scores)
#
# x = str(input("이름을 입력하세요 : "))
# y = str(input("총점 혹은 평균을 입력하세요 : "))
#
#
# if x == sores["이름"][y]
# 이름의 값이 일치한다면
# 학생1의 이름이 일치한다면,
# y값이 총점이라면 총점을 구한다
#
#
#     y == "총점" :
#     print(sum(minsoo))
# if y == "평균" :
#     print(average(minsoo))
#
# print(scores["학생1"]["이름"])



#
# def sum(scores):
#     tot = 0
#     for keys, values in scores.items():
#         if not "이름" in keys:
#             tot += values
#     return tot
#
# tot = sum(scores)
# def average(tot):
#     return tot / 4
#
#
# print(scores["이름"] + "의 총점은 : ", tot)
# print("평균은 :", average(tot))

#
# minsoo = [40, 50, 20, 60, 89]
#
#
# def sum(list):
#     sum = 0
#     for i in range(0, len(minsoo)):
#         sum += minsoo[i]
#     return sum
#
# print(sum(minsoo))

# def sum(dict):
#     sum = 0
#     for i in minsoo:
#         sum += minsoo[i]
#     return sum


# for i in range(1, 11):
#     print(i, '번째 줄입니다.')
# #
# a = [[j+1 for j in range(2)] for i in range(3)]
# print(a)

# for i in range(0:10000:100)
#     print(i)
#

n = int(input())
a = list(map(int, input().split()))


for i in a:
	if i < i + 1:
      return i
    else:
        return i + 1