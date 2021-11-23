f = open("sample_text.txt", 'r', encoding="UTF-8")

# 한줄씩 호출하기
# while True:
#     line = f.readline()
#     if not line:
#         break
#     print(line.strip("\n"), end=": ")
#     # print(line)

# 전체 내용 한번에 호출하기
data = f.read()
print(data)


f.close()