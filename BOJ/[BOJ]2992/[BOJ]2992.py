n = input()
n = list(n)
for i in n:
    i = int(i)

for i in range(len(n)):
    if n[len(n)-1-i] > n[len(n)-1-(i+1)]:
        temp = n[len(n)-1-i]
        n[len(n)-1-i] = n[len(n)-1-(i+1)]
        n[len(n)-1-(i+1)] = temp
        break
    else:
        if n[len(n)-1-i] < n[len(n)-1-(i+1)]