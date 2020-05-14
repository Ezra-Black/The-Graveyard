let df = DateFormatter()
       df.dateStyle = .short
       df.timeStyle = .short
       timeSeenLabel.text = df.string(from: animal.timeSeen)

let decoder = JSONDecoder() // can throw an error so throw it in a do block
           decoder.dateDecodingStrategy = .secondsSince1970
           do {
               let animal = try decoder.decode(Animal.self, from: data)
               completion(.success(animal))
           } catch {
               NSLog("Error decoding animal object: \(error)")
               completion(.failure(.decodeError))
               return
           }
       }.resume()
