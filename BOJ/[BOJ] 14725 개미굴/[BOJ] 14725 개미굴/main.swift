import Foundation

class Node {
    var key: String?    // 들어갈 낱말
    weak var parent: Node?    // 부모
    var children: [String: Node] = [:]    // 자식을 dictionary형태로 저장하는데, [낱말: 노드]로 저장
    var isLeaf: Bool {
        // leaf 노드인지 체크 (children이 없다면 leaf노드겠지?)
        return children.isEmpty
    }
    
    init(key: String? = nil, parent: Node? = nil) {
        self.key = key
        self.parent = parent
    }
}

class Trie {
    let root: Node = .init()   // 초기 루트는 key와 parent모두 nil이고 children은 비어있다.
    
    // 노드를 추가하는 함수
    func insert(words: [String]) {
        var currentNode = root   // 항상 첫 시작은 root노드로한다.
        for index in 1..<words.count {   //단어 배열을 돌면서
            if let childNode = currentNode.children[words[index]] {  // 현재 노드의 차일드에 지금 낱말이 있는지 확인한다.
                currentNode = childNode // 있다면 현재 노드를 바꾸고 종료
            }
            else {   // 없다면 추가해야겠지?
                let newNode = Node(key: words[index], parent: currentNode) // 낱말로 노드를 만들고
                currentNode.children[words[index]] = newNode  // 현재노드의 차일드에 추가한다
                currentNode = newNode    // 현재 노드를 변경하고 종료
            }
        }
    }
    
    // 전체 순회하면서 print하는 함수
    func traversal(node: Node, depth: Int) {
        if let key = node.key {
            var answer = ""
            (0..<depth).forEach {_ in
                answer += "--"
            }
            print(answer+key)
        }
        guard !node.isLeaf else { return }
        let sortedChild = node.children.sorted(by: {$0.0 < $1.0})  // 알파벳 순 정렬
        for child in sortedChild {   // 재귀로 나의 차일드에대해서 다 돌아준다.
            traversal(node: child.value, depth: depth + 1)
        }
    }
}
func solution() {
    let numberOfAnts = Int(String(readLine()!))!
    let trie = Trie()
    (0..<numberOfAnts).forEach { _ in
        let info = readLine()!.split(separator: " ").map { String($0) }
        trie.insert(words: info)   // 단어를 추가하도록하자.
    }
    trie.traversal(node: trie.root, depth: -1)
}

solution()
