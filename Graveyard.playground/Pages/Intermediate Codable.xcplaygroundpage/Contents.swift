//import Foundation
//
//
//enum CodingKeys: String, CodingKey {
//    case name
//    case age
//}
//
//struct Person: Codable {
//    var name: String
//    var age: Int
//
//    init(name: String, age: Int) {
//        self.name = name
//        self.age = age
//    }
//    init(from decoder: Decoder) throws {
//
//        // 1
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//
//        // 2
//        let name = try container.decode(String.self, forKey: .name)
//        let age = try container.decode(Int.self, forKey: .age)
//
//        // 3
//        self.name = name
//        self.age = age
//    }
//}
//
//func encode(to encoder: Encoder) throws {
//
//    var container = encoder.container(keyedBy: CodingKeys.self)
//
//    try container.encode(name, forKey: .name)
//    try container.encode(age, forKey: .age)
//    try container.encode(favoriteNumbers, forKey: .favoriteNumbers)
//}


