//import Foundation
//import PlaygroundSupport
//
//PlaygroundPage.current.needsIndefiniteExecution = true
//
//
//let queue1 = DispatchQueue(label: "queue1")
//let queue2 = DispatchQueue(label: "queue2")
//
//queue1.sync {
//    print("Starting work on queue 1")
//    
//    queue2.async {
//           print("Starting work on queue 2")
//        sleep(1)
//     print("finished work on queue 2")
//    }
//    print("Finished work on queue 1")
//}
//
//print("Done")
