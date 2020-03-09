import UIKit

struct Person: Codable {
    
    enum PersonKeys: String, CodingKey {
        case name
        case height
        case hairColor = "hair_color"
        case created
        case films
        case vehicles
        case starships
    }
    
    let name: String
    let height: Int // cm
    let hairColor: String
    let created: Date
    let filmURLs: [URL]
    let vehicleURLs: [URL]
    let starshipURLs: [URL]
    
    
    //custom decoder
    init(from decoder: Decoder) throws {
        //container == Dictionary in JSON
        //unKyedContainer == Array
        let container = try decoder.container(keyedBy: PersonKeys.self)
        
        name = try container.decode(String.self, forKey: .name) //PersonKeys.name
        hairColor = try container.decode(String.self, forKey: .hairColor)
        
        do {
          height = try container.decode(Int.self, forKey: .height)
        } catch {
            let heightString = try container.decode(String.self, forKey: .height)
            height = Int(heightString) ?? 0
        }
        
        created = try container.decode(Date.self, forKey: .created)
        //decoding nested json array of properties
        filmURLs = try container.decode([URL].self, forKey: .films)
        
        let vehicleURLStrings = try container.decode([String].self, forKey: .vehicles)
        //compact map only gets arrays no optionals
        vehicleURLs = vehicleURLStrings.compactMap { URL(string: $0) }
        
        var starshipsContainer = try container.nestedUnkeyedContainer(forKey: .starships)
        var starshipURLs: [URL] = []
        
        
        
        while starshipsContainer.isAtEnd == false {
            let starshipString = try starshipsContainer.decode(String.self)
            if let starShipURL = URL(string: starshipString) {
                starshipURLs.append(starShipURL)
            }
        }
        
        self.starshipURLs = starshipURLs
    }
}

let url = URL(string: "https://swapi.co/api/people/1/")!
let data = try! Data(contentsOf: url)

//print(String(data: data, encoding: .utf8)!)

let decoder = JSONDecoder()
//decoder.keyDecodingStrategy = .convertFromSnakeCase


//Date Formatter
var dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
decoder.dateDecodingStrategy = .formatted(dateFormatter)


let luke = try! decoder.decode(Person.self, from: data)

print(luke)
