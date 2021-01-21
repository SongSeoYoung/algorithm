import Foundation

func solution(_ s:String) -> Int {
    var arr:[Int] = [Int]()
    let stringArr : [Character] = Array(s)
    
    //전체적으로 돌면서 전체케이스에 대해서 확인 ( 1개로 묶기, 2개로 묶기...)
    for i in 0..<(stringArr.count){
        
        //새로운 문자열만들기
        var newString: [String] = [String]()
        for j in 0..<(stringArr.count) {
            if stringArr[j] == stringArr[j+1]{
                
            }
        }
        
    }
    
    var minValue: Int = arr[0]
    for i in 1..<arr.count {
        if minValue < arr[i]{
            minValue = arr[i]
        }
    }
    return minValue
}
