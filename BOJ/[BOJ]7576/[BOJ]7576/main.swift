//
//  main.swift
//  [BOJ]7576
//
//  Created by 송서영 on 2021/01/14.
//

import Foundation

let size: [Int] = readLine()!.split(separator: " ").map{(Int( $0 )!)}
var arr:[[Int]] = Array(repeating: Array(repeating: 0, count: size[0]), count: size[1])
for i in 0..<size[1]{
    let smallArr: [Int] = readLine()!.split(separator: " ").map{(Int($0)!)}
    arr[i] = smallArr
}

var count = 0
func bfs(){
    while !startingIndex.isEmpty {

        let first = startingIndex.popLast()!
        let width = first[1]
        let height = first[0]
        //가로
        for i in width - 1...width + 1 {
//            print(i)
            if (i < size[0] && i >= 0) {
                if arr[height][i] == 0 {
                    startingIndex2.append([height, i])
                    arr[height][i] = 1
                }
            }
        }
        //세로
        for i in height - 1 ... height + 1 {
            if (i < size[1] && i >= 0){
//                print(i)
                if arr[i][width] == 0 {
                    startingIndex2.append([i, width])
                    arr[i][width] = 1
                }
            }
        }
        if startingIndex.isEmpty{
            startingIndex = startingIndex2
            count = count + 1
            startingIndex2 = [[Int]]()
        }
    }
}

var startingIndex: [[Int]] = [[Int]]()
var startingIndex2: [[Int]] = [[Int]]()
for i in 0..<size[1]{
    for j in 0..<size[0] {
        if arr[i][j] == 1 {
            startingIndex.append([i, j])
        }
    }
}


func printResult() -> Int {
    for i in 0..<size[1]{
        for j in 0..<size[0] {
            if arr[i][j] == 0 {
                return -1
            }
        }
    }
    return count - 1
}

bfs()
print(printResult())
