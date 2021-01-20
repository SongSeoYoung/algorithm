info = list(map(int, input().split()))
k = info[0]
n = info[1]
arr= []
def find(cnt):
    if cnt == n:
        for i in arr:
            print(i, end=" ")
        print()
        return

    for i in range(1, k+1):
        arr.append(i)
        find(cnt + 1)
        arr.pop()
find(0)