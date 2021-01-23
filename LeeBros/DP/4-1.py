info = list(map(int, input().split()))
n = info[0]
m = info[1]
coins = list(map(int, input().split()))


dp = [0 for i in range(m)]
for i in range(m):

    if i+1 in coins:
        dp[i] = 1
    else:
        check = []
        for c in coins:
            if c < i+1:
                if dp[i-c] != -1:
                    check.append(dp[i-c] + 1)
        if len(check) == 0:
            dp[i] = -1
        else:
            dp[i] = min(check) 
print(dp[m-1])