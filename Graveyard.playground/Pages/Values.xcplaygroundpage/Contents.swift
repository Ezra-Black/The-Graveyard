import Foundation

//raw values:

enum Directions: String {
    case north
    case south
    case east
    case west
}

print(Directions.south.rawValue)


enum Digit {
    case decimalPoint
    case number(Int)
    
    
}

let eight = Digit.number(8)

let one = Digit.number(10)

//switch case let syntax

//if case let syntax
