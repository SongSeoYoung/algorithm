n = int(input())
arr = []
for i in range(n):
    arr.append(list(map(int, input().split())))
dp = [[0 for col in range(n)] for row in range(n)]

#초기값
for i in range(n):
    if i == 0:
        dp[0][i] = arr[0][i]
        dp[i][0] = arr[i][0]
    else:
        dp[0][i] = dp[0][i-1] + arr[0][i]
        dp[i][0] = dp[i-1][0] + arr[i][0]


#dp 채우기
for i in range(1, n):
    for j in range(1, n):
        dp[i][j] = max(dp[i-1][j], dp[i][j-1]) + arr[i][j]
        # print("dp[i][j]=", dp[i][j])
print(dp[n-1][n-1])