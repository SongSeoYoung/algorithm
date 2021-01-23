n = int(input())
arr = list(map(int, input().split()))
dp = []
for i in range(n):
    if i == 0:
        dp.append(arr[i])
    else:
        dp.append(max(dp[i-1] + arr[i], arr[i]))
print(max(dp))