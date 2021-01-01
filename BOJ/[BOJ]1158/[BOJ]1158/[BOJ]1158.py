import sys

value = sys.stdin.readline().split(" ")
people = int(value[0])
number = int(value[1].rstrip("\n"))
queue = []
result = []
num = 0
for k in range(int(people)):
    queue.append(k + 1)

for t in range(people):
    num += number-1  
    if num >= len(queue):   
        num = num%len(queue)
 
    result.append(str(queue.pop(num)))

if len(result) == 1:
    print("<"+result[0]+">")
else:
    print("<"+ ", ".join(result)[:] + ">", sep=" ")