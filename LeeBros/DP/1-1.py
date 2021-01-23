n = int(input())

def fibo(n):
    dp = [0,1]
    for k in range(2, n+1):
        dp.append(dp[k-1] + dp[k-2])
    return dp[n]
print(fibo(n))
