number = int(input())
arr = list(map(int, input().split()))
dp = [0 for i in range(number)]

for i in range(number):
    # print(dp)
    if i ==0:
        dp[i] = 1
    else:
        for l in range(i, -1, -1):
            if arr[l] < arr[i]:
                # print(arr[i], "에서 뒤로 돌아가면서 찾는데", arr[l], "보다 ㅋ커서")
                dp[i] = dp[l] + 1
                break
            else:
                dp[i] = 1
print(max(dp))