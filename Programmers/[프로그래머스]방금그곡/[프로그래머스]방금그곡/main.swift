import Foundation

//악보를 #을 포함해서 정확히 분리하는 함수
func splitMusicInfo(_ musicinfo: [String] ) -> [String] {
    var result = [String]()
    var letter = ""
    for minfo in musicinfo {
        if minfo != "#" {
            if letter == "" {letter = String(minfo) }
            else { result.append(letter)
                letter = ""
                letter = String(minfo)
            }
        } else {
            result.append("\(letter)#")
            letter = ""
        }
    }
    if letter != "" {
        result.append(letter)
    }
    return result
}

func solution(_ m:String, _ musicinfos:[String]) -> String {
    var answer = [[String]]()
    let m = splitMusicInfo(Array(m).map { String($0) })
    for i in 0..<musicinfos.count {
        let music = musicinfos[i].split(separator: ",").map { String($0) }
        let startTime = music[0]
        let endTime = music[1]
        let title = music[2]
        let musicinfo = music[3]
        var musicInfoArray = splitMusicInfo(Array(musicinfo).map { String($0) })
        
        //시간 차 구하기 (재생 시간 차)
        let time = DateFormatter()
        time.dateFormat = "HH:mm"
        let start = time.date(from: startTime)!
        let end = time.date(from: endTime)!
        let timeInterval = Int(end.timeIntervalSince(start))

        //재생시간이 찾고자하는 것보다 긴 경우
        if (timeInterval / 60) > musicInfoArray.count {
            let how = (timeInterval / 60) - musicInfoArray.count
//            print("차이 ", how)
            for t in 0..<how {
                musicInfoArray.append(musicInfoArray[t])
            }
        // 재생시간이 찾고자하는 것 보다 짧은 경우
        } else if (timeInterval < musicInfoArray.count) {
            musicInfoArray = Array(musicInfoArray[0..<(timeInterval/60)])
        }
        
        //해당 악보가 원하는게 맞는지 찾는 함수
        for final in 0..<musicInfoArray.count {
            var flag = true
            if musicInfoArray[final] == m[0] {
                for j in 1..<m.count {
                    if final + j < musicInfoArray.count && musicInfoArray[final + j] != m[j] {
                        flag = false
                    }
                    if final + j >= musicInfoArray.count { flag = false }
                }
                if flag == false { continue }
                if flag { answer.append([title, String(timeInterval/60), String(i)]) }
            }
        }
    }
    
    
    
    //답이 없는 경우
    if answer.count == 0 { return "(None)" }
    //답이 한개인 경우
    if answer.count == 1 { return answer[0][0] }
    
    //답이 여러개인 경우 음악의 재생시간이 긴 순대로
    if answer.count > 1 {
        answer.sort { a1, a2 in
            Int(a1[1])! > Int(a2[1])!
        }
    }
    // 재생시간이 같은경우에는 먼저 입력된 음악일 경우의 조건을 만족하기위해..
    let maxTime = Int(answer[0][1])!
    var sameTime = [[String]]()
    for a in answer {
        if maxTime == Int(a[1])! {
            sameTime.append(a)
        }
    }
    //같은 시간인게 단순히 한개라면, 그냥 단순한 리턴
    if sameTime.count == 1 {
        return sameTime[0][0]
    }
    //같은 시간이 여러개면 먼저 입력된 것이 정답
    sameTime.sort { a1, a2 in
        Int(a1[2])! < Int(a2[2])!
    }
    return sameTime[0][0]
}

print(solution("CC#BCC#BCC#BCC#B",["03:00,03:30,FOO,CC#B", "04:00,04:08,BAR,CC#BCC#BCC#B"]))
