func solution(_ files:[String]) -> [String] {
    var answer = [String]()
    //[header, number, 들어온순서, 풀네임]
    var fileArray = [[String]]()
    for i in 0..<files.count {
        var arr = Array(files[i])
        var head = [String]()
        var number = [String]()
        for a in 0..<arr.count {
            //number
            if Int(String(arr[a])) != nil {
                number.append(String(arr[a]))
            }
            //tail
            if !number.isEmpty && Int(String(arr[a])) == nil { break }
            
            //header
            if number.isEmpty && Int(String(arr[a])) == nil {
                if arr[a].isUppercase { arr[a] = Character(arr[a].lowercased()) }
                head.append(String(arr[a]))
            }
        }
        fileArray.append([head.reduce("") {$0 + $1}, number.reduce("") { $0 + $1 }, String(i) , files[i]])
    }
    
    print(fileArray)
    
    
    fileArray = fileArray.sorted { file1, file2 in
        //file이름이 다른 경우는 철자가 먼저인걸로
        if file1[0] != file2[0] {
            return file1[0] < file2[0]
        }
        //file이름이 같은 경우
        else {
            //file이름이 같으면서 number가 다르면 숫자가 빠른걸 먼저
            if Int(file1[1])! != Int(file2[1])! {
                return Int(file1[1])! < Int(file2[1])!
            }else {
                //file이름이 같으면서 number도 같으면 들어온게 먼저인걸 먼저
                return Int(file1[2])! < Int(file2[2])!
            }
        }
    }
    print("after sort")
    print(fileArray)
    for file in fileArray {
        answer.append(file[3])
    }
    return answer
}

print(solution(["bet 00 Freedom Fighter", "BeT.00Super3333fortress", "A1-00010 Thunderbolt II", "F-14 Tomcat"]))
