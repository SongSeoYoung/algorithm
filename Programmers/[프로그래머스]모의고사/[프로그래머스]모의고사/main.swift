import Foundation

func solution(_ answers:[Int]) -> [Int] {
    var answers = answers
    answers.insert(0, at: 0)
    var answer = [0,0,0]
    var one = [1,2,3,4,5]
    var two = [1,3,4,5]
    var three = [3,1,2,4,5]
    for j in 1..<answers.count {
        if answers[j] == one.first! {
            answer[0] += 1
            one.append(one.removeFirst())
        }else {
            one.append(one.removeFirst())
        }
        
        if j % 2 != 0 {
            if answers[j] == 2 { answer[1] += 1 }
            if answers[j] == three.first! { answer[2] += 1 }
        } else {
            if answers[j] == two.first! {
                answer[1] += 1
                two.append(two.removeFirst())
            } else {
                two.append(two.removeFirst())
            }
            if answers[j] == three.first! {
                answer[2] += 1
                three.append(three.removeFirst())
            } else {
                three.append(three.removeFirst())
            }
        }
    }
    
    var final = [Int]()
    if answer.min() == answer.max() {
        for i in 0..<answer.count {
            final.append(i+1)
        }
    }
    else {
        let maxV = answer.max()
        for i in 0..<answer.count {
            if maxV == answer[i] {
                final.append(i+1)
            }
        }
    }
    final.sort()
    return final
}
print(solution([5,5,5,1,4,1]))
