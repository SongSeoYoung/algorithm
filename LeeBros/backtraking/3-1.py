
info = list(map(int, input().split()))
number = info[0]
select = info[1]
arr = []
def findResult(cnt, start):
    if cnt == select:
        if all(arr[i] <arr[i+1] for i in range(len(arr)-1)):
            for i in arr:
                print(i, end=" ")
            print()
            return
    
    for i in range(start, number+1):
            arr.append(i)
            # print(arr, "Arr append")
            findResult(cnt + 1, start+1)
            # print(arr, "arr")
            arr.pop()
            # print(arr, "Arr")
        
findResult(0, 1)