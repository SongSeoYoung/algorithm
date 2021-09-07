import Foundation

func solution() {
    let height = Int(String(readLine()!))!
    let 지수 = Double(height + 1)
    let node = Int(pow(2, 지수)) - 1
    if node % 3 == 0 { print(node / 3) }
    else { print((node / 3 ) + 1 )}
}
solution()
