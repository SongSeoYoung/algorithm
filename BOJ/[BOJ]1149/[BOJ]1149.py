#1149 boj

N = int(input())        # 총 집의 갯수 입력
arr = [[0 for col in range(3)] for row in range(N)]     #집 마다 비용이 담아져있는 2차원 리스트 생성
#집 비용을 2차원 리스트에 담기
for i in range(N):
    a,b,c = map(int, input().split())
    arr[i][0] = a
    arr[i][1] = b
    arr[i][2] = c

# dp 값이 저장될 2차원 리스트 생성
dp = [[0 for col in range(3)] for row in range(N)]


for i in range(N):
    if i==0:
        for j in range(3):
            dp[i][j] = arr[i][j]
    else:
        for j in range(3):
            if j==0:
                dp[i][j] = min(dp[i-1][j+1], dp[i-1][j+2]) + arr[i][j]
            elif j==1:
                dp[i][j] = min(dp[i-1][j-1], dp[i-1][j+1]) + arr[i][j]
            else:
                dp[i][j] = min(dp[i-1][j-1], dp[i-1][j-2]) + arr[i][j]


#마지막 줄의 최솟값 찾아서 print
minV = dp[N-1][0]
for i in range(1, 3):
    if minV > dp[N-1][i]:
        minV = dp[N-1][i]
print(minV)