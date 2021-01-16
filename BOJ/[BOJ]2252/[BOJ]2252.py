import sys
n,m = map(int, sys.stdin.readline().split(" "))
people = [[] for _ in range(n+1)]
in_degree = [0] * (n+1) #진입차수계산

for _ in range(m):
    a, b = map(int, sys.stdin.readline().split())
    people[a].append(b)
    in_degree[b] += 1       #나를 가르키는게 하나 있다고 진입차수 증가해주기

queue = []
for i in range(1, n+1):
    if in_degree[i] == 0:
        #진입차수가 0이면 
        queue.append(i)


while queue:
    current = queue.pop(0)
    print(current, end=" ")

    for i in people[current]:       #내가 가르키고있던 노드에 대한 진입점을 줄이기위해 (나는 정렬되었으니까)
        in_degree[i] -= 1
        if in_degree[i] == 0:
            queue.append(i)