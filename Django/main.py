# # std = {
# #     'yoo': {
# #         'kor': 90,
# #         'math': 90,
# #         'eng': 100,
# #         'sci': 80,
# #         'his': 95
# #     },
# #     'Ahn': {
# #         'kor': 80,
# #         'math': 90,
# #         'eng': 70,
# #         'sci': 85,
# #         'his': 80
# #     },
# #     'Kang': {
# #         'kor': 30,
# #         'math': 80,
# #         'eng': 85,
# #         'sci': 100,
# #         'his': 50
# #     },
# #     'Kim': {
# #         'kor': 90,
# #         'math': 80,
# #         'eng': 85,
# #         'sci': 75,
# #         'his': 60
# #     },
# #     'Koo': {
# #         'kor': 50,
# #         'math': 80,
# #         'eng': 100,
# #         'sci': 30,
# #         'his': 60
# #     },
# #     'a': {
# #         'kor': 90,
# #         'math': 80,
# #         'eng': 85,
# #         'sci': 75,
# #         'his': 60
# #     },
# #     'b': {
# #         'kor': 90,
# #         'math': 90,
# #         'eng': 100,
# #         'sci': 90,
# #         'his': 90
# #     },
# #     'c': {
# #         'kor': 90,
# #         'math': 80,
# #         'eng': 85,
# #         'sci': 75,
# #         'his': 60
# #     },
# #     'd': {
# #         'kor': 80,
# #         'math': 80,
# #         'eng': 85,
# #         'sci': 75,
# #         'his': 85
# #     },
# #     'e': {
# #         'kor': 90,
# #         'math': 80,
# #         'eng': 85,
# #         'sci': 55,
# #         'his': 50
# #     }
# # }
# #
# #
# # def sum(n):
# #
# #     num = 0
# #     for key, value in n.items():
# #
# #         if key == 'name':
# #             continue
# #         else:
# #         num += value
# #
# #     return num
# #
# #
# # def avg(n): return sum(n)/5
# #
# #
# # def rate(n):
# #     if avg(n) > 90:
# #         return 'A'
# #     elif avg(n) < 90 and avg(n) > 80:
# #         return 'B'
# #     elif avg(n) < 80 and avg(n) > 70:
# #         return 'C'
# #     else:
# #         return 'D'
# #
# #
# # for key, value in std.items():
# #     print(value)
# #     print(f'이름: {key} 총점 : {sum(value)} 평균 : {avg(value)} 등급 : {rate(value)}')
#
#
#
scores = {
    "학생1": {
        "이름": "민수",
        "수학": 80,
        "과학": 70,
        "사회": 60,
        "국어": 90
    },
    "학생2": {
        "이름": "수정",
        "수학": 80,
        "과학": 70,
        "사회": 20,
        "국어": 90
    },
    "학생3": {
        "이름": "오이",
        "수학": 10,
        "과학": 70,
        "사회": 60,
        "국어": 90
    }
}

def sum(n): return sum[x for x in n.values() if str(x).isdigit()]
# 문자열이 정수를 나타내면 True 를 반환하고 그렇지 않으면 False 를 반환

def hap(dic):

    num = 0
    for key, value in dic.items():
        if key == "이름":
            continue
        else:
            num += value
    return num


def avg(dic): return hap(dic)/4


def comp(dic, nam):
    for val in dic.values():
        if val == nam:
            print(f'이름:{nam}', end=' ')
            return True

def comp2(dic, op):
    for i in op:
        if i == '총점':
            print(f'총점:{hap(dic)}', end=' ')
        if i == '평균':
            print(f'평균:{avg(dic)}', end=' ') #둘다 뽑아야 할 수도 있으니까 동일선상에서 조건문 작성


name = input("이름: ")
opt = [x for x in input("원하는 값 입력(총점, 평균): ").split()]
print(type(name))
for key, value in scores.items():   # 학생n과 dict로 나눔
    if comp(value, name):           # comp(value, name)이 true값이면, comp2를 실행해라?
        comp2(value, opt)


#List Comprehension
# oldlist = [1, 2, 'A', False, 3]
# newlist = [i * i for i in oldlist if type(i) == int]
# print(newlist)


class Person:
    def __init__(self):
        self.name = "John"
        self.age = 0
        self.gender = "man"

    def setDefault(self, name, age, gender):
        self.name = name
        self.age = age
        self.gender = gender

class Worrior(Person):
    def __init__(self):
        self.hp = 300
        self.mp = 30

    def attact(self):
        self.hp -= 10

class Wizard(Person):
    def __int__(self):
        self.hp = 80
        self.mp = 300

def showData(Person):
    print(Person.name, Person.age, Person.gender)

w1 = Worrior()
w2 = Worrior()
w1.setDefault("Babarian", 130, "Man")
w2.setDefault("BigBoy", 300, "Man")
