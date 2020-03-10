
import Foundation

func power(value: Int, exponent: Int) -> Int {
    var result: Int = 1
    
    for _ in 0..<exponent {
        result *= value
    }
    
    return result
}

//let result = power(value: 5, exponent: 2)
//print(result)



//Generic version
func power<T: Numeric>(value: T, exponent: Int) -> T {
    var result: T = 1
    
    for _ in 0..<exponent {
        result *= value
    }
    
    return result
}

power(value: 323450.123, exponent: 2)


//custom operator

infix operator **

func **<T: Numeric>(value: T, exponent: Int) -> T {
    var result: T = 1
    
    for _ in 0..<exponent {
        result *= value
    }
    
    return result
}


4 ** 2

//extensions on protocols to make things simpler


//Self = type------self = value
extension Numeric {
    func raisedTo(exponent: Int) -> Self {
        var result: Self = 1
        
        for _ in 0..<exponent {
            result *= self
        }
        return result
    }
    
    mutating func raiseTo(exponent: Int) {
        var result: Self = 1
        
        for _ in 0..<exponent {
            result *= self
        }
        self = result
    }
}

let number: Double = 10
let raisedNumber = number.raisedTo(exponent: 4)

var otherNumber = 7
print(otherNumber)
otherNumber.raiseTo(exponent: 5)
print(otherNumber)
