
import Foundation
//private set means array only can be set within the struct.
struct NumberQueue {
    //this is so it only knows that it is a list of elements. the elements themselves don't need to know about the structure they are in.
    private(set) var elements = [Int]()
    
    //any time something is manipulating the structure it is within, any functions, they need to be mutating
    
    //this is making it to where we can push items ONTO the queue.
    mutating func push(element: Int) {
        elements.append(element)
    }
    //this is so we can pop OFF the queue.
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
        guard elements.isEmpty == false else {
            print("the Queue is empty")
            return nil }
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
