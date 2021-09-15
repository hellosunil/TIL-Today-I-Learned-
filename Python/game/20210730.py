user = {
    "이름":"James",
    "국어": 90,
    "수학": 80,
    "영어": 70,
}

def sum(user):
    tot = 0
    for keys, values in user.items():
        #print(keys, values)
        if not "이름" in keys:
            tot += values

    return tot


tot = sum(user)

def ave(tot):
    return tot/3


print(user["name"]+"의 총점은 : ", tot)
print("평균은 :", ave(tot))