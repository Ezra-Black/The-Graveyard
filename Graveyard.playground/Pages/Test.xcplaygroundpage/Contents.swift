//: [Previous](@previous)

import Foundation

var array = [4,4,13,2,3]

func maxTickets(tickets: [Int]) -> Int {
    
    
    var t = tickets
    var arr: [Int] = []
    t.sort()
    for i in t {
        var a = i
        for s in t {
            if s == a + 1 || s == a - 1 {
                arr.append(s)
            }
        }
    }
    print(arr)
    return arr.count - 2
}

maxTickets(tickets: array)

//: [Next](@next)
