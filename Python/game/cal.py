class Calculator:

    def __init__(self):
        self.ans = 0

    def add(self, a, b):
        self.ans = a + b
        return self.ans

    def minus(self, a, b):
        self.ans = a - b
        return self.ans

    def mul(self, a, b):
        self.ans = a * b
        return self.ans

    def div(self, a, b):
        self.ans = a / b
        return self.ans


class Wizard:
    def fireball(self):
        pass


cal1 = Calculator()
cal2 = Calculator()

print(cal1.add(3,4))
print(cal1.mul(4,2))
print(cal2.add(5,6))
#
#
# num1 = 3
# num2 = 4
# print(num1 + num2)
#
#
# def add(num1, num2):
#     return num1 + num2
#
# print(add(5,49))