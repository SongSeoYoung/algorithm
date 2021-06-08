func solution() {
    let n = Int(readLine()!)!
    var arr = [[Int]]()
    for _ in 0..<n {
        arr.append(readLine()!.split(separator: " ").map { Int($0)! })
    }
    var blueSum = 0
    var whiteSum = 0
    func recursive(widthStart: Int, widthEnd: Int, heightStart: Int, heightEnd: Int) {
        var flag = false
        var blue = 0
        var white = 0
        for i in heightStart..<heightEnd{
            let checkArr = Array(arr[i][widthStart..<widthEnd])
            if checkArr.contains(0) && checkArr.contains(1) {
                //재귀필요
                flag = true
                break
            }
        }
       
        //완벽한상태
        if flag == false {
            if arr[heightStart][widthStart] == 0 { white += 1}
            else { blue += 1}
            blueSum += blue
            whiteSum += white
            return
        }
        else {
            //재귀처리
            
            //좌상단
            recursive(widthStart: widthStart, widthEnd: widthStart + (widthEnd - widthStart)/2, heightStart: heightStart, heightEnd: heightStart + (heightEnd - heightStart)/2)
            //우상단
            recursive(widthStart: widthStart + (widthEnd - widthStart)/2, widthEnd: widthEnd, heightStart: heightStart, heightEnd: heightStart + (heightEnd - heightStart)/2)
            recursive(widthStart: widthStart, widthEnd:  widthStart + (widthEnd - widthStart)/2, heightStart: heightStart + (heightEnd - heightStart)/2, heightEnd: heightEnd)
            recursive(widthStart:  widthStart + (widthEnd - widthStart)/2, widthEnd: widthEnd, heightStart: heightStart + (heightEnd - heightStart)/2, heightEnd: heightEnd)
        }
    }
    recursive(widthStart: 0, widthEnd: n, heightStart: 0, heightEnd: n)
    print(whiteSum)
    print(blueSum)
}

solution()
