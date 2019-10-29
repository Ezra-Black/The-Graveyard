import Foundation
//MARK: Closures

        //simple closure
let driving1 = {
    print("I'm driving to my car")
}

driving1()

        // MARK: parameters within a closure
let driving2 = { (place: String) in
    print("I am going to \(place) in my car")

}

driving2("London")

    //more examples:

var click = { (button: Int) in
    if button >= 0 {
        print("Button \(button) was clicked")
    } else {
        print("That button doesn't exist")
    }
}

click(9)

var sendMessage = { (message: String) in
    if message != "" {
        print("Sending to Twitter: \(message)")
    }else{
        print("Your message was empty")
    }
}
sendMessage("Welcome to Twitter")

let rowBoat = { (distance: Int) in
    for _ in 1...distance {
        print("I'm rowing 1 mile")
    }
}
rowBoat(5)

//MARK: Returning values from a closure
//you can actually return value instead of just printing out information. do this by adding -> and a return type afterwards. right before your "in" and after your first bracket.

let drivingWithReturn = { (place: String) -> String in
    return "I am going to \(place) in my car."
}

let message = drivingWithReturn("St. Louis")
print(message)

//more examples:

var hasGuitar = { (hasGuitar: Bool) -> Bool in
    if hasGuitar {
        print("Hey! I noticed you have a guitar! You wanna jam?")
        return true
    }else {
        print("Man you need some new gear")
        return false
    }
}
hasGuitar(true)

//MARK: Closures as parameters
//this is going to hurt your brain at first. Seriously.

let driving3 = {
    print("I amdriving in my car.")
}

func travel(action: () -> Void) {
    print("Im getting ready to go")
    action()
    print("I arrived!")
}

travel(action: driving3)

let evilRobot = {
    print("EXTERMINATE")
}
let goodRobot = {
    print("I will care for you beep boop")
}
let depressedRobot = {
    print("What is my purpose? To spread butter?")
}

func buildRobot(personality: () -> Void) {
    print("time to turn on the robot!")
    personality()
}
buildRobot(personality: evilRobot)

//MARK: Trailing syntax closures
//if a closure is the last paramater in a function it can be refactored as such


func travel1(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}
//1
travel1() {
    print("I'm driving in my car")
}
//2- since there are no parameters in the closure, there is no need for "()"
travel {
    print("I am driving in my car")
}
//both of these serve the same purpose

let newYork = {
    print("Were Going to New york")
}
let chicago = {
    print("Were Going to Chicago")
}

func cityToTravelTo(city: () -> Void) {
    print("where are we going?")
    city()
    print("We arrived safely to our destination")
}

cityToTravelTo(city: newYork)


struct IntToStringConverter {
    // A closure property that takes an Int as input
    // and produces a String as output:
    var body: (Int) -> String
}

// A closure defined as an inline variable, which
// takes no input and produces an Int as output:
let intProvider: () -> Int = { return 7 }

// A closure function argument that takes no input
// and also doesn't produce any output:
func performOperation(then closure: () -> Void) {
    
}

extension String {
    func transformWords(
        using closure: (Substring) -> String
    ) -> String {
        // Split the current string up into word substrings:
        let words = split(separator: " ")
        var results = [String]()

        // Iterate through each word and transform it:
        for word in words {
            // We can call the closure that was passed into our
            // function just like how we'd call a function:
            let transformed = closure(word)
            results.append(transformed)
        }

        // Join our results array back into a string:
        return results.joined(separator: " ")
    }
}
