//
//  main.swift
//  [BOJ]1158
//
//  Created by 송서영 on 2021/01/01.
//

import Foundation

var inputValue = readLine()?.components(separatedBy: " ")
var people: Int = Int(inputValue![0]) ?? 0
var number: Int = Int(inputValue![1]) ?? 0
var queue:[Int] = []
var result = ""
var num = 0
for i in 0...people - 1{
    queue.append(i + 1)
}

for _ in 0..<people{
    num += number - 1
    if num >= queue.count {
        num = num % queue.count
    }
    result = result + String(queue.remove(at: num)) + ", "
}

if result.count == 2{
    result.removeLast()
    result.removeLast()
    print("<\(result)>")
}else{
    result.removeLast()
    result.removeLast()
    print("<\(result)>")
}
