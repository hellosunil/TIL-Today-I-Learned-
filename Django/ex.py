# 텍스트 파일 만들기
# f= open("sample_txt.txt", 'w')
# for i in range(1, 11):
#     data = "%d번째 줄입니다.\n" % i
#     f.write(data)
# f.close()

# 텍스트 파일 불러오기
# f = open("sample_txt.txt", 'r')
# while True:
#     line = f.readline()#한 줄씩 읽어옴
#     if not line:
#         break
#     print(line.strip('\n'), end='')
# f.close()

# 전체 데이터 불러오기
# f = open("sample_txt.txt", 'r')
# data = f.read()
# print(data)
# f.close()

# f = open("sample_txt.txt", 'r')
#
# data = f.read()
# print(data)
# f.close()

#x, y = map(int, input().split())

# class Calculator:#첫글자는 대문자
#     def __init__(self):
#         self.ans = 0
#
#     def add(self, a, b):
#         self.ans = a + b
#         return self.ans
#
#     def minus(self, a , b):
#         self.ans = a - b
#         return self.ans
#
#     def mul(self, a, b):
#         self.ans = a * b
#         return self.ans
#
#     def div(self, a, b):
#         self.ans = a / b
#         return self.ans
#
# cal1 = Calculator()
# cal2 = Calculator()
# print(cal1.add(3,4))
# print(Calculator().mul(5,6))

# class Person:
#     def __init__(self, age, name, sex):
#         self.age = age
#         self.name = name
#         self.sex = sex
#
#     def intro(self):
#         print("안녕, 내 이름은", self.name, "이고", self.age, "살이고", self.sex, "자야")
#
# #클래스의 상속
# class Worrior(Person):
#     def __init__(self, hp, mp):
#         self.hp = 300
#         self.mp = 30
#
# class Wizard(Person):
#     def __init__(self, hp, mp):
#         self.hp = 150
#         self.mp = 200
#
#     def attact(self):
#         if self.hp > 0:
#             if self.hp >= 150:
#                 self.hp -= 50
#             if self.hp < 150:
#                 self.hp -= 10
#             if self.hp - 150 <= 0:
#                 print("사망하였습니다.")
#         else:
#             pass
#     def cure(self):
#         self.hp += 100
#         self.mp -= 50
#
# # P1 = Person(20, "일일", "남")
# # P2 = Person(30, "일이", "여")
# # P3 = Person(40, "일삼", "남")
# # P4 = Person(50, "일사", "여")
# # P5 = Person(60, "일오", "남")
# W1 = Wizard(150, 200)
# W2 = Wizard(300, 2000)
# # P1.intro()
# # P2.intro()
# # P3.intro()
#
# print('체력:', W2.hp, '마나:', W2.mp)
# print('---------------------')
# W2.attact()
# print('W2가 공격당했습니다.')
# print('체력:', W2.hp, '마나:', W2.mp)
# print('---------------------')
# W2.cure()
# print('W2가 회복스킬을 사용했습니다.')
# print('체력:', W2.hp, '마나:', W2.mp)
# W2.attact()
# print('W2가 공격당했습니다.')
# print('체력:', W2.hp, '마나:', W2.mp)
# print('---------------------')
# W2.attact()
# print('W2가 공격당했습니다.')
# print('체력:', W2.hp, '마나:', W2.mp)
# print('---------------------')
# W2.attact()
# print('W2가 공격당했습니다.')
# print('체력:', W2.hp, '마나:', W2.mp)
# print('---------------------')
# W2.attact()
# print('W2가 공격당했습니다.')
# print('체력:', W2.hp, '마나:', W2.mp)
# print('---------------------')
# W2.attact()
# print('W2가 공격당했습니다.')
# print('체력:', W2.hp, '마나:', W2.mp)
# print('---------------------')
# W2.attact()
# print('W2가 공격당했습니다.')
# print('체력:', W2.hp, '마나:', W2.mp)
# print('---------------------')
# W2.attact()
# print('W2가 공격당했습니다.')
# print('체력:', W2.hp, '마나:', W2.mp)
# print('---------------------')
# W2.attact()
# print('W2가 공격당했습니다.')
# print('체력:', W2.hp, '마나:', W2.mp)
# print('---------------------')
# W2.attact()
# print('W2가 공격당했습니다.')
# print('체력:', W2.hp, '마나:', W2.mp)
# print('---------------------')
# W2.attact()
# print('W2가 공격당했습니다.')
# print('체력:', W2.hp, '마나:', W2.mp)
# print('---------------------')
# W2.attact()
# print('W2가 공격당했습니다.')
# print('체력:', W2.hp, '마나:', W2.mp)
# print('---------------------')
# W2.attact()
# print('W2가 공격당했습니다.')
# print('체력:', W2.hp, '마나:', W2.mp)
# print('---------------------')
# W2.attact()
# print('W2가 공격당했습니다.')
# print('체력:', W2.hp, '마나:', W2.mp)
# print('---------------------')
# W2.attact()
# print('W2가 공격당했습니다.')
# print('체력:', W2.hp, '마나:', W2.mp)
# print('---------------------')
# W2.attact()

# from module import *(or sum, dec 처럼 함수를 불러옴)
# print(add(3,4))
# print(dec(5,3))

# import module
# print(module.add(3,4))
# print(module.dec(5,3))

# 캐릭터 생성 - 이름만
# 공격 시, 경험치 획득
# 일정 이상 경험치 획득, 레벨 업

#
# a = int(input())
#
# for i in range(1, a + 1):
#     if a % i == 0:
#         print(i, end=' ')

# a = int(input())
#
# x = {i for i in range(1, a + 1) if i % 3 == 0}
# y = {j for j in range(1, a + 1) if j % 5 == 0}
#
# print(sum(x) + sum(y) - sum(x & y))

#     if a % i == 0:
#         print(i, end=' ')
#
# a = 0.44555
# print(round(a, 3))
#
# a, b, c = map(float, input().split())
#
# def avg(a, b, c):
# 	return (a + b + c) / 3
#
# if avg(a, b, c) >= 90:
# 	print(f'{avg(a, b, c):.2f} "A"')
# elif avg(a, b, c) >= 80 and avg(a, b, c) <= 90:
# 	print(f'{avg(a, b, c):.2f} "B"')
# elif avg(a, b, c) >= 70 and avg(a, b, c) <= 80:
# 	print(f'{avg(a, b, c):.2f} "C"')
# elif avg(a, b, c) >= 60 and avg(a, b, c) <= 70:
# 	print(f'{avg(a, b, c):.2f} "D"')
# else:
# 	print(f'{avg(a, b, c):.2f} "F"')

	# round로 하면 안됨. f-string 자릿수로 해야, 반올림 하라는 말 없었음

# a = int(input())
#
# x = {i for i in range(1, a + 1) if i % 10 == 3}
# y = {i for i in range(1, a + 1) if i % 10 == 6}
# z = {i for i in range(1, a + 1) if i % 10 == 9}
#
# print(len(x)+len(y)+len(z)+len(x&y)+len(x&z)+len(y&z)+len(x&y&z))
#
#
# print(31%10)

# a = int(input())
#
# count = 0
# for i in range(1, a):
#     for j in str(i):
#         if j == '3' or j == '6' or j == '9':
#             count += 1
# print(count)

y = int(input())
if ((y % 4 == 0 and y % 100 != 0) or y % 400 == 0):
    print('Leap Year')
else:
    print('Not Leap Year')
