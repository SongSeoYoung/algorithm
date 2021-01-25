info = list(map(int, input().split()))
n = info[0]
m = info[1]
arr = []
for i in range(m):
    arr.append(list(map(int, input().split())))

dx = [1,0]
dy = [0,1]
def dfs(x)
        for l in range(2):
            newX = dx[l] + x
            newY = dy[l] + y
            if newX >= 0 and newX < m and newY >=0 and newY < m :
                