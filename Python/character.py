class Character:
    def __init__(self):
        self.name = 'noname'
        self.hp = 100
        self.exp = 0
        self.lv = 1
    def setDefault(self, name):
        self.name = name

    def attack(self):
        if self.hp > 10:
            self.hp -= 10
        if self.hp <= 10:
            print("사망하였습니다.")
        else:
            pass

    def cure(self):
        self.hp += 100
        self.mp -= 50

    def damage
        return -= damagePoint


class Worrior(Character):
    def __init__(self):
        self.name = 'noname'
        self.hp = 100
        self.exp = 0
        self.lv = 1
        self.damagePoint = 10
    def setDefault(self, name):
        self.name = name

class Archer(Character):
    def __init__(self):
        self.name = 'noname'
        self.hp = 100
        self.exp = 0
        self.lv = 1
    def setDefault(self, name):
        self.name = name

class Monster:
    def __init__(self):
        self.name = 'noname'
        self.hp = 30
        self.expPoint = 50

    def setDefault(self, name):
        self.name = name

    def damage(self):
        self.hp -= damagePoint

job, nam = map(str, input('전사, 궁수 중 하나를 입력하세요. : ,이름을 입력하세요 :').split())

if job == '전사':
    C1 = Worrior()
    C1.setDefault(nam)
if job == '궁수':
    C2 = Archer()
    C2.setDefault(nam)

    몬스터
    hp: 30
    exp: 50

    attack: 10 > lvup > 15



캐릭터 속성 변경 가능
탐험 >> 몬스터 퇴치 혹은 사망
휴식 >> 회복
레벨업 >> 공격력이 향상, hp 증가
        100 당 렙업

damage : 10> lvup > 5
heal : 휴식 1회당 10 회복

