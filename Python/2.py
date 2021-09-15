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
# a = input("이름을 입력하세요 : ")
# b = input("총점 혹은 평균을 입력하세요 : ")
#
# def sum(n):
#     num = 0
#     for key, value in n.items():
#         if key == '이름':
#             continue
#         else:
#             num += value
#     return num
#
# def avg(n): return sum(n)/4
#
# for i in list(scores):
#     if a == (scores[i]['이름']):
#         if b == '총점':
#             print(f'{a}의 총점은 {sum(scores[i])}입니다.')
#         else:
#             print(f'{a}의 평균은 {avg(scores[i])}입니다.')

def qsort(data_list):


    if len(data_list) <= 1:
        return data_list
    pivot = data_list[0]
    left = [i for i in data_list[1:] if i <= pivot]
    right = [j for j in data_list[1:] if j > pivot]

    return qsort(left) + [pivot] + qsort(right)


import random
data_list = random.sample(range(100), 10)

print(qsort(data_list))

