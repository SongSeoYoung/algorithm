import heapq

n = int(input())
heap = []
for i in range (n) :
    heapq.heappush(heap, int(input()))

sum = 0
while len(heap) != 1:
    pop1 = heapq.heappop(heap)
    pop2 = heapq.heappop(heap)

    sum += pop1 + pop2
    heapq.heappush(heap, pop1 + pop2)

print(sum)