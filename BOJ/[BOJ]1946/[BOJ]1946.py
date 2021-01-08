# boj 1946
import sys

testcase = int(sys.stdin.readline())
count = []
for i in range(testcase):
    count.append(0)
for i in range(testcase):
    
    people = int(sys.stdin.readline())
    p = []
    for l in range(people):
        p.append(list(map(int, sys.stdin.readline().split(" "))))
    p.sort(key=lambda x: x[0])

    for j in range(len(p)):
        check = True
        if j ==0:
            count[i] += 1
        else:
            for l in range(1, j):
                if l == j-1:
                    if check :
                        print(j, "인덱스에서 증가")
                        count[i]+=1
                elif p[j][1] < p[l][1]:
                    # print(j, "인덱스에서")
                    # print("count 증가")
                    # count[i] += 1
                    # break
                    
                    continue
                else:
                    check = False
                    continue

for i in count:
    print(i)
        