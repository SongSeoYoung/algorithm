#백준 9095

number = int(input())
arr=[]
for i in range(number):
    arr.append(int(input()))

dp = [1,2,4]
for k in range(3, max(arr)):
        dp.append(dp[k-1] + dp[k-2] + dp[k-3])

for i in range(number):
    print(dp[arr[i]-1])