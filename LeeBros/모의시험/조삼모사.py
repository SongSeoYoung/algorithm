n = int(input())
arr = []
for i in range(n):
    arr.append(list(map(int, input().split())))

both=[]
diff=[]
for h in range(0,n,w):
    for w in range(1,n,2):
        both.append(arr[h][w] + arr[w][h])