struct People {
    var name: String
    var ko: Int
    var en: Int
    var ma: Int
    init(name: String, ko: Int, en: Int, ma: Int) {
        self.name = name
        self.ko = ko
        self.en = en
        self.ma = ma
    }
}

func solution() {
    var number = Int(readLine()!)!
    var list = [People]()
    for i in 0..<number {
        let info = readLine()!.split(separator: " ").map { String($0) }
        let p = People(name: info[0], ko: Int(info[1])!, en: Int(info[2])!, ma: Int(info[3])!)
        list.append(p)
    }
//    list.sort { (p1, p2) -> Bool in
//        print(" ")
//        print(p1, p2)
////        print(list)
//        if p1.ko == p2.ko {
//            if p2.en == p2.en {
//                if p1.ma == p2.ma {
//                    return p1.name < p2.name
//                }
//                else {
//                    return p1.ma > p2.ma
//                }
//            }
//            else {
//                return p1.en < p2.en
//            }
//        }
//        else {
//            return p1.ko > p2.ko
//        }
//    }
    list.sort { (p1, p2) -> Bool in
        return p1.ko > p2.ko
    }
    list.sort { (p1, p2) -> Bool in
        if p1.ko == p2.ko {
            return p1.en < p2.en
        }
        return p1.ko > p2.ko
    }
    list.sort { (p1, p2) -> Bool in
        if p1.en == p2.en && p1.ko == p2.ko{
            return p1.ma > p2.ma
        }
        else {
            if p1.ko == p2.ko {
                return p1.en > p2.en
            }
            return p1.ko > p2.ko
        }
    }
    list.sort { (p1, p2) -> Bool in
        if p1.ma == p2.ma && p1.en == p2.en && p1.ko == p2.ko{
            return p1.name < p2.name
        }
        else {
            if p1.en == p2.en && p1.ko == p2.ko{
                return p1.ma > p2.ma
            }
            else {
                if p1.ko == p2.ko {
                    return p1.en < p2.en
                }
                return p1.ko > p2.ko
            }
        }
    }
    for i in list {
        print(i.name)
    }
}


solution()
