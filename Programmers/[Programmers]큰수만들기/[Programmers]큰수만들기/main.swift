import Foundation
 
func solution(_ number:String, _ k:Int) -> String {
    let map = number.map{String($0)}

    var stack = [String]()
    var count = 0
    for i in 0..<number.count{
        print("--------------------------------")
        print(map[i], "에 대해서")
        print(count, "삭제횟수", stack, "stack", stack.last, "stackLast")
        while count < k && !stack.isEmpty && stack.last! < map[i] {
            stack.removeLast()
            count += 1
            print("스택에서 값을 지운다.")
        }
            if count >= k {
                print("count 지운값이 ", k, "제거해야될 수보다 크거나 같아서 스택에 이후 값 다 더해주고 이게 정답이되어버림")
                stack.append(contentsOf: map[i...])
                break
            }else{
                print("아무 조건에도 맞지않아서 어팬드")
                stack.append(map[i])
                print(stack, "stack")
        }
    }

    //stack.joined()와stack.joined().prefix(number.count-k)의 결과는 같은데 시간초과를 해결하기위해 길이를 지정해준 것.
    //시간초과가나면 길이를 따로 지정해주자
    return String(stack.joined().prefix(number.count-k))
}
 
solution("123555213", 3)

/*
 멍청코드 (나의 풀이)
 
 
 import Foundation
 
 func solution(_ number:String, _ k:Int) -> String {
     let numberArr = Array(number).map{ Int(String($0))! }
     var max = -1
     var maxIndex = 0
     for i in 0..<numberArr.count - k {
         if numberArr[i] > max {
             max = numberArr[i]
             maxIndex = i
         }
     }
     print(max)
     var afterMaxArr = [Int]()
     for i in maxIndex+1..<numberArr.count {
         afterMaxArr.append(numberArr[i])
     }
     print(afterMaxArr)
     for _ in 0..<(afterMaxArr.count - (numberArr.count - k)) + 1 {
         for i in 0..<afterMaxArr.count{
             if i != afterMaxArr.count - 1{
                 if afterMaxArr[i] <= afterMaxArr[i+1] {
                     afterMaxArr.remove(at: i)
                     break
                 }
             }
 
         }
         print(afterMaxArr, "지우기")
     }
     print(afterMaxArr, "삭제되고 나서 이제 문자가 될 값.")
     var result: String = String(max)
     for i in 0..<afterMaxArr.count {
         result += String(afterMaxArr[i])
     }
     return String(result)
 }
 print(solution("4177252841", 4))
 
 
 */
