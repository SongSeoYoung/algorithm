# boj 11399
import sys

n = map(int, sys.stdin.readline())
arr = list(map(int, sys.stdin.readline().split(" ")))

arr.sort()
sum = 0
dp = []
dp.append(arr[0])
for i in range(1, len(arr)):
    dp.append(dp[i-1] + arr[i])

for i in dp:
    sum += i
print(sum)
