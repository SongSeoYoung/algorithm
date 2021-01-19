info = list(map(int, input().split()))
size = info[0]
start_point = info[1:]

arr = []
for i in range(size):
    arr.append(list(map(int, input().split())))

dy = [0,0,-1,1]
dx = [-1,1,0,0]
x = start_point[0] - 1 
y = start_point[1] - 1
result = [arr[x][y]]
while True:
    maxIndex = []
    max = arr[x][y]

    for i in range(4):
        newX = x + dx[i]
        newY = y + dy[i]
        if (newX >=0 and newY >= 0) and (newX <size  and newY < size):
            if arr[newX][newY] > max:
                max = arr[newX][newY]
                maxIndex.append([newX, newY])
                break
    if max == arr[x][y] :

        break
    else:
        result.append(max)
        for i in range(len(maxIndex)):
            if max == arr[maxIndex[i][0]][maxIndex[i][1]]:
                x = maxIndex[i][0]
                y = maxIndex[i][1]
for i in result:
    print(i, end=" ")