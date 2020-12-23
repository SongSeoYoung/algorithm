#boj 1932

#삼각형 크기
n = int(input())

#삼각형 cost 입력받기
arr = []
for i in range(n):
    arr.append(list(map(int, input().split())))


#dp table
dp = [[0 for col in range(n)] for row in range(n)]   


#dp table 채우기
for i in range(n):
    if i==0:
        dp[i][0] = arr[i][0]
    else:
        for j in range(0, i+1):
            if j==0:
                dp[i][j] = dp[i-1][j] + arr[i][j]
            else:
                dp[i][j] = max(dp[i-1][j-1], dp[i-1][j]) + arr[i][j]

#max 값 return
max = dp[n-1][0]
for i in range(1, n): 
    if dp[n-1][i] > max:
        max = dp[n-1][i]
print(max)