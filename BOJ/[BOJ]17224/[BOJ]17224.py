#백준 17224

N, K, L= map(int, input().split())


arr=[[0 for col in range(2)] for row in range(N)]
for i in range(N):
    arr[i][0], arr[i][1] = map(int, input().split())

cnt = 0
for i in range(N):
    if arr[i][1] > K:
        if arr[i][0] <=K:
            cnt +=100
        else:
            cnt +=0
    else:
        cnt +=140

print(cnt)