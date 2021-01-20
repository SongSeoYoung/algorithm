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
        if cnt >= 2 and i == selected_nums[-1] and i == selected_nums[-2]:
            continue
        else:
            # print("마지막아님")
            arr.append(i)
            find(cnt + 1)
            arr.pop()
find(0)