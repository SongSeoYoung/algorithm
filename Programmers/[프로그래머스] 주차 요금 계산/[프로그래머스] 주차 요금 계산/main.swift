import Foundation

enum CarInfoType: String {
    case IN
    case OUT
}

class Memo {
    let number: String
    var startT: Int
    var startM: Int
    var sum: Int = 0    // min단위로 계산
    var fee: Int = 0
    
    init(
        number: String,
        startT: Int,
        startM: Int
    ) {
        self.number = number
        self.startT = startT
        self.startM = startM
    }
}

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    var 기본시간: Int = fees[0]
    var 기본요금: Int = fees[1]
    var 단위시간: Int = fees[2]
    var 단위요금: Int = fees[3]
    
    var infos: [Memo] = []
    
    records.forEach { record in
        let info = record.split(separator: " ").map { String($0) }
        
        let time = info[0]  // 시간
        let timeArray = time.split(separator: ":").map { String($0) }
        let time_T = Int(timeArray[0]) ?? 0
        let time_M =  Int(timeArray[1]) ?? 0
        let number = info[1]  // 차량번호
        let type = info[2]   // in,out정보
        
        if type == CarInfoType.IN.rawValue {
            // MARK:  IN
            
            // 1. 등록이 안된 차량
            if !infos.map(\.number).contains(number) {
                let memo = Memo(number: number, startT: time_T, startM: time_M)
                infos.append(memo)
            } else {
                // 2. 등록이 이미 된 차량
                guard let index = findIndex(number, at: infos) else { return }
                let memo = infos[index]  // 객체를 찾아서
                memo.startT = time_T
                memo.startM = time_M
            }
            
        } else {
            // MARK: OUT
            guard let index = findIndex(number, at: infos) else { return }
            let memo = infos[index]   // 객체를 찾아서
            // 시간차이를 구한다.
            memo.sum += calculateMaintainMinute(startT: memo.startT, startM: memo.startM, outT: time_T, outM: time_M)
            memo.startM = -1
            memo.startT = -1
        }
        
    }
    
    
    
    infos.forEach { info in
        
        if (info.startT >= 0) && (info.startM >= 0) {
            // out이 등록되지않은 상태
            info.sum += calculateMaintainMinute(startT: info.startT, startM: info.startM, outT: 23, outM: 59)
        }
//        print("number: \(info.number) 머무른 시간은 : \(info.sum)")
        
        // 요금 계산
        var fee = 기본요금
        if info.sum > 기본시간 {
            // 추가 돈을 내야됨
            // 얼마나 나야되나.
            let 추가된분 = ceil(Double((info.sum - 기본시간)) / Double(단위시간))
//            print("추가된 분", 추가된분)
            fee += (Int(추가된분) * 단위요금)
        }
        info.fee = fee
    }
    return infos.sorted { lhs, rhs in
        let lhsNumber = Int(lhs.number) ?? 0
        let rhsNumber = Int(rhs.number) ?? 0
        return lhsNumber < rhsNumber
    }.map(\.fee)
}

private func calculateMaintainMinute(startT: Int, startM: Int, outT: Int, outM: Int) -> Int {
    let timeDiff = outT - startT
    let minDiff = outM - startM
    return (timeDiff*60) + minDiff
}
private func findIndex(_ number: String, at infos: [Memo]) -> Int? {
    let index: Int? = infos.firstIndex { memo in
        memo.number == number
    }
    return index
}

print(solution([1, 461, 1, 10], ["00:00 1234 IN"]))
