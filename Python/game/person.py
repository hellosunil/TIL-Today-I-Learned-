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

showData(w1)
print(w1.hp, w1.mp)
print("---------------------------")
showData(w2)
print(w2.hp, w2.mp)
print("---------------------------")
w1.attact()
print("Babarian이 공격당했습니다 !")
showData(w1)
print(w1.hp, w1.mp)
print("---------------------------")
showData(w2)
print(w2.hp, w2.mp)
print("---------------------------")
