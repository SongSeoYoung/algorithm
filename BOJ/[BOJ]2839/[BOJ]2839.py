#백준 2839

n = int(input())

# dp = [0 for i in range(n+1)]
# dp[0] = 0
# dp[1] = 0
# dp[2] = 0
# dp[3] = 1
# dp[4] = -1
# dp[5] = 1
# dp[6] = 2
# dp[7] = -1
# dp[8] = 2
# for i in range(9, n+1):
#     if dp[i-3] +1 ==0:
#         dp[i] = dp[i-5] +1
#     elif dp[i-5] +1 ==0:
#         dp[i] = dp[i-3] +1
#     else:
#         dp[i] = min(dp[i-3]+1, dp[i-5]+1)

dp = []
dp.append(0)
dp.append(0)
dp.append(0)
dp.append(1)
dp.append(-1)
dp.append(1)
dp.append(2)
dp.append(-1)
dp.append(2)
for i in range(9, n+1):
    if dp[i-3] +1 ==0:
        dp.append(dp[i-5] +1)
    elif dp[i-5] +1 ==0:
        dp.append(dp[i-3] +1)
    else:
        dp.append(min(dp[i-3]+1, dp[i-5]+1))

print(dp[n])
    