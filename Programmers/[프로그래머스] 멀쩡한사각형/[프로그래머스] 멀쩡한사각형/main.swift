import Foundation

func solution(_ w:Int, _ h:Int) -> Int64{
    var answer:Int64 = 0
    if w == h {
        answer = Int64(w*h - w)
    }
    else {
        if w % 2 == 0 {
            let total = w * h
            var not = 0
            if h % 2 != 0 {
                not += (h/2)+1
            }
            not *= (w/2)
            answer = Int64(total - not)
        }
    }
    return answer
}
