f = open("sample_text.txt", 'a')
for i in range(11, 21):
    data = "%d line \n" % i
    f.write(data)

f.close()