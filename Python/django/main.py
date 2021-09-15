# 가상환경 venv 확인
# pip install django
# django-admin startproject config .
# python manage.py migrate (데이터베이스 생성)
# python manage.py createsuperuser
# python manage.py runserver
# python manage.py startapp bookmark (앱 생성)
# python manage.py makemigrations bookmark
# python manage.py migrate bookmark
#
# a = int(input())
#
# count = 0
# for i in range(1, a):
# 	if i % 10 == 3 or i % 10 == 6 or i % 10 == 9:
# 		count += 1
# 		if i > 10 and i % 3 == 0:
# 			count += 2
# print(count)

# def fun(n):
# 	print(n)
#
# 	if n == 1:
# 		return n
#
# 	if n % 2 == 1:
# 		n =  3 * n + 1
# 		fun(n)
# 		return n
# 	else:
# 		n = n // 2
# 		fun(n)
# 		return n
# print(fun(3))

#정수 n을 만들 수 있는 경우의 수를 리턴하는 함수
# 1, 2, 3 만으로 만든다.

# 1 = 1						1개
# 2 = 1 + 1
#	  2					    2개
# 3 = 1+1+1
#     2+1/1+2        		4개
#	  3
# 4 = 1+1+1+1
#	  2+1+1/1+2+1/1+1+2
#	  2+2
#     3+1/1+3  				7개
# 5 = 1+1+1+1+1
#	  2+1+1+1/1+2+1+1/1+1+2+1/1+1+1+2
#	  2+2+1/2+1+2/1+2+2
#	  3+2/2+3
#	  3+1+1/1+3+1/1+1+3		13개

# f(n) = f(n-1)+f(n-2)+f(n-3)
# f(1) = 1, f(2) = 2, f(3) = 4, f(4) = 7, f(5) = 13
# def f(n):
# 	if n == 1:
# 		return 1
# 	if n == 2:
# 		return 2
# 	if n == 3:
# 		return 4
# 	if n >= 4:
# 		return f(n - 1) + f(n - 2) + f(n - 3)
# print(f(5))

# 동적계획법(DP) ex. 피보나치 수열

# def fibo(n):
# 	if n <= 1:
# 		return n
# 	return fibo(n-1) + fibo(n-2)
#
# print(fibo(4))
# Stack 과정을 거침


# DP 동적계획
# def fibo(n):
# 	cache = [0 for index in range(n + 1)]
# 	cache[0] = 0
# 	cache[1] = 1
#
# 	for idx in range(2, n + 1):
# 		cache[idx] = cache[idx-1] + cache[idx-2]
# 	return cache[n]

# 분할정복
# 퀵정렬(quick sort)

# def qsort(data):
# 	if len(data) <= 1:
# 		return data
# 	left, right = list(), list()
# 	pivot = data[0]
#
# 	for idx in range(1, len(data)):
# 		if pivot > data[idx]:
# 			left.append(data[idx])
# 		else:
# 			right.append(data[idx])
# 	return qsort(left) + [pivot] + qsort(right)
#
# 	# left = [i for i in data[1:] if pivot > i]
# 	# right = [i for i in data[1:] if pivot < i]
# 	# return qsort(left) + [pivot] + qsort(right)
#
# import random
# data_list = random.sample(range(100), 10)
# print(qsort(data_list))

# 병합정렬(분할정복기법)

# def spl(data):
# 	if len(data) <= 1:
# 		return data
# 	medium = len(data)//2
# 	left = data[:medium]
# 	right = data[medium:]
# 	return mur(spl(left), spl(right))
#
# def mur(left, right):
# 	left_idx, right_idx = 0, 0
# 	new_list = list()
# 	# case1 : left/right가 남아있을 때
# 	while left_idx < len(left) and right_idx < len(right):
# 		if left[left_idx] < right[right_idx]:
# 			new_list.append(left[left_idx])
# 			left_idx+=1
# 		else:
# 			new_list.append(right[right_idx])
# 			right_idx+=1
#
# 	#case2 : left만 남아있을 때
# 	while left_idx < len(left):
# 		new_list.append(left[left_idx])
# 		left_idx += 1
#
# 	# case3 : right만 남아있을 때
# 	while right_idx < len(right):
# 		new_list.append(right[right_idx])
# 		right_idx += 1
#
# 	return new_list
#
# import random
#
# data = random.sample(range(100), 10)
# print(spl(data))

# 이진 탐색
#
# def mid(data, search):
# # 왼쪽, 오른쪽을 나누고 mid값을 찾아내는 함수
# 	medium = data[len(data)//2]
# 	left = list(data[:len(data)//2])
# 	right = list(data[len(data) // 2:])
# 	new_list = list()
# 	while medium != search:
# 		if medium == search:
# 			return True
# 		#왼쪽에 있다
# 		elif medium > search:
# 			new_list.append(mid(left, search))
# 			return new_list
# 		#오른쪽에 있다
# 		elif medium < search:
# 			new_list.append(mid(right, search))
# 			return new_list
#
# def fin(data, search):
# 	if search == mid(data, search):
# 		print('맞습니다.')
#
# datalist = [1, 2, 3, 4, 5, 6, 7, 8, 9]
#
# fin(datalist, 3)

def binary_search(data, search):
	if len(data) == 1 and search == data[0]:
		return True
	if len(data) == 1 and search != data[0]:
		return False
	medium = len(data)//2
	if search == data[medium]:
		return True
	if search > data[medium]:
		return binary_search(data[medium:], search)
	else:
		return binary_search(data[:medium], search)

data = [1, 2, 3, 4, 5]
print(binary_search(data, 5))