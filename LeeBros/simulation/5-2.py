info = list(map(int, input().split()))
size = info[0]
turn = info[1]
arr = []
for i in range(size):
    arr.append(list(map(int, input().split())))

dx = [0,0,-1,1,1,-1,-1,1]
dy = [-1,1,0,0,-1,1,-1,1]
for i in range(turn):
    for k in range(size*size + 1):
        #find the index number
        maxValue = 0
        for h in range(size):
            for w in range(size):
                #위치를 찾으면
                if arr[h][w] == k:
                    # maxValue == arr[h][w]
                    maxIndex=[]
                    for i in range(len(dx)):
                        newX = w + dx[i]
                        newY = h + dy[i]
                        print(newY, newX)
                        if newX >= 0 and newY >=0 and newX < size and newY <size:
                            print(maxValue, "max", arr[newY][newX], "비교할대상")
                            if maxValue < arr[newY][newX]:
                                print("max value is change")
                                maxValue = arr[newY][newX]
                                maxIndex.append([newY, newX])
                                print(maxValue)
                    print(arr[h][w], "에서 찾은 ",maxValue)
                    print(arr)
                    for i in range(len(maxIndex)):
                        if maxValue == arr[maxIndex[i][0]][maxIndex[i][1]]:
                            temp = arr[h][w]
                            arr[h][w] = maxValue
                            arr[maxIndex[i][0]][maxIndex[i][1]] = temp
                    print(arr)
print(arr)   

                                        
            