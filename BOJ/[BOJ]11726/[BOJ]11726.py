#백준 11726

n = int(input())
DP = []
DP.append(0)
DP.append(1)
DP.append(2)

for i in range(3, n+1):
    DP.append(DP[i-1] + DP[i-2])

print(DP[n] % 10007)