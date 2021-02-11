import Foundation

func solution(_ new_id:String) -> String {
    var final_id:[Character] = Array(new_id)
    let str: [Character] = ["-", "_", "."]
    
    if final_id.count != 0{
        final_id = final_id.map{ Character(String($0).lowercased()) }
    }
    print(final_id)
    
    var memoryIndex:[Int] = [Int]()
    if final_id.count != 0 {
        for i in 0..<final_id.count {
            if !findAlpha(final_id[i]) && !str.contains(final_id[i]) && !findNumber(final_id[i]){
                memoryIndex.append(i)
            }
        }
    }
    var cnt: Int = 0
    for i in 0..<memoryIndex.count{
        final_id.remove(at: memoryIndex[i]-cnt)
        cnt += 1
    }
    
    print(final_id)
    memoryIndex = [Int]()
    if final_id.count != 0{
        for i in 0..<final_id.count - 1 {
            if final_id[i] == "." && final_id[i+1] == "."{
                memoryIndex.append(i)
            }
        }
    }
    cnt = 0
    for i in 0..<memoryIndex.count{
        final_id.remove(at: memoryIndex[i]-cnt)
        cnt += 1
    }
    
    print(final_id)
    if final_id.count != 0 {
        if final_id[0] == "." {
            final_id.remove(at: 0)
        }
        if final_id.count != 0 && final_id[final_id.count - 1] == "." {
            final_id.remove(at: final_id.count - 1)
        }
    }
    print(final_id)
    
    if final_id.count == 0 {
        final_id.append("a")
    }
    
    print(final_id)
    
    if final_id.count >= 16 {
        for _ in 0..<final_id.count - 15 {
            final_id.popLast()
        }
    }
    if final_id[final_id.count - 1] == "." {
        final_id.remove(at: final_id.count - 1)
    }
    
    print(final_id)
    
    if final_id.count <= 2{
        for _ in 0..<3 - final_id.count{
            final_id.append(final_id.last!)
        }
    }
    print(final_id)
    
    return final_id.reduce("") {$0 + String($1)}
}

func findAlpha ( _ i: Character) -> Bool{
    if (Int(i.asciiValue!) >= 65) && (Int(i.asciiValue!) <= 90) {
        return true
    }
    if (Int(i.asciiValue!) >= 97 && Int(i.asciiValue!) <= 122 ) {
        return true
    }
    return false

}

func findNumber( _ i: Character)-> Bool {
    if (Int(i.asciiValue!) >= 48) && (Int(i.asciiValue!) <= 57) {
        return true
    }
    return false
}

print(solution("abcdefghijklmn.p"))
