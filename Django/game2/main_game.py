from Character_game import *

def start():
    print('던전월드에 오신걸 환영합니다. 캐릭터를 생성해주세요')

start()

username = input("캐릭터 이름을 생성하세요 :")
user1 = Character()
user1.name = username
print(f'{user1.name}님 환영합니다!')
print(f'{user1.name}님은 현재 {user1.lv}레벨입니다')

def goTown():
    print('마을에 도착했습니다. 가실 곳을 입력해주세요', '(던전, 휴식, 사냥터, 훈련)')
    togo = input()
    if togo == '던전':
        dungeon()
    elif togo == '휴식':
        # if user1.hp <= self.hp - 10
        #     user1.heal()
        user1.heal()
        print(f'휴식을 취해서 hp가 10 상승, 현재 hp는 {user1.hp}입니다.')
        goTown()
    elif togo == '사냥터':
        hunting()
    elif togo == '훈련':
        user1.training()
        print(f'{user1.name}이 훈련을 해서 hp가 {user1.hp}으로 하락, 공격력이 {user1.damagePoint}로 상승하였습니다.')
        goTown()
    else:
        print("y 혹은 n 을 입력하세요.")
def dungeon():
    hmm = input('던전에 들어가기엔 레벨이 너무 낮습니다. \n 마을로 돌아가시겠습니까? y/n')
    if hmm == 'y':
        goTown()
    if hmm == 'n':
        print('그럼 레벨이나 키우시죠.')
        hunting()

def hunting():
    print('사냥터에 도착했습니다.')
    print('몬스터가 나타났습니다. 공격하시겠습니까? y/n')
    yesh = input()
    if yesh == 'y':
        yeshunt()
    if yesh == 'n':
        print('마을로 이동합니다.')
        goTown()
    else:
        print("y 혹은 n 을 입력하세요.")

def yeshunt():
    monster1 = Monster()
    monster1.name = "다람쥐"
    print(monster1.name, monster1.hp, monster1.expPoint)
    print(f'{user1.name}의 현재 경험치는 {user1.exp}입니다.')
    while monster1.hp > 0:
        damagepoint = user1.attack()
        monster1.damage(damagepoint)
        print(monster1.hp)
    user1.exp += monster1.expPoint
    print(f'{user1.name}의 경험치가 {user1.exp}을/를 달성했습니다!')
    i = 0
    while i < 10000:
        i += 100
        if user1.exp >= i:
            user1.exp = 0
            user1.lvup()
            print(f'{user1.name}의 레벨이 {user1.lv}로 상승했습니다!')
    goTown()

goTown()
