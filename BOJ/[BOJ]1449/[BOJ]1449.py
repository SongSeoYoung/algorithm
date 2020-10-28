#백준 1449

N,L = input().split()
N = int(N)
L = int(L)
place = list(map(int, input().split()))
place.sort()

s = place[0]
count =1 #처음 하나를 붙였다고 가정하고 시작
for i in place:
    ##양쪽으로 0.5씩 여유를 줘양하니 총 1cm가 빠진다고 생각하면 됨.
    len = s + L -1
    if i > len:
        count+=1
        s = i
    else:
        continue

print(count)