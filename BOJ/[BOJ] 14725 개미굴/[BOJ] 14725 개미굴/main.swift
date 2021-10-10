import Foundation

class Node {
    var key: String?
    weak var parent: Node?
    var children: [String: Node] = [:]
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
    let root: Node = .init()
    
    func insert(words: [String]) {
        var currentNode = root
        for index in 1..<words.count {
            if let childNode = currentNode.children[words[index]] {
                currentNode = childNode
            }
            else {
                let newNode = Node(key: words[index], parent: currentNode)
                currentNode.children[words[index]] = newNode
                currentNode = newNode
            }
        }
    }
    func traversal(node: Node, depth: Int) {
        if let key = node.key {
            var answer = ""
            (0..<depth).forEach {_ in
                answer += "--"
            }
            print(answer+key)
        }
        guard !node.isLeaf else { return }
        let sortedChild = node.children.sorted(by: {$0.0 < $1.0})
        for child in sortedChild {
            traversal(node: child.value, depth: depth + 1)
        }
    }
}
func solution() {
    let numberOfAnts = Int(String(readLine()!))!
    let trie = Trie()
    (0..<numberOfAnts).forEach { _ in
        let info = readLine()!.split(separator: " ").map { String($0) }
        trie.insert(words: info)
    }
    trie.traversal(node: trie.root, depth: -1)
}

solution()
