
import Foundation



let array = [2, 1, 3, 5, 3, 6, 4, 5, 2, 3, 7, 8, 4, 5, 9, 3]


// Write a removeDuplicates(array:) func

/*
func removeDuplicates(array: [Int]) -> [Int] {
    var result: [Int] = []
    
    for item in array {
        if !result.contains(item) {
            result.append(item)
        }
    }
    
    return result
}
 */

// print(removeDuplicates(array: array))


// Generic

//func removeDuplicates<Element: Equatable>(array: [Element]) -> [Element] {
//    var result: [Element] = []
//
//    for item in array {
//        if !result.contains(item) {
//            result.append(item)
//        }
//    }
//
//    return result
//}


//func removeDuplicates<Element: Hashable>(array: [Element]) -> [Element] {
//    let set = Set(array)
//    return Array(set)
//}



func removeDuplicates<S: Sequence>(sequence: S) -> [S.Element] where S.Element: Hashable {
    let result: Set<S.Element> = Set(sequence)
    return Array(result)
}


print(removeDuplicates(sequence: array))





