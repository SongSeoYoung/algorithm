# 백준 1758
n = int(input())

arr=[]
for i in range(n):
    arr.append(int(input()))
arr.sort(reverse=True)

sum = 0
for i in range(n):
    s = arr[i] - (i+1 -1)
    if s>=0:
        sum +=s
    else:
        sum +=0
print(sum)