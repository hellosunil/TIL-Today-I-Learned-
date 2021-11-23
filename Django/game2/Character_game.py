
class Character:
    def __init__(self):
        self.name = 'no name'
        self.hp = 100
        self.maxHp = 100
        self.exp = 0
        self.lv = 1
        self.damagePoint = 10


    def attack(self):
        return self.damagePoint

    def damage(self):
        pass

    def heal(self):
        if self.maxHp > self.hp:
            self.hp += 10
        else:
            print("no heal")

    def lvup(self):
        self.lv += 1
        self.hp += 10
        self.damagePoint += 10
        self.maxHp += 10
        self.hp = self.maxHp

    def training(self):
        self.hp -= 50
        self.damagePoint += 5

class Monster:
    def __init__(self):
        self.name = 'monster'
        self.hp = 30
        self.expPoint = 50

    def attack(self):
        pass

    def dead(self):
        print(f'{self.name}을/를 무찔렀습니다!')

    def damage(self, damagePoint):
        self.hp -= damagePoint
        if self.hp <= 0:
            self.dead()

