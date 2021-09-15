
class Character:
    def __init__(self):
        self.name = "no name"
        self.hp = 100
        self.exp = 0
        self.lv = 1
        self.damagePoint = 10

    def attack(self):
        return self.damagePoint

    def damaga(self):
        pass

    def heal(self):
        pass

    def lvup(self):
        for i in range(0,10000000,100)
        if self.exp >= i:
            self.lv += 1
            self.hp += 10
            self.damagePoint += 10


class Monster:
    def __init__(self):
        self.name = "Monster"
        self.hp = 30
        self.expPoint = 50

    def attack(self):
        pass

    def dead(self):
        print(f"{self.name}을/를 퇴치 하였습니다.!")

    def damage(self, damagePoint):
        self.hp -= damagePoint
        if self.hp <= 0:
            self.dead()

