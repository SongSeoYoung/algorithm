# boj 2156


## 2차원 리스트로 풀다가 메모리 초과당했습니당;;;
'''
n = int(input())

cost = []
for i in range(n):
    cost.append(int(input()))

dp = [[0 for col in range(n)] for row in range(n)]

for i in range(n):
    for j in range(i):
        if i-j==2:
            dp[i][j] = dp[i-1][j]
        elif i>=4 and dp[i-3][j] == dp[i-4][j] and dp[i-3][j] !=0:
            dp[i][j] = dp[i-1][j]
        else:
            dp[i][j] = dp[i-1][j] + cost[i]
    dp[i][i] = cost[i]


max = dp[n-1][0]
for i in range(1, n):
    if max < dp[n-1][i]:
        max = dp[n-1][i]
print(max)
'''


# 1차원 리스트로 풀어보기
n = int(input())

cost = []
for i in range(n):
    cost.append(int(input()))

dp = [0]
dp.append(cost[0])
if n>1:
    dp.append(cost[0]+cost[1])


# 경우의 수 3개 중 가장 큰 비용 값을 선택해서 dp 에 넣음
# 1. 나를 선택하는 경우 
#   1) 나-1 선택하는 경우 + dp[i-2]
#   2) 나-2 선택하는 경우 + dp[i-3]
# 2. 나를 선택하지 않는 경우 -> dp[i-1]


for i in range(3, n+1):
    dp.append(max(dp[i-1], dp[i-2]+cost[i-1], cost[i-2]+cost[i-1]+dp[i-3]))

print(dp[-1])