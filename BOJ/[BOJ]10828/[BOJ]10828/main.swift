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

    public func isEmpty() -> Int {
        if(storage.count == 0) {
            return 1
        }else{
            return 0
        }
    }
    
}


//main문
var stack:Stack<Int> = Stack<Int>()
//입력받은 숫자 만큼 배열에 해야할 일 입력받음
let number = Int(readLine()!)!
var array:[String] = []
for _ in 1...(number){
    array.append(String(readLine()!))
}

for i in 0...(number-1){
    //글자를 잘라서 입력받은 것들에 대해서 할 일을 나누기위해
    let check: String = array[i]
    let endIndex: String.Index = check.index(check.startIndex, offsetBy: 2)
    let result: String = String(check[...endIndex])

    switch result {
    case "top":
        let n: Int! = stack.top()
        print(n ?? 0)
    case "siz":
        let n: Int! = stack.size()
        print(n ?? 0)
    case "emp":
        let n: Int! = stack.isEmpty()
        print(n ?? 0)
    case "pus":
        //push 이면 띄어쓰기 뒤에 있는 숫자를 넣어야해서! 잘라서 넣어줌
        let number = check.split(separator: " ")
        stack.push(Int(number[1])!)
    case "pop":
        let n: Int! = stack.pop()
        print(n ?? 0)
    default:
        let n: Int! = stack.isEmpty()
        print(n ?? 0)
    }
}

