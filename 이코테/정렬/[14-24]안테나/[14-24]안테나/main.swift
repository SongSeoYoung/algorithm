let houseNumber = Int(readLine()!)!
var arr = [Int]()
arr = readLine()!.split(separator: " ").map { Int(String($0))! }
var minHouse = 0
arr.sort()

if houseNumber % 2 == 0 {
    let index1 = houseNumber / 2 - 1
    let index2 = houseNumber / 2
   
    var sum1 = 0
    var sum2 = 0
    for i in 0..<houseNumber {
        sum1 += abs(arr[index1] - arr[i])
        sum2 += abs(arr[index2] - arr[i])
    }
    let minv = min(sum1, sum2)

    if minv == sum1 {
        print(arr[index1])
    }
    else {
        print(arr[index2])
    }
   
}
else {
    print(arr[houseNumber / 2])
}
