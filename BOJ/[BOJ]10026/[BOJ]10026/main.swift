////
////  main.swift
////  [BOJ]2667
////
////  Created by 송서영 on 2021/01/15.
////
//
//import Foundation
//
//let size: Int = Int(readLine()!)!
//var arr: [[String]] = [[String]]()
//for _ in 0..<size {
//    let arr1: [String] = readLine()!.map{ String($0) }
//    arr.append(arr1)
//}
//
//var result: [Int] = [Int]()
//var count: Int = 0
//func bfs() {
//    var check: [[Int]] = [[0,0]]
//    while !check.isEmpty {
//        print(check, "check")
//        print(count, "count")
//        let pop: [Int] = check.popLast()!
//        let popColor: String = arr[pop[0]][pop[1]]
//
//        //가로체크 (오른쪽방향)
//        if pop[0] != size - 1 && pop[1] != size - 1{
//            print("가로")
//            //popColor = red or green
//            if popColor == "R" || popColor == "G" {
//                print("pop color = red or green", popColor)
//                if arr[pop[0]][pop[1]+1] == "R" || arr[pop[0]][pop[1]+1] == "G"{
//                    print("오른쪽 색도, red or green")
//                    check.append([pop[0],pop[1]+1])
//                }else{
//                    print("오른쪽 색은 blue")
//                    count = count + 1
//                    check.append([pop[0],pop[1]+1])
//                }
//            }
//            //pop Color == blue
//            else{
//                print("pop color is blue")
//                if arr[pop[0]][pop[1]+1] == arr[pop[0]][pop[1]] {
//                    print("pop color and 오른쪽 컬러는 같다")
//                    check.append([pop[0],pop[1]+1])
//                }
//                else{
//                    count = count + 1
//                    check.append([pop[0], pop[1]+1])
//                }
//            }
//        }
//        //세로
//        if pop[0] != size - 1 && pop[1] != size - 1{
//            print("세로")
//            if popColor == "R" || popColor == "G" {
//                print("pop color = red or green")
//                if arr[pop[0]+1][pop[1]] == "R" || arr[pop[0]+1][pop[1]] == "G" {
//                    print("아래쪽 색도, red or green")
//                    check.append([pop[0]+1,pop[1]])
//                }else{
//                    print("아래쪽 색은 blue")
//                    count = count + 1
//                    check.append([pop[0]+1,pop[1]])
//                }
//            }
//
//            //pop color = blue
//            else{
//                print("pop color is blue")
//                if arr[pop[0]+1][pop[1]] == arr[pop[0]][pop[1]] {
//                    print("pop color and 아래쪽 컬러는 같다")
//                    check.append([pop[0]+1,pop[1]])
//                }
//                else{
//                    check.append([pop[0]+1, pop[1]])
//                    count = count + 1
//                }
//            }
//        }
//    }
//}
//
//bfs()


import Foundation

let size: Int = Int(readLine()!)!
var arr: [[String]] = [[String]]()
for _ in 0..<size {
    let arr1: [String] = readLine()!.map{ String($0) }
    arr.append(arr1)
}

var result: [Int] = [Int]()
var Realcount: Int = 0
var count: Int = 0
func bfs() {
    var check: [[Int]] = [[0,0]]
    while !check.isEmpty {
        print(check, "check")
        let pop = check.popLast()!
        let popColor = arr[pop[0]][pop[1]]
        //가로체크
        for i in pop[1]..<size {
            //popColor = r or g
            if popColor == "R" || popColor == "G" {
                //오른쪽의 색의 r,g 라면
                if arr[pop[0]][i] == "R" || arr[pop[0]][i] == "G" {
                    if arr[pop[0]][i] == popColor {
                        continue
                    }else{
                        Realcount = Realcount + 1
                    }
                }
                //오른쪽 색이 b
                else{
                    count = count + 1
                    Realcount = Realcount + 1
                    check.append([pop[0], i])
                    break
                }
            }
            //pop color = b
            else{
                if arr[pop[0]][i] == popColor {
                    continue
                }
                else{
                    count = count + 1
                    Realcount = Realcount + 1
                    check.append([pop[0], i])
                    break
                }
            }
        }
        
        
        //세로체크
        for i in pop[0]..<size {
            //popColor = r or g
            if popColor == "R" || popColor == "G" {
                //오른쪽의 색의 r,g 라면
                if arr[i][pop[1]] == "R" || arr[i][pop[1]] == "G" {
                    if arr[i][pop[0]] == popColor {
                        continue
                    }else{
                        Realcount = Realcount + 1
                    }
                }
                //오른쪽 색이 b
                else{
                    count = count + 1
                    Realcount = Realcount + 1
                    check.append([ i, pop[0]])
                    break
                }
            }
            //pop color = b
            else{
                if arr[i][pop[0]] == popColor {
                    continue
                }
                else{
                    count = count + 1
                    Realcount = Realcount + 1
                    check.append([i,pop[0]])
                    break
                }
            }
        }
    }
}
bfs()
print(count)
print(Realcount)
