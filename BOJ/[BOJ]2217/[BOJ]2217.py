# boj 2217

import sys

number = sys.stdin.readline()
number = int(number)

arr = []
for i in range(number):
    n = sys.stdin.readline()
    arr.append(int(n))
arr.sort(reverse=True)
check = arr[len(arr)-1] * len(arr)

for i in range(len(arr)):
    arr[i] *= i+1
print(max(arr))