from character import Character, Monster
from game import *

start()

name = input("이름을 정해주세요: ")
user01 = Character()
user01.name = name
print(f"{user01.name}님 환영합니다!")
print(f"{user01.name}님은 현재 LV{user01.lv}입니다")

goAdventure()
while True:
    ans = attackMonseter()
    if ans == 'y':
        mon01 = Monster()
        mon01.name = "몬스터"
        print(mon01.name, mon01.hp, mon01.expPoint)
        while mon01.hp > 0:
            damage = user01.attack()
            mon01.damage(damage)
            # print(mon01.name, mon01.hp, mon01.expPoint)
        user01.exp += mon01.expPoint
        print(f"{user01.name}의 경험치는 {user01.exp}입니다.")
        if user01.exp >= 100:
            print(f'레벨이 {user01.lv}으로 올랐습니다.')
            print(f'공격력이 {user01.damagePoint}으로 올랐습니다.')
            print(f'체력이 {user01.hp}으로 올랐습니다.')
    elif ans == 'n':
        print("도망에 성공하였습니다.")
        print("마을로 돌아왔습니다.")
        goAdventure()
    else:
        print("y 혹은 n 을 입력 해주세요")
        goAdventure()