info = list(map(int, input().split()))
n = info[0]
m = info[1]
k = info[2]

arr = []
for i in range(n):
    arr.append(list(map(int, input().split())))

#높이체크
check = []
for i in range(k-1, k+m-1):
    for j in range(n):
        if arr[j][i] == 1:
            check.append(j)
            break
if len(check) != 0:
    maxHeight = min(check)
    blockHeight = maxHeight - 1
else:
    blockHeight = n - 1

#블록 떨어트리기
for w in range(k-1, k+m-1):
    arr[blockHeight][w] = 1

#프린트
for i in range(n):
    for j in range(n):
        print(arr[i][j], end=" ")
    print()
