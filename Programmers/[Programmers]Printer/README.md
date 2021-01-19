## 문제 설명

<br>

일반적인 프린터는 인쇄 요청이 들어온 순서대로 인쇄합니다. 그렇기 때문에 중요한 문서가 나중에 인쇄될 수 있습니다. 이런 문제를 보완하기 위해 중요도가 높은 문서를 먼저 인쇄하는 프린터를 개발했습니다. 이 새롭게 개발한 프린터는 아래와 같은 방식으로 인쇄 작업을 수행합니다.  
<br>

1. 인쇄 대기목록의 가장 앞에 있는 문서(J)를 대기목록에서 꺼냅니다.  

2. 나머지 인쇄 대기목록에서 J보다 중요도가 높은 문서가 한 개라도 존재하면 J를 대기목록의 가장 마지막에 넣습니다.  

3. 그렇지 않으면 J를 인쇄합니다.  

<br>

예를 들어, 4개의 문서(A, B, C, D)가 순서대로 인쇄 대기목록에 있고 중요도가 2 1 3 2 라면 C D A B 순으로 인쇄하게 됩니다.  
내가 인쇄를 요청한 문서가 몇 번째로 인쇄되는지 알고 싶습니다. 위의 예에서 C는 1번째로, A는 3번째로 인쇄됩니다.  

현재 대기목록에 있는 문서의 중요도가 순서대로 담긴 배열 priorities와 내가 인쇄를 요청한 문서가 현재 대기목록의 어떤 위치에 있는지를 알려주는 location이 매개변수로 주어질 때, 내가 인쇄를 요청한 문서가 몇 번째로 인쇄되는지 return 하도록 solution 함수를 작성해주세요.  

<br>

#


### 제한사항
현재 대기목록에는 1개 이상 100개 이하의 문서가 있습니다.  
인쇄 작업의 중요도는 1~9로 표현하며 숫자가 클수록 중요하다는 뜻입니다.  
location은 0 이상 (현재 대기목록에 있는 작업 수 - 1) 이하의 값을 가지며 대기목록의 가장 앞에 있으면 0, 두 번째에 있으면 1로 표현합니다.  

<br>

#


### 입출력 예
|priorities|location|return|
|:-------------:|:----:|:---:|
|[2, 1, 3, 2]	|2	|1|
|[1, 1, 9, 1, 1, 1]	|0	|5|  

<br>
<br>

### 입출력 예 설명
***예제 #1***  
문제에 나온 예와 같습니다.  
***예제 #2***   
6개의 문서(A, B, C, D, E, F)가 인쇄 대기목록에 있고 중요도가 1 1 9 1 1 1 이므로 C D E F A B 순으로 인쇄합니다.  


<br>

#

### 풀이 및 배운 점
<br>

문제는 쉬웠다. 5분도 안되어서 푼 것 같은느낌.. 근데 나는 메모리를 많이 잡아먹는 풀이법인 것 같다. 인덱스와 value 값을 모두 알아야했기 때문에 2차원배열을 사용한 것.  

다른 분들의 풀이를 보니까 배열에서 요소가 인큐되는 과정을 거칠 때 마다 location 번호도 같이 움직여준 것. 그리고 만약 맨 앞에 있는 요소가 가장 큰 우선순위를 가지고있다면 그 때 location == 0인지를 체크하는 것이다. 즉 내가 원하는 것이 맞는지 체크. 그게 아니면 그냥 배열에서 지우는 방법으로 풀이하신 것 같다..  참고용코드 (아래)  
<br>

```Swift
import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var cPriorities = priorities
    var targetIndex = location
    var seq = 0

    while cPriorities.count > 0 {
        if cPriorities.contains(where: { $0 > cPriorities[0] }) {
            let first = cPriorities.removeFirst()
            cPriorities.append(first)
            targetIndex = targetIndex - 1 < 0 ? cPriorities.count - 1 : targetIndex - 1
        } else {
            if(targetIndex == 0) {
                return priorities.count - cPriorities.count + 1
            } 

            cPriorities.removeFirst()
            targetIndex = targetIndex - 1
        }
    }

    return 0
}
```