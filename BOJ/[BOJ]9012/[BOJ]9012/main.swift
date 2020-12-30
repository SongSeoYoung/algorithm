//
//  main.swift
//  [BOJ]9012
//
//  Created by 송서영 on 2020/12/30.
//

import Foundation

public struct Stack<Element> {
    private var storage: [Element] = []
    public init() {}
    // 배열을 파라미터로 받아서 스택을 생성할 때 참조x 고 새로운 저장소 만들어서 스택을 사용하기 위해
    public init(_ elements: [Element]){
        storage = elements
    }
    
    //MARK: push O(1)
    //배열 맨 뒤에 추가
    public mutating func push(_ element: Element){
        storage.append(element)
    }
    
    //MARK: pop O(1)
    //배열 마지막 원소 제거
    @discardableResult
    public mutating func pop() -> Element? {
        if storage.count == 0 {
            return -1 as! Element
        }
        return storage.popLast()
    }

    public func size() -> Int {
        return storage.count
    }
    
    //MARK: peek O(1)
    // 스택의 마지막(가장 top 원소) 값 리턴
    public func top() ->Element? {
        if storage.count == 0 {
            return -1 as! Element
        }
        return storage.last
    }

    public func isEmpty() -> Bool {
        if(storage.count == 0) {
            return true
        }else{
            return false
        }
    }
    
}
//print("start")
let number: Int = Int(readLine()!)!
var result: [String] = []
for _ in 0...(number - 1){
    var stack = Stack<String>()
    var array: [String] = []
    let str: String = readLine()!
    array = str.map { String($0) }
    
//    print(array)
    for i in 0...(array.count - 1 ) {
        if array[i] == "(" {
            if i == (array.count - 1) {
                result.append("NO")
                break
            }
            else{
                stack.push(array[i])
            }
        }
        else{
            if stack.isEmpty() {
                result.append("NO")
                break
            }
            else{
                if stack.top() == "(" {
                    stack.pop()
                    if i == (array.count - 1) {
                        if stack.isEmpty() {
                            result.append("YES")
                            break
                        } else{
                            result.append("NO")
                            break
                        }
                    }
                    continue
                } else{
                    result.append("NO")
                    break
                }
            }
        }
    }
}
for i in 0...(result.count - 1) {
    print(result[i])
}
