#boj 1463

#base case
K = []          #인덱스 번째를 해결하기 위한 연산 횟수 값을 받은 배열
K.append(0)     #K[0] = 0
K.append(0)     #K[1] = 0
K.append(1)     #K[2] = 1
K.append(1)     #K[3] = 1

#사용자로부터 입력받기
n = int(input())

#base case 이후 조건부터 각각의 값을 채워넣는다. dp 이용
for i in range (4,n+1):
    if i %2 ==0 and i%3 ==0:
        K.append(min(K[i-1] + 1, K[int(i/2)]+1, K[int(i/3)]+1))
    elif i%2 ==0 and i%3 !=0:
        K.append(min(K[i-1] + 1, K[int(i/2)]+1))
    elif i%2!=0 and i%3 ==0:
        K.append(min(K[i-1] + 1, K[int(i/3)]+1))
    else:
        K.append(K[i-1]+1)

print(K[n])