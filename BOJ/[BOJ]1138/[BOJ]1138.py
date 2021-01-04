# boj 1138
import sys

n = int(sys.stdin.readline())
array = list(map(int, sys.stdin.readline().split(" ")))
result=[0 for i in range(n)]
check = [i for i in range(n)]
for i in range(len(array)):
    result[check[array[i]]] = i + 1
    del check[array[i]]
for i in result:
    print(i, end=" ")