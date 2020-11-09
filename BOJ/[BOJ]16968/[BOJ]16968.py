## 백준 16968

n = input()
n = list(n)

sum = 1

for i in range(len(n)):
    if i==0:
        if n[i]=="c":
            sum *=26
        else:
            sum *=10
    else:
        if n[i]=="c":
            if n[i-1] =="c":
                sum *=25
            else:
                sum *=26
        else:
            if n[i-1] =="d":
                sum *=9
            else:
                sum *=10

print(sum)