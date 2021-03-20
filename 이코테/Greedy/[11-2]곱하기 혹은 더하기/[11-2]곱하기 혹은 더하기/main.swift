import Foundation
let arr = Array(readLine()!)
let numberArr = arr.map { Int(String($0))! }
var answer = numberArr[0]
for i in 1..<numberArr.count{
    print(answer)
    if numberArr[i] <= 1 || answer <= 1{
        answer = answer + numberArr[i]
    }else{
        answer = answer * numberArr[i]
    }
}
print(answer)

/*
 나는 0 이면 무조건 더하기를 하고 나머지는 곱하기를 하는 형태로 구했는데
 답지를 보니까 1이하일 때 더하기, 나머지는 곱하기 형태로 구하였더라.
 알고보니.. 진짜 1 역시 곱하기보다는 더하기가 더 큰 효과를 낼 수 있다는 것을 간과하고있었음.
 
 */
