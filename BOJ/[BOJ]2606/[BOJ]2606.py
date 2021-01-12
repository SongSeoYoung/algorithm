# boj 2178

import sys
n = int(sys.stdin.readline())
m = int(sys.stdin.readline())
arr = [[0]*n for i in range(n)]
for i in range(m):
    a,b = sys.stdin.readline().split(" ")
    arr[int(a)-1][int(b)-1]=1
    arr[int(b)-1][int(a)-1]=1

#bfs 풀이
def bfs(v):
    count = 0
    visited= [v]
    check = [v]
    while len(check)!=0:
        small = check.pop(0)
        for i in range(n):
            if arr[small-1][i]==1 and (i+1 not in visited):
                visited.append(i+1)
                check.append(i+1)
                # print(i+1, "is 바이러스감염")
                count +=1
    return count

# dfs 풀이
dfs_visited=[1]
dfs_count = 0
def dfs(v):
    global dfs_count
    for i in range(n):
        if arr[v-1][i]==1 and (i+1 not in dfs_visited):
            dfs_visited.append(i+1)
            dfs(i+1)
            dfs_count+=1
dfs(1)
print(dfs_count)

print(bfs(1))
        