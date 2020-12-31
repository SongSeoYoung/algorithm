#boj 5052
import sys

testcase = int(sys.stdin.readline())
result = []
for i in range(testcase):
    arr = []
    number = int(sys.stdin.readline())
    for _ in range(number):
        arr.append(sys.stdin.readline().rstrip("\n"))
    arr.sort()
    for k in range(len(arr)):
        if k!= len(arr) - 1 :
            if arr[k+1][0:len(arr[k])] == arr[k]:
                result.append("NO")
                break
        if k ==len(arr)-1 :
            result.append("YES")
for i in result:
    print(i)
