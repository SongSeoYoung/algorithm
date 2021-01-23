str1 = list(input())
str2 = list(input())
# print(str1)
# print(str2)
dp = [[0 for col in range(len(str1))] for row in range(len(str2))]

#초기값
for j in range(len(str1)):
    if j==0:
        if str1[j] == str2[0]:
            dp[0][j] = 1
    else:
        if str1[j] == str2[0]:
            dp[0][j] = 1
for i in range(len(str2)):
    if i==0:
        if str2[i] == str1[0]:
            dp[i][0] = 1
    # else:
        # if str2[i] == str1[0]:
        #     dp[i][0] = dp[i-1][0] + 1
        # else:
        #     dp[i][0] = dp[i-1][0]
        # dp[i][0] = 1
print(dp)
for i in range(1, len(str2)):
    for j in range(1, len(str1)):
        if str1[j] == str2[i]:
            dp[i][j] = 1 + max(dp[i-1][j], dp[i][j-1])
        else:
            dp[i][j] = max(dp[i-1][j], dp[i][j-1])
print(dp)
print(dp[len(str2) - 1][len(str1) - 1])