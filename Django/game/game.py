

def start():
    print("파이썬 월드에 오신걸 환영합니다. 캐릭터를 생성해주세요.")


def goAdventure():
    print("모험을 시작하시겠습니까? yes(y) or no(n)")
    confirm = input()
    if confirm == 'y':
        print("월드로 이동합니다.")
    elif confirm == 'n':
        print("설정으로 다시 돌아갑니다.")
    else:
        print("y 혹은 n 을 입력 해주세요")


def attackMonseter():
    print("몬스터를 만났습니다. 공격하시겠습니까? yes(y) or no(n)")
    confirm = input()
    return confirm