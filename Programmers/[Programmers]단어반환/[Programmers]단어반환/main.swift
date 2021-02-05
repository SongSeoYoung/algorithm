import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var wordsArr: [String] = words
    if !wordsArr.contains(begin) {
        wordsArr.insert(begin, at: 0)
    }
    if !wordsArr.contains(target) {
        wordsArr.insert(target, at: wordsArr.count)
    }
    var charArr: [Set<Character>] = [Set<Character>]()
    for i in wordsArr{
        charArr.append(Set(Array(i)))
    }
    var arr: [[Int]] = Array(repeating: Array(repeating: 0, count: wordsArr.count), count: wordsArr.count)
    for h in 0..<wordsArr.count {
        for i in 0..<wordsArr.count {
            if charArr[h].symmetricDifference(charArr[i]).count <= 2 {
                arr[h][i] = 1
            }
        }
        
    }
    print(arr)
    var visited: [[Int]] = [[Int]]()
    var cnt: Int = 0
    var list: [Int] = [Int]()
    var wordList: [[String]] = [[wordsArr[0]]]
    var check: Int = 0
    
    func dfs(startH: Int, startW: Int, count: Int) {
        var flag: Int = 0
        wordList[check].append(wordsArr[startW])
        print(wordList)
        visited.append([startH, startW])
        if startW == wordsArr.count - 1{
            print("단어를 찾앗군요!")
            print("\(count)가 횟수입니다.")
            list.append(cnt)
            check += 1
//            wordList.remove(at: 0)
            visited = []
            print("")
            return
        }
        for w in (startW+1)..<wordsArr.count{
            if arr[startW][w] == 1 && !visited.contains([startW, w]) {
                flag += 1
            }
        }
        if flag >= 2{
            print("경우의 수 나뉨")
            wordList.append(wordList[check])
        }
        
        for w in (startW+1)..<wordsArr.count{
            if arr[startW][w] == 1 && !visited.contains([startW, w]) {
                cnt += 1
                print(cnt, "now cnt")
                print(startW, w, "에 대해서 재귀로 다시 부릅니다")
                
                
                dfs(startH: startW, startW: w, count: cnt)
            }
        }
    }
    dfs(startH: 0, startW: 0, count: 0)
    print(list)
    print(visited)
    print(wordList)
    list.sort()
    return list[0]
}


print(solution("hit", "cog", ["hot", "dot", "dog", "lot", "log", "cog"]))
