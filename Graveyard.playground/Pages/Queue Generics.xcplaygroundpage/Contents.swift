
import Foundation
//private set means array only can be set within the struct.
struct NumberQueue {
    private(set) var elements = [Int]()
    
    mutating func push(element: Int) {
        elements.append(element)
    }
    mutating func pop() -> Int? {
        guard elements.isEmpty == false else { return nil }
        return elements.removeFirst()
    }
}

var deliNumbers = NumberQueue(elements: [55, 56, 57])

print(deliNumbers.elements)
deliNumbers.push(element: 58)
print(deliNumbers.elements)
deliNumbers.pop()
print(deliNumbers.elements)
deliNumbers.pop()
deliNumbers.pop()
deliNumbers.pop()
deliNumbers.pop()
deliNumbers.pop()
print(deliNumbers.elements)


//Generic

struct QueueStack<T> {
    private(set) var elements = [T]()
       
       mutating func push(element: T) {
           elements.append(element)
       }
       mutating func pop() -> T? {
           guard elements.isEmpty == false else { return nil }
           return elements.removeFirst()
       }
}

var stack = QueueStack(elements: ["John", "Dave"])

print(stack.elements)

stack.pop()
print(stack.elements)

stack.push(element: "Random")

print(stack.elements)


//multiple types in one stack 👇
var stuff = QueueStack(elements: ["Mathew", 45, ["key" : "value"]])

stuff.push(element: 3)

print(stuff.elements)
