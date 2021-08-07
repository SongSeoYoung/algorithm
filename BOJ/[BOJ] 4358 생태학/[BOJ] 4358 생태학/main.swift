import Foundation

func solution() {
    var dic: [String: Double] = [String: Double]()
    var count: Double = 0
    
    while let tree = readLine() {   //EOF 까지 받아오기
        count += 1
        if dic[tree] == nil {
            dic.updateValue(1, forKey: tree)
        } else { dic.updateValue(dic[tree]! + 1, forKey: tree) }
 
    }
    let sortedDic = dic.sorted { tree1, tree2 in
        tree1.key < tree2.key
    }
   
    for tree in sortedDic {
        let 비율소수점 = ((100 * tree.value) / count)
        let p = String(format: "%.4f", 비율소수점)
        print("\(tree.key) \(p)")
    }
}

solution()
