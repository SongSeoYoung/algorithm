a,b = map(int, input().split())

arr1 = []
arr2 = []
for i in range(a):
    arr1.append(input())
for i in range(b):
    arr2.append(input())

#set 교집합 연산자
result = list(set(arr1)&set(arr2))
result.sort()

print(len(result))
for i in range(len(result)):
    print(result[i])