## 백준 2479번

### 1차구현
첫 시도는 1차원 배열을 이용해서 구하고자했다. 예를들어 아래 코드와 같이..

```python
total = int(input())
cost = []
for i in range(total):
    number = int(input())
    cost.append(number)


dp = [0 for i in range(number)]
count = 0
for i in range(total):
    if i==0:
        dp[i] = cost[i]
        count+=1
    elif i==1:
        dp[i] = dp[i-1] + cost[i]
        count+=1
        
    elif i==total-1:
        dp[i] = dp[i-1] + cost[i]
    elif i==total-2:
        dp[i] = dp[i-2] + cost[i]

    else:
        if count !=2:
            dp[i] = max(dp[i-2], dp[i-1]) + cost[i]
            if max(dp[i-2], dp[i-1]) == dp[i-1]:
                count+=1
            else:
                count =0
        else:
            dp[i] = dp[i-2] + cost[i]
            count = 0

print(dp)
print(dp[total-1])

```


예시로 주어진 하나의 문제만 맞고 나머지는 다 틀렸는지 자꾸 오류라고해서 어쩔 수 없이 인터넷의 힘을 빌려 정답을 찾아봄
알고보니 내가 문제를 잘못읽었다. 처음 시작점은 점수에 포함되지 않는다는게 연속3칸에 카운팅하지않는 것이라고 이해해버렸다


### 2차구현
그래서 다시 보니 내 코드가 틀린 것을 알 수 있었고,, 1차원 배열로 어떻게 해야할지 몰라서 2차원 배열을 사용한 정답을 보고 공부함

(확실히 저번보다는 난이도가 있는 것 같다ㅠㅠ 하이팅..)


```python
##2차원배열로 구현
#D[i][j] = 현재까지 j개의 계단을 연속으로 밟고 i번째 계단까지 올라갔을 때 점수합의 최대 값. (i cost도 더해준다)

total = int(input())
cost = []
for i in range(total):
    number = int(input())
    cost.append(number)

D=[[0 for i in range(total+1)]for p in range(total+1)]
D[1][1] = cost[0]
D[1][2] = cost[0]
D[2][1] = cost[1]
D[2][2] = cost[0]+ cost[1]
for i in range(3, total+1):
    for k in range(1,3):
        if k==1:
            D[i][k] = max(D[i-2][1], D[i-2][2]) + cost[i-1]
        else:
            D[i][k] = D[i-1][1] + cost[i-1]

print(max(D[total][1], D[total][2]))

```　

그런데 더 간단한 방법이 많다는 것을 알게되었다. (알고리즘 공부 이렇게 해답보면서 공부하는거 맞나..? ㅠㅠㅠㅠ)

## 3차시도
3차시도에 대한 코드는 파일로 업로드!! 아 내가 첨 생각한거랑 분명 같은 접근방향인데.. 
오랫동안 생각 안하고 안된다고 바로 정답지 보는 나쁜 습관을 기른 것 같다.
예전에 수학 문제 풀었던 것 처럼 끈기있게 고민해볼것 :) 👈오늘의 느낀 점