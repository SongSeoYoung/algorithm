import sys
info = list(map(int, input().split()))
n = info[0]
m = info[1]
arr = [[0 for col in range(n)] for row in range(n)]
for i in range(m):
    a,b = sys.stdin.readline().split(" ")
    arr[int(a)-1][int(b)-1] = 1
    arr[int(b)-1][int(a)-1] = 1

dfs_visited=[1]
count = 0
def dfs(v):
    global count
    for i in range(n):
        if (i+1 not in dfs_visited) and arr[v-1][i] == 1:
            # print(i+1, "is visited")
            dfs_visited.append(i+1)
            dfs(i+1)
            count += 1
dfs(1)
print(count)