import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var truckArr = truck_weights
    var cnt = 1
    var bridge = [Int]()
    var bridgeCount = [Int]()
    var afterBridge = [Int]()
    bridge.append(truckArr.remove(at: 0))
    bridgeCount.append(1)
    while !(bridge.isEmpty) {
        cnt += 1
        print("-------------------------------")
        print("bridge 위에 있는 차", bridge)
        print("bridgeCount 다리 위에 있는 차들에 대해서 몇 번씩 잇었는지", bridgeCount)
        print("after bridge", afterBridge)
        print("truck list 아직 트럭에 있는 차", truckArr)
        for b in 0..<bridgeCount.count {
            if bridgeCount[b] == bridge_length {
                bridgeCount.remove(at: b)
                afterBridge.append(bridge[b])
                bridge.remove(at: 0)
                break
            }
        }
        if !truckArr.isEmpty {
            let currTruck = truckArr[0]
            if bridge.reduce(0, { $0 + $1 }) + currTruck <= weight {
                bridge.append(currTruck)
                truckArr.remove(at: 0)
                bridgeCount.append(0)
            }
        }
        bridgeCount = bridgeCount.map{ $0 + 1 }
    }
    return cnt
}

print(solution(100, 100, [10,10,10,10,10,10,10,10,10,10]))
