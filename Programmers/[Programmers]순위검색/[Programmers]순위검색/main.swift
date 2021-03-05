import Foundation
var infoArr = [[String]]()
var queryArr = [[String]]()
func solution(_ info:[String], _ query:[String]) -> [Int] {
    
    for i in 0..<info.count {
        infoArr.append(info[i].components(separatedBy: " "))
    }
    
    for i in 0..<query.count {
        queryArr.append(query[i].components(separatedBy: " ").filter{ $0 != "and"})
    }
    var filterList = [[String]]()
    var answer = [Int]()
    for i in 0..<queryArr.count {
        print("------------------------------------------")
        print(i, "번째 턴합니다", queryArr[i])
        filterList = infoArr
        if queryArr[i][0] != "-" {
            print("0번째가 -가 아니어서 필터링해봅니다")
            filterList = filterArr(indexN: 0, queryNumber: i, infoArr: filterList)
        }
        print(filterList)
        if queryArr[i][1] != "-" {
            print("1번째가 -가 아니어서 필터링해봅니다")
            filterList = filterArr(indexN: 1, queryNumber: i, infoArr: filterList)
        }
        print(filterList)
        if queryArr[i][2] != "-" {
            print("2번째가 -가 아니어서 필터링해봅니다")
            filterList = filterArr(indexN: 2, queryNumber: i, infoArr: filterList)
        }
        print(filterList)
        if queryArr[i][3] != "-" {
            print("3번째가 -가 아니어서 필터링해봅니다")
            filterList = filterArr(indexN: 3, queryNumber: i, infoArr: filterList)
        }
        print(filterList)
        if queryArr[i][4] != "-" {
            print("4번째가 -가 아니어서 필터링해봅니다")
            filterList = filterArrInt(queryNumber: i, infoArr: filterList)
        }
        print(filterList)
        answer.append(filterList.count)
        
    }
    return answer
}

func filterArr(indexN: Int, queryNumber: Int, infoArr: [[String]]) -> [[String]]{
    let filterList = infoArr.filter{ $0[indexN] == queryArr[queryNumber][indexN]}
    return filterList
}
func filterArrInt(queryNumber: Int, infoArr: [[String]]) -> [[String]] {
    let filterList = infoArr.filter{ Int($0[4])! >= Int(queryArr[queryNumber][4])!}
    return filterList
}

print(solution(["java backend junior pizza 150","python frontend senior chicken 210","python frontend senior chicken 150","cpp backend senior pizza 260","java backend junior chicken 80","python backend senior chicken 50"], ["java and backend and junior and pizza 100","python and frontend and senior and chicken 200","cpp and - and senior and pizza 250","- and backend and senior and - 150","- and - and - and chicken 100","- and - and - and - 150"]))
