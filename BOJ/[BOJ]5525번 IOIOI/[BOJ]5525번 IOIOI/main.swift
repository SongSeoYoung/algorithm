func makePn(n: Int) -> String{
    var Pn: [String] = [String]()
    for i in 0..<(2*n+1) {
        if i%2 != 0 {
            Pn.append("O")
        }else{
            Pn.append("I")
        }
    }
    return Pn.reduce("") { $0 + $1 }
}

func solution() -> Int{
    print("start")
    let n = Int(String(readLine()!))!
    let sLen = Int(String(readLine()!))!
    let s = String(readLine()!)
    let sArr = Array(s)
    let Pn = makePn(n: n)
    var count = 0
    print(sArr)
    for i in 0..<sArr.count {
        if sArr[i] == "I" && i+2*n < sArr.count{
            print("검사필요", i)
            //검사필요
            if sArr[i...(i+(2*n))].map({ String($0)}).reduce("", { $0 + $1}) == Pn {
                count += 1
                print("같고, 문자열 시ㅏㅈㄱ 인덱스는", i)
            }
        }
    }
    print(Pn)
    return count
}

print(solution())
