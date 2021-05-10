//
//import Foundation
//
//func solution(_ info:[String], _ query:[String]) -> [Int] {
//    var answer = [Int]()
//    var infoArr = Array(repeating: Array(repeating: "", count: 5), count: info.count)
//    var queryArr = Array(repeating: Array(repeating: "", count: 5), count: query.count)
//    var gradeArr = [Int]()
//    var lang = [String]()
//    var study = [String]()
//    var career = [String]()
//    var food = [String]()
//    for i in 0..<info.count {
//        let info1: [String] = info[i].split(separator: " ").map { String($0) }
//        infoArr[i] = info1
////        lang.append(info1[0])
////        study.append(info1[1])
////        career.append(info1[2])
////        food.append(info1[3])
////        gradeArr.append(Int(info1[4])!)
//
//    }
//    infoArr.sort { stringA1, stringA2 in
//        stringA1[0] < stringA2[0]
//    }
//    print(infoArr)
//    for i in 0..<query.count {
////        var characterSet: CharacterSet = CharacterSet[" ", "and"]
//        let query1: [String] = query[i].split(separator: " ").filter { $0 != "and" }.map { String($0) }
//        queryArr[i] = query1
//    }
//    print(queryArr)
//
//
//
//    return answer
//}
//
//print(solution(["java backend junior pizza 150","python frontend senior chicken 210","python frontend senior chicken 150","cpp backend senior pizza 260","java backend junior chicken 80","python backend senior chicken 50"], ["java and backend and junior and pizza 100","python and frontend and senior and chicken 200","cpp and - and senior and pizza 250","- and backend and senior and - 150","- and - and - and chicken 100","- and - and - and - 150"]))


import Foundation
var infoArr = [[String]]()
var queryArr = [[String]]()
func solution(_ info:[String], _ query:[String]) -> [Int] {
    var gradeArr = [Int]()
    var lang = [String]()
    var study = [String]()
    var career = [String]()
    var food = [String]()
    for i in 0..<info.count {
        let info1 = info[i].components(separatedBy: " ")
        lang.append(info1[0])
        study.append(info1[1])
        career.append(info1[2])
        food.append(info1[3])
        gradeArr.append(Int(info1[4])!)
        infoArr.append(info1)
    }
    
    for i in 0..<query.count {
        queryArr.append(query[i].components(separatedBy: " ").filter{ $0 != "and"})
    }
    
    var filterList = [[String]]()
    var answer = [Int]()
    for i in 0..<queryArr.count {
        print("-------------")
        filterList = infoArr
        var langSet: [Int] = [Int]()
        var studySet: [Int] = [Int]()
        var careerSet: [Int] = [Int]()
        var foodSet: [Int] = [Int]()
        var gradeSet: [Int] = [Int]()
        study.sort()
        career.sort()
        food.sort()
        gradeArr.sort()
        lang = lang.sorted()
        print(lang)
        print(queryArr[i][0])
        if queryArr[i][0] != "-" {
            if binarySearchString(array: lang, target: queryArr[i][0], start: 0, end: lang.count) != [] {
                langSet = binarySearchString(array: lang, target: queryArr[i][0], start: 0, end: lang.count)
            } else {
                answer.append(0)
                break
            }
//            filterList = filterArr(indexN: 0, queryNumber: i, infoArr: filterList)
        }
        print(study)
        print(queryArr[i][1])
        if queryArr[i][1] != "-" {
            if binarySearchString(array: study, target: queryArr[i][1], start: 0, end: study.count) != [] {
                studySet = binarySearchString(array: study, target: queryArr[i][1], start: 0, end: study.count)
            } else {
                answer.append(0)
                break
            }
//            filterList = filterArr(indexN: 1, queryNumber: i, infoArr: filterList)
        }
        
        if queryArr[i][2] != "-" {
            if binarySearchString(array: career, target: queryArr[i][2], start: 0, end: career.count) != [] {
                careerSet = binarySearchString(array: career, target: queryArr[i][2], start: 0, end: career.count)
            } else {
                answer.append(0)
                break
            }
//            filterList = filterArr(indexN: 2, queryNumber: i, infoArr: filterList)
        }
        
        if queryArr[i][3] != "-" {
            if binarySearchString(array: food, target: queryArr[i][3], start: 0, end: food.count) != [] {
                foodSet = binarySearchString(array: food, target: queryArr[i][3], start: 0, end: food.count)
            } else {
                answer.append(0)
                break
            }
//            filterList = filterArr(indexN: 3, queryNumber: i, infoArr: filterList)
        }
        
//        var grade: [Int] = []
//        filterList.forEach { s1 in
//            grade.append(Int(s1[4])!)
//        }
//        grade.sort()
        if queryArr[i][4] != "-" {
            if let mid = binarySearch(array: gradeArr, target: Int(queryArr[i][4])!, start: 0, end: gradeArr.count) {
                gradeSet = []
//                answer.append(gradeArr.count - mid)
            } else { answer.append(0) }
        } else {
            answer.append(filterList.count)
        }
        
        print(langSet)
        print(studySet)
        print(careerSet)
        print(foodSet)
        print(gradeSet)
    }
    return answer
}

func binarySearchString(array: [String], target: String, start: Int, end: Int) -> [Int] {
    var start = start
    var end = end
    var index: Int?
    while start < end {
        let mid = (start + end) / 2
        if array[mid] < target {
            start = mid + 1
        } else {
            index = mid
            end = mid
        }
    }
    var result: [Int] = []
    if index != nil {
        for i in index!..<array.count {
            if array[i] == target { result.append(i)}
            if array[i] != target { break }
        }
    }
    return result
}

func binarySearch(array: [Int], target: Int, start: Int, end: Int) -> Int? {
    var start = start
    var end = end
    var index: Int?
    if array.count == 1 {
        if target <= array[start] { return 0 }
        else { return 1 }
    } else {
        while start < end {
            let mid = (start + end ) / 2
            if array[mid] < target {
                start = mid + 1
            } else if array[mid] >= target {
                index = mid
                end = mid
            }
        }
    }
    return index
}
func filterArr(indexN: Int, queryNumber: Int, infoArr: [[String]]) -> [[String]]{
    let filterList = infoArr.filter{ $0[indexN] == queryArr[queryNumber][indexN]}
    return filterList
}
print(solution(["java backend junior pizza 150","python frontend senior chicken 210","python frontend senior chicken 150","cpp backend senior pizza 260","java backend junior chicken 80","python backend senior chicken 50"], ["java and backend and junior and pizza 100","python and frontend and senior and chicken 200","cpp and - and senior and pizza 250","- and backend and senior and - 150","- and - and - and chicken 100","- and - and - and - 150"]))
