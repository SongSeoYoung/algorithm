info = list(map(int, input().split()))
n = info[0]
days = info[1]

arr = [[0 for col in range(n)] for row in range(days)]
dp = [[0 for col in range(n)] for row in range(days)]
for i in range(n):
    li = list(map(int, input().split()))
    for h in range(li[0]-1, li[1]):
        arr[h][i] = li[2]

for i in range(1,n):
    
