# boj 11650

n = int(input())
arr = [[0 for col in range(2)] for row in range(n)] 

for i in range(n):
    a,b = map(int, input().split())
    arr[i][0] = a
    arr[i][1] = b

arr = sorted(arr, key = lambda x : (x[0], x[1]))
print(arr)

for i in range(n):
    print(arr[i][0], arr[i][1])
