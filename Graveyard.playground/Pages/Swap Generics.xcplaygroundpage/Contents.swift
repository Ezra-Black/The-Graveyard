////: [Previous](@previous)
//
//import Foundation
////
var x = 5
var y = 10
////
//
//
//func exchange<Element>(lhs: inout Element, rhs: inout Element) {
//    let placeHolder = lhs
//    lhs = rhs
//    rhs = placeHolder
//}
////print(x, y)
////exchange(lhs: &x, rhs: &y)
////print(x, y)
//
//var first = "eric"
//var second = "Dave"
//exchange(lhs: &first, rhs: &second)
//
//print(first, second)
//

//custom infixed operater

infix operator <=>

func <=> <T>(lhs: inout T, rhs: inout T) {
    print("custom operation called")
    let placeholder = lhs
    lhs = rhs
    rhs = placeholder
}


print(x)
print(y)
x <=> y
print(x)
print(y)



