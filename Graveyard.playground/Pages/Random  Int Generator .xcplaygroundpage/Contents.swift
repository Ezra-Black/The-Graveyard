import Foundation


protocol GeneratesRandomNumbers { //here we are creating a protocol which can generate numbers. it only needs to have the placeholders
    func random() -> Int
}

class OneThroughTen: GeneratesRandomNumbers { //this is the numbers we will be going through with the generator confromed to it!
    func random() -> Int {
        
        return Int.random(in: 1...10) //our generator just uses swifts built in random generator
    }
}
