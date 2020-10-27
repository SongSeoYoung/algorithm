total = int(input())
cost = []
for i in range(total):
    number = int(input())
    cost.append(number)

D=[]
D.append(cost[0])
D.append(cost[0]+ cost[1])
D.append(max(D[0] + cost[2], cost[1] + cost[2]))

for i in range(3, total):
    D.append(max(cost[i] + D[i-3] + cost[i-1], D[i-2] + cost[i]))

print(D[total-1])