import Foundation


func solution(_ numbers:[Int], _ hand:String) -> String {
    var answer: [Character] = [Character]()
    let left: [Int] = [1,4,7]
    let right: [Int] = [3,6,9]
    var Larr: [[Int]] = Array(repeating: Array(repeating: 0, count: 3), count: 4)
    var Rarr: [[Int]] = Array(repeating: Array(repeating: 0, count: 3), count: 4)
    for i in numbers{
        //왼쪽줄
        if left.contains(i) {
            answer.append("L")
            Larr = Array(repeating: Array(repeating: 0, count: 3), count: 4)
            Larr[i/3][0] = 1
        }
        //오른쪽줄
        else if right.contains(i) {
            answer.append("R")
            Rarr = Array(repeating: Array(repeating: 0, count: 3), count: 4)
            Rarr[i/3 - 1][2] = 1
        }
        
        //가운데줄
        else{
            let numberY: Int!
            let numberX: Int!
            if i != 0 {
                numberY = i/3
                numberX = 1
            }else{numberY = 3
                numberX = 1 }
            var lX: Int?
            var lY: Int?
            //왼손거리 체크
            for i in 0...3 {
                if Larr[i].contains(1) {
                    lY = i
                    lX = Larr[i].firstIndex(of: 1)!
                }
            }
            if lY == nil && lX == nil {
                lY = 3
                lX = 0
            }
            let Ldiff:Int = numberX - lX! + abs(numberY - lY!)
            //오른손거리체크
            var rX: Int?
            var rY: Int?
            for i in 0...3 {
                if Rarr[i].contains(1){
                    rY = i
                    rX = Rarr[i].firstIndex(of: 1)
                }
            }
            if rX == nil && rY == nil{
                rY = 3
                rX = 2
            }
            let Rdiff: Int = rX! - numberX + abs(numberY - rY!)
            //어디가 더 가까운지
            if Rdiff > Ldiff {
                answer.append("L")
                Larr = Array(repeating: Array(repeating: 0, count: 3), count: 4)
                if i != 0 {
                    Larr[i/3][1] = 1
                }
                else { Larr[3][1] = 1}
            }
            else if Ldiff > Rdiff {
                answer.append("R")
                Rarr = Array(repeating: Array(repeating: 0, count: 3), count: 4)
                if i != 0 {
                    Rarr[i/3][1] = 1
                }
                else { Rarr[3][1] = 1}
            }
            else{
                if hand == "right" {
                    answer.append("R")
                    Rarr = Array(repeating: Array(repeating: 0, count: 3), count: 4)
                    if i != 0 {
                        Rarr[i/3][1] = 1
                    }
                    else { Rarr[3][1] = 1}
                }
                else{
                    answer.append("L")
                    Larr = Array(repeating: Array(repeating: 0, count: 3), count: 4)
                    if i != 0 {
                        Larr[i/3][1] = 1
                    }
                    else { Larr[3][1] = 1}
                }
            }
        }
    }
    var result: String = ""
    for i in answer {
        result.append(i)
    }
    return result
}


//print(solution([7, 0, 8, 2, 8, 3, 1, 5, 7, 6, 2], "left"))
