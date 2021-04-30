import Foundation

func solution(_ s:String) -> Int {
    let sArray = Array(s)
    let arrayLen = sArray.count
    var minV = Int.max
    // 글자가 1개인 경우 arrLen / 2가 1보다 작어서 아래에서 에러뜸. 따로 분기처리 필요!
    if arrayLen == 1 {
        minV = 1
    } else {
        for cutN in 1...(arrayLen/2){
            var countArr = [Int]()
            var sliceArr = [String]()
            for index in stride(from: 0, to: arrayLen, by: cutN) {
                if index+cutN < arrayLen {
                    let slice = sArray[index..<index+cutN]
                    print(slice)
                    if sliceArr.isEmpty || sliceArr.last! != String(slice){
                        countArr.append(1)
                        sliceArr.append(String(slice))
                    } else if sliceArr.last! == String(slice) {
                        countArr.append(countArr.last! + 1)
                        sliceArr.append(String(slice))
                    }
                } else {
                    let slice = sArray[index...]
                    print(slice)
                    if sliceArr.isEmpty || sliceArr.last! != String(slice){
                        countArr.append(1)
                        sliceArr.append(String(slice))
                    } else if sliceArr.last! == String(slice) {
                        countArr.append(countArr.last! + 1)
                        sliceArr.append(String(slice))
                    }
                }
                
            }
            //한바퀴 다 돈 후에 길이 계산해야됨.
            print(countArr)
            print(sliceArr)
            var totalString = [String]()
            for i in 0..<sliceArr.count {
                if countArr[i] == 1 {
                    totalString.append(sliceArr[i])
                } else {
                    if i+1 < sliceArr.count && countArr[i+1] != 1 {
                        continue
                    } else {
                        totalString.append(String(countArr[i]))
                    }
                }
            }
            var count = 0
            for i in totalString {
                count += i.count
            }
            print(totalString)
            minV = min(minV, count)
            print(minV)
        }
    }
    return minV
}
print(solution("a"))
