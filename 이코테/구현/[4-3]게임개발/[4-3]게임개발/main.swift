/*
 시뮬레이션문제.
 아이디어는 떠오르지만 막상 구현하려고하면 생각보다 복잡한 문제 다루기 연습
 */
import Foundation

func solution() -> Int{
    let size = readLine()!.split(separator: " ").map { Int(String($0))! }
    var characterInfo = readLine()!.split(separator: " ").map { Int(String($0))! }
    var arr = Array(repeating: Array(repeating: 0, count: size[1]), count: size[0])
    for i in 0..<size[0] {
        arr[i] = readLine()!.split(separator: " ").map{ Int(String($0))! }
    }
    var count = 1
    var h = characterInfo[0]
    var w = characterInfo[1]
    var turn = 0
    while true {
        if turn == 4 {
            w -= 1
            if checkRange(a: h, b: w, sizeA: size[0], sizeB: size[1]) && arr[h][w] == 0{
                turn = 0
            }
            else{
                break
            }
        }
        if characterInfo[2] == 0 {
            characterInfo[2] = 3
            turn += 1
            if checkRange(a: h, b: w - 1, sizeA: size[0], sizeB: size[1]) && arr[h][w-1] == 0{
                w -= 1
                count += 1
                arr[h][w] = 1
                turn = 0
            }
        }
        
        
        else if characterInfo[2] == 1 {
            characterInfo[2] = 0
            turn += 1
            if checkRange(a: h - 1, b: w, sizeA: size[0], sizeB: size[1]) && arr[h-1][w] == 0{
                h -= 1
                count += 1
                arr[h][w] = 1
                turn = 0
            }
        }
        
        
        else if characterInfo[2] == 2 {
            
            characterInfo[2] = 1
            turn += 1
            if checkRange(a: h, b: w + 1, sizeA: size[0], sizeB: size[1]) && arr[h][w+1] == 0{
                w += 1
                count += 1
                arr[h][w] = 1
                turn = 0
            }
        }
        
        
        
        else if characterInfo[2] == 3 {
            
            characterInfo[2] = 2
            turn += 1
            if checkRange(a: h + 1, b: w, sizeA: size[0], sizeB: size[1]) && arr[h+1][w] == 0{
                h += 1
                count += 1
                arr[h][w] = 1
                turn = 0
            }
        }
    }
    return count
}
func checkRange(a: Int, b:Int, sizeA: Int, sizeB: Int) -> Bool {
    if 0..<sizeA ~= a && 0..<sizeB ~= b {
        return true
    }else{
        return false
    }
}

print(solution())
