#백준 14501 번

N = int(input())

arr = [list(map(int, input().split()))for i in range(N)]

print(arr)

dp = [0 for i in range(N)]

for i in range(N):
    if arr[i][0] !=1:
        if i+arr[i][0]-1 <= N:
            dp[i+arr[i][0]-1] = dp[i+arr[i][0]-1-1] + max(arr[i][1], dp[i+arr[i][0]-1])
            if i==0:
                dp[i] = 0
            else:
                print(i)
                dp[i] = dp[i-1]
        elif dp[i] !=0:
            print(i)
            temp = dp[i]
            print("이 때의dp", dp[i], temp, dp[i-1])
            dp[i] = dp[i-1] + temp

    elif arr[i][0] == 1:
        if dp[i] !=0:
            dp[i] = max(dp[i], arr[i][1])
        else:
            dp[i] = dp[i-1] + arr[i][1]

print(dp)

