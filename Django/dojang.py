# start, stop = map(int, input().split())
# i = start
# while True:
#     if i % 10 == 3:
#         i += 1
#         continue
#     if i > stop:
#         break
#     print(i, end=' ')
#     i += 1

# for i in range(5):
#     for j in range(5):
#         print('j:', j, sep='', end=' ')
#     print('i:', i, '\\n', sep='')

# for i in range(5):
#     for j in range(5):
#         if j <= i:
#             print('*', end='')
#     print()

# for i in range(5):
#     for j in range(5):
#         if j == i:
#             print('*', end='')
#     print()

# for i in range(5):
#     for j in range(5):
#         if j == i:
#             print('*', end='')
#         else:
#             print(' ', end='')
#     print()

# for i in range(5):
#     for j in range(5):
#         if j >= i:
#             print('*', end='')
#         else:
#             print(' ', end='')
#     print()

# count = int(input())
# for i in range(count):
#     for j in range(count-i-1):
#         print(' ', end='')
#     for j in range(2*i+1):
#         print('*', end='')
#     print()

#
# for i in range(1, 101):
#     if i % 3 ==0 and i % 5 ==0:
#         print('FizzBuzz')
#     elif i % 3 ==0:
#         print('Fizz')
#     elif i % 5 ==0:
#         print('Buzz')
#     else:
#         print(i)
#
#
# a = [[10, 20],
#      [30, 40],
#      [50, 60]]
#
# print(a[1][1]) = 40

# a = {i for i in range(1, 101) if i % 3 == 0}
# b = {i for i in range(1, 101) if i % 5 == 0}
# print(a & b)

# x, y = map(int, input().split())
#
# a = {i for i in range(1, x + 1) if x % i == 0}
# b = {j for j in range(1, y + 1) if y % j == 0}
#
# divisor = a & b
#
# result = 0
# if type(divisor) == set:
#      result = sum(divisor)
#
# print(result)
#
# n = int(input())
# text = input()
# words = text.split()
#
# if len(words) < n:
#     print('wrong')
# else:
#     n_gram = zip(*[words[i:] for i in range(n)])
#     for i in n_gram:
#         print(i)

# x = 10
# y = 3
#
# def get_q_r(a, b):
#     return(a // b, a % b)
#
# q, r = get_q_r(x, y)
# print(f'몫 = {q}, 나머지 :{r}')

# def print_num(a, b, c):
#     print(a)
#     print(b)
#     print(c)
#
# x = [10, 20, 30]
# print_num(*x)

# def print_num(*args):
#     for i in args:
#         print(i)
#
# print_num(10, 20, 30, 40)

# def personal_info(name, age, address):
#     print('이름 :' , name)
#     print('나이 :' , age)
#     print('주소 :' , address)
#
# x = {'name' : '홍길동', 'age' : 30, 'address' : '용산구'}
# print(personal_info(**x))

# def personal_info(**kwargs):
#     for kw, arg in kwargs.items()
#         print(kw, ': ', arg, sep'')

def personal_info(name, age, address='비공개'):
    print('이름 :' , name)
    print('나이 :' , age)
    print('주소 :' , address)

personal_info('홍길동', 30)