#boj 1260

import sys

n, m, v = sys.stdin.readline().split(" ")
n = int(n)
m = int(m)
v = int(v)

arr = [[0]* n for _ in range(n)]
for i in range(m):
    a,b = sys.stdin.readline().split(" ")
    arr[int(a)-1][int(b)-1] = 1
    arr[int(b)-1][int(a)-1] = 1

def bfs(v):
    visited = [v]
    check = [v]
    memory = [v]
    while len(check) !=0:
        small = check.pop(0)
        for i in range(n):
            if arr[small-1][i] == 1 and (i+1 not in visited):
                visited.append(i+1)
                check.append(i+1)
                memory.append(i+1)
    return visited

dfs_visited=[v]
dfs_check=[v]
def dfs(v):
    for i in range(n):
        if (i+1 not in dfs_visited) and arr[v-1][i]==1:
            dfs_visited.append(i+1)
            dfs(i+1)

                
dfs(v)
result = bfs(v)
for i in dfs_visited:
    if i ==dfs_visited[len(dfs_visited)-1]:
        print(i)
    else: print(i, end=" ")
for i in result:
    if i == result[len(result)-1]:
        print(i)
    else: print(i, end=" ")